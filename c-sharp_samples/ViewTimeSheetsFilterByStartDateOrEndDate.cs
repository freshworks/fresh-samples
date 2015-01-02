using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
      string test = String.Empty;
      // Note: start_date and end_date filters the time sheets which were executer between those dates.
      // Example : HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/time_sheets.json?start_date=2015-01-01T21:13:34+05:30&end_date=2015-02-01T21:13:34+05:30");  
      HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/time_sheets.json?start_date=[value]");  
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