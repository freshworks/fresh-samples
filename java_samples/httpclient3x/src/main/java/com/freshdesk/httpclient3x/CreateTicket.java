package com.freshdesk.httpclient3x;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.httpclient.methods.StringRequestEntity;

/**
 *
 * @author subhash
 */
public class CreateTicket {
    public int createTicket(String apiToken, String apiEndpoint)
            throws UnsupportedEncodingException, IOException {
        HttpClient client = new HttpClient();
        PostMethod method = new PostMethod(apiEndpoint + "/helpdesk/tickets.json");
        
        // Headers:
        method.addRequestHeader(new Header("Content-type", "application/json"));
        method.addRequestHeader(new Header("Authorization",
                "Basic " + Base64.getEncoder().encodeToString(
                        (apiToken + ":X").getBytes("utf-8"))));
        
        // Body:
        final String createJson = "{\"helpdesk_ticket\":{\"description\":\"Some details on the issue ...\",\"subject\":\"Support needed..\",\"email\":\"tom@outerspace.com\",\"priority\":1,\"status\":2},\"cc_emails\":\"ram@freshdesk.com,diana@freshdesk.com\"}";
        RequestEntity entity = new StringRequestEntity(
                createJson, "application/json", "utf-8");
        method.setRequestEntity(entity);
        
        // Execute:
        final int status = client.executeMethod(method);
        System.out.println("Response status: " + status);
        
        final String responseBody = method.getResponseBodyAsString();
        System.out.println("Response body:\n" + responseBody);
        
        return status;
    }
}
