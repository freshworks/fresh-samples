package com.example;
import java.io.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;


import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;

public class CreateTicket {
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		   OutputStreamWriter writer=null;
		    BufferedReader rd=null;
		    HttpClient httpclient=null;
		    httpclient = new DefaultHttpClient();


		    try {

			   HttpPost httppost = new HttpPost("https://yourcompany.freshdesk.com/helpdesk/tickets.json");

		      String username="johnpaul@freshdesk.com";//username or api key
		      String password = "test";// password or default X for apiKey
		      String userpassword = username + ":" + password;



		    	MultipartEntity reqEntity = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE );

		      FileBody bin = new FileBody(new File("tommy.jpg"));
		      reqEntity.addPart("helpdesk_ticket[attachments[][resource]]",bin);

		      reqEntity.addPart("helpdesk_ticket[email]", new StringBody("sample123@freshdesk.com", "text/plain",
                      Charset.forName( "UTF-8" )));

		      reqEntity.addPart("helpdesk_ticket[description]", new StringBody("ticket new 1 creation", "text/plain",
                      Charset.forName( "UTF-8" )));



		      httppost.setHeader("Authorization", "Basic " + Base64.encodeBase64String(userpassword.getBytes()));
		      httppost.setEntity(reqEntity);

		      HttpResponse response = httpclient.execute(httppost);

		      System.out.println("DEBUG OUTPUT:: "+response.getStatusLine());


		 // Get hold of the response entity
		 HttpEntity entity = response.getEntity();

		 // If the response does not enclose an entity, there is no need
		 // to worry about connection release
		 if (entity != null) {
		     InputStream instream = entity.getContent();
		     try {

		         BufferedReader reader = new BufferedReader(
		                 new InputStreamReader(instream));
		         // do something useful with the response
		         System.out.println(reader.readLine());

		     } catch (IOException ex) {

		         // In case of an IOException the connection will be released
		         // back to the connection manager automatically
		         throw ex;

		     } finally {

		         // Closing the input stream will trigger connection release
		         instream.close();

		     }



		 	}


		    } catch (Exception e) {

		      e.printStackTrace();
		    }
		    finally{
		    		try {
		    	    	if(writer!=null){
		    	    		writer.close();
		    	     	}
		    	    	if(rd!=null){
				    		rd.close();
				    	}

					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

		    }

	}

}
