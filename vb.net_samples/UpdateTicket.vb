Imports System.Net
Imports System.Text
Imports System.IO

Class Program
	Public Shared Sub Main()
		Dim json As String = "{  ""helpdesk_ticket"" : {""priority"" : 1,""status"" : 2  },  ""helpdesk"" : {""tags"" : ""csv1,csv2""  }}"
		' Example :   HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://domain.freshdesk.com/helpdesk/tickets/1.json"); 
		Dim request As HttpWebRequest = DirectCast(WebRequest.Create("http://domain.freshdesk.com/helpdesk/tickets/[id].json"), HttpWebRequest)
		'HttpWebRequest class is used to Make a request to a Uniform Resource Identifier (URI).  
		request.ContentType = "application/json"
		' Set the ContentType property of the WebRequest. 
		request.Method = "PUT"
		Dim byteArray As Byte() = Encoding.UTF8.GetBytes(json)
		' Set the ContentLength property of the WebRequest. 
		request.ContentLength = byteArray.Length
		Dim authInfo As String = "Api_key:X"
		authInfo = Convert.ToBase64String(Encoding.[Default].GetBytes(authInfo))
		request.Headers("Authorization") = "Basic " & authInfo

		'Get the stream that holds request data by calling the GetRequestStream method. 
		Dim dataStream As Stream = request.GetRequestStream()
		' Write the data to the request stream. 
		dataStream.Write(byteArray, 0, byteArray.Length)
		' Close the Stream object. 
		dataStream.Close()
		Dim response__1 As WebResponse = request.GetResponse()
		' Get the stream containing content returned by the server.
		' Send the request to the server by calling GetResponse. 
		dataStream = response__1.GetResponseStream()
		' Open the stream using a StreamReader for easy access. 
		Dim reader As New StreamReader(dataStream)
		' Read the content. 
		Dim Response__2 As String = reader.ReadToEnd()
		'return the response 
		Console.Out.WriteLine(Response__2)

	End Sub
End Class
