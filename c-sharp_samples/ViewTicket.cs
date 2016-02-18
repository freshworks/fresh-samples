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
      string test = String.Empty;
      HttpWebRequest request =(HttpWebRequest)WebRequest.Create("https://" + fdDomain + "/api/v2/tickets/1");  
      request.ContentType = "application/json"; 
      request.Method = "GET"; 
      string authInfo = apiKey + ":X"; // It could be your username:password also.
      authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo));
      request.Headers["Authorization"] ="Basic "+authInfo;
      try
      {
          Console.WriteLine("Submitting Request");
          using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
          {
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            test = reader.ReadToEnd();
            reader.Close();
            dataStream.Close();
          }  
          Console.Out.WriteLine(test);
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