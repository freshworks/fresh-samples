using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
      string test = String.Empty;
      // Note : by default, billable = true if not any filters specified.
      // Example : HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/time_sheets.json?billable=false");  
      HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/time_sheets.json?billable=[value]");  
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