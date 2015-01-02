using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
      string test = String.Empty;
      // sample with agent email
      // HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/time_sheets.json?email=test@freshdesk.com",
      
      // sample with agent id
      // Example : HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/time_sheets.json?agent_id=2");  
      // Here agent_id refers to the user_id of the agent
      HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/time_sheets.json?agent_id=[value]");  
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