using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
        string json = "{ \"solution_article\": { \"title\":\"Steps to create a ticket\", \"description\":\"Steps: 1. Fill in the mandatory fields ...\" }}";
        //Example: HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/solution/categories/4/folders/1/articles/1.json"); 
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/solution/categories/[category_id]/folders/[folder_id]/articles/[article_id].json"); 
        //HttpWebRequest class is used to Make a request to a Uniform Resource Identifier (URI).  
        request.ContentType = "application/json"; 
        // Set the ContentType property of the WebRequest. 
        request.Method = "PUT"; 
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
        // Send the request to the server by calling GetResponse. 
        dataStream = response.GetResponseStream(); 
        // Open the stream using a StreamReader for easy access. 
        StreamReader reader = new StreamReader(dataStream); 
        // Read the content. 
        string Response = reader.ReadToEnd(); 
        //return the response 
        Console.Out.WriteLine(Response);

    }
}