using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
      string test = String.Empty;
      // Example : HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/customers.json?letter=s");  
      // the above example request will list all companies with names starting at s.
      HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/customers.json?letter=[:string]");  
      request.ContentType = "application/json"; 
      request.Method = "GET"; 
      string authInfo = "Api_Key:X";
      authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo));
      request.Headers["Authorization"] ="Basic "+authInfo;
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
}