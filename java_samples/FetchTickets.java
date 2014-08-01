package com.example;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;

import org.apache.http.client.methods.HttpGet;

import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;
import org.apache.commons.codec.binary.Base64; 

/**
 * A simple example that uses HttpClient to execute an HTTP GET request against
 * a target site that requires user authentication.
 */
public class FetchTickets {

    public static void main(String[] args) throws Exception {
        DefaultHttpClient httpclient = new DefaultHttpClient();
        BufferedReader rd=null;
        try {

			String username="johnpaul@freshdesk.com";//apikey or email
			String password = "test";// X or  password.
			String api_key = username+":"+password;
            HttpGet httpGet = new HttpGet("http://yourcompany.freshdesk.com/helpdesk/tickets.xml");//replace with your company url. If ssl enable handle it.
            //Authorization part note the space after "Basic "
            httpGet.setHeader("Authorization","Basic "+Base64.encodeBase64String(api_key.getBytes()));  

			String contentType = "*/*";
			httpGet.setHeader("Accept", contentType);
			//Set the content type.
            httpGet.addHeader("Content-Type","application/xml");
            
            
            System.out.println("executing request" + httpGet.getRequestLine());
            HttpResponse response = httpclient.execute(httpGet);
            HttpEntity result_entity = response.getEntity();

            System.out.println("----------------------------------------");
            System.out.println(response.getStatusLine());

            if (result_entity != null) {
                System.out.println("Response content length: " + result_entity.getContentLength());
                rd = new BufferedReader(new InputStreamReader(result_entity.getContent()));
      	      	String line =null;
                while(( line = rd.readLine())!=null){
  			      System.out.println(line);  
  		      }
            }
        
            EntityUtils.consume(result_entity);
        } finally {
        	if(rd!=null)
        	{
        		rd.close();
        	}
            System.out.println("Finished.");
        }
    }
}
