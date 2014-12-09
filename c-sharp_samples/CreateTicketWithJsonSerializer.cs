// This code snippet is an example for using java script serializer to create a json string from an anonymous object rather than building a json string manually. 
// This program requires System.Web.Extensions.dll to be referenced. 
// The assembley System.Web.Extensions.dll is part of .NET 3.5 framework onwards. It won't be visible if the project is targeting .NET 3.5/4 framework client profile
using System;
using System.Net;
using System.Text;
using System.IO;
using System.Web.Script.Serialization;

class Program
{
    static void Main()
    {
        var jsonObject = new { helpdesk_ticket = new {email = "test@test.com", subject = "test", description = "confirm whether received"}};
       
        string json = new JavaScriptSerializer().Serialize(jsonObject);
       
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/tickets.json"); 
        //HttpWebRequest class is used to Make a request to a Uniform Resource Identifier (URI).  
        request.ContentType = "application/json"; 
        // Set the ContentType property of the WebRequest. 
        request.Method = "POST"; 
        byte[] byteArray = Encoding.UTF8.GetBytes(json); 
        // Set the ContentLength property of the WebRequest. 
        request.ContentLength = byteArray.Length;  
        string authInfo = "APIKEY:X";
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