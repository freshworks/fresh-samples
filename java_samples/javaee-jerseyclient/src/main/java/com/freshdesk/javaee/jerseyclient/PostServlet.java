package com.freshdesk.javaee.jerseyclient;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Properties;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import org.glassfish.jersey.client.authentication.HttpAuthenticationFeature;
import org.wiztools.commons.XmlEntityEncode;

/**
 *
 * @author subhash
 */
@WebServlet(name = "PostServlet", urlPatterns = {"/post.servlet"})
public class PostServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String requestorEmail = request.getParameter("requestor-email");
        final String title = request.getParameter("title");
        final String description = request.getParameter("description");
        
        // 1. Build JSON object:
        JsonObject ticket = Json.createObjectBuilder()
                .add("subject", title)
                .add("description", description)
                .add("email", requestorEmail)
                .add("priority", 1)
                .add("status", 2)
                .build();
        
        JsonObject req = Json.createObjectBuilder()
                .add("helpdesk_ticket", ticket)
                .build();
        
        Writer jsonOut = new StringWriter();
        try (JsonWriter jw = Json.createWriter(jsonOut)) {
            jw.writeObject(req);
        }
        final String jsonStr = jsonOut.toString();
        
        // 2. Create the request:
        Properties p = new Properties();
        try (InputStream is = getClass().getClassLoader().getResourceAsStream("/fd.properties")) {
            p.load(is);
        }
        final String apiKey = p.getProperty("fd.api.key");
        final String domain = p.getProperty("fd.domain");
        
        Client client = ClientBuilder.newClient();
        
        HttpAuthenticationFeature feature = HttpAuthenticationFeature.basic(apiKey, "X");
        client.register(feature);
        
        Entity<String> entity = Entity.entity(jsonStr, MediaType.APPLICATION_JSON_TYPE);
        
        WebTarget target = client.target(domain);
        String fdRes = target.path("helpdesk").path("tickets.json")
                .request(MediaType.APPLICATION_JSON_TYPE)
                .build("POST", entity).invoke(String.class);
        
        try(PrintWriter out = response.getWriter()) {
            out.println("<html>");
            out.println("<body>");
            
            out.println("<h1>Thanks! API Response:</h1>");
            out.println("<textarea rows='25' cols='60'>");
            out.println(XmlEntityEncode.encode(fdRes));
            out.println("</textarea>");
            
            out.println("</body>");
            out.println("</html>");
        }
    }

}
