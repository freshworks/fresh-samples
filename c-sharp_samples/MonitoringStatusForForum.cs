using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
      string test = String.Empty;
      //Note : 1. If user_id is not mentioned, the apiKey or user/password passed for the api call will be taken as the user for whom the monitor status is to be checked.
      //       2. Only admin can check monitoring status for other users.
      //Example: HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/discussions/forum/14583/subscriptions/is_following.json?user_id=1791107");  
      HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/discussions/forum/[forum_id]/subscriptions/is_following.json?user_id=[user_id]");  
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