using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
        string fdDomain = "domain.freshdesk.com";
        string apiKey = "YOUR_API_KEY"
        // Example :   HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://" + fdDomain + "/api/v2/tickets/1"); 
        HttpWebRequest request = (HttpWebRequest)WebRequest.Create("https://" + fdDomain + "/api/v2/tickets/[id]"); 
        //HttpWebRequest class is used to Make a request to a Uniform Resource Identifier (URI).  
        request.ContentType = "application/json"; 
        // Set the ContentType property of the WebRequest. 
        request.Method = "DELETE"; 
        
        string authInfo = apiKey + ":X"; // It could be your username:password also.
        authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo));
        request.Headers["Authorization"] ="Basic "+authInfo;

        try
        {
            Console.WriteLine("Submitting Request");
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
        catch (WebException ex)
        {
            Console.WriteLine("Error Headers: {0}", ex.Response.Headers);
            Console.WriteLine("Error Status Code : {1} {0}", ((HttpWebResponse)ex.Response).StatusCode, (int)((HttpWebResponse)ex.Response).StatusCode);
            using (var stream = ex.Response.GetResponseStream())
            using (var reader = new StreamReader(stream))
            {   
                Console.Write("Error Response: ");
                Console.WriteLine(reader.ReadToEnd());
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine("ERROR");
            Console.WriteLine(ex.Message);
        }

    }
}