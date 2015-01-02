using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
        string json = "{ \"solution_article\": { \"title\":\"Create a ticket\", \"status\":1, \"art_type\":2, \"description\":\"Steps: Fill in the mandatory fields ...\",\"folder_id\":1 }, \"tags\":{\"name\": \"tag1,tag2\"}}";
        // Example  HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/solution/categories/1/folders/1/articles.json"); 
        // Art type options :  1 - permanent, 2 - workaround
        // Status option:  1 - draft, 2 - published
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/solution/categories/[category_id]/folders/[folder_id]/articles.json"); 
        //HttpWebRequest class is used to Make a request to a Uniform Resource Identifier (URI).  
        request.ContentType = "application/json"; 
        // Set the ContentType property of the WebRequest. 
        request.Method = "POST"; 
        byte[] byteArray = Encoding.UTF8.GetBytes(json); 
        // Set the ContentLength property of the WebRequest. 
        request.ContentLength = byteArray.Length;  
        string authInfo = "Api_Key:X";
        authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo));
        request.Headers["Authorization"] ="Basic "+authInfo;

        //Get the stream that holds request data by calling the GetRequestStream method. 
        Stream dataStream = request.GetRequestStream(); 
        // Write the data to the request stream. 
        dataStream.Write(byteArray, 0, byteArray.Length); 
        // Close the Stream object. 
        dataStream.Close(); 
        WebResponse response = request.GetResponse(); 
        // Get the stream containing content returned by the server.
        //Send the request to the server by calling GetResponse. 
        dataStream = response.GetResponseStream(); 
        // Open the stream using a StreamReader for easy access. 
        StreamReader reader = new StreamReader(dataStream); 
        // Read the content. 
        string Response = reader.ReadToEnd(); 
        //return the response 
        Console.Out.WriteLine(Response);

    }
}