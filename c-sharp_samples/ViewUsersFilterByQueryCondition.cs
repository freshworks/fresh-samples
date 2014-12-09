using System;
using System.Net;
using System.Text;
using System.IO;

class Program
{
    static void Main()
    {
      string test = String.Empty;
      // Example: /contacts.json?query=email is user@yourcompany.com 
      // Note: Do an url encode of the query string
      // Note:/contacts.json => will get only verified contacts by default.
      string escapedQueryString = Uri.EscapeUriString("email is example@example.com");
      HttpWebRequest request =(HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/contacts.json?query="+escapedQueryString+"&state=all");  
      request.ContentType = "application/json"; 
      request.Method = "GET"; 
      string authInfo = "Api_key:X";
      authInfo = Convert.ToBase64String(Encoding.Default.GetBytes(authInfo));
      request.Headers["Authorization"] ="Basic "+authInfo;
      using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
      { 
        Stream dataStream = response.GetResponseStream();
        Console.Out.WriteLine(response.Headers);
        StreamReader reader = new StreamReader(dataStream);
        test = reader.ReadToEnd();
        reader.Close();
        dataStream.Close();
      }  
      Console.Out.WriteLine(test);
    }
}