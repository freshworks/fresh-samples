Imports System.Net
Imports System.Text
Imports System.IO
 
Class Program
	Public Shared Sub Main()
		Dim json As String = "{""helpdesk_ticket"": {""email"":""test@test.com"",""subject"":""test"",""description"":""confirm whether received""}}"
		Dim request As HttpWebRequest = DirectCast(WebRequest.Create("http://domain.freshdesk.com/helpdesk/tickets.json"), HttpWebRequest)
		'HttpWebRequest class is used to Make a request to a Uniform Resource Identifier (URI).  
		request.ContentType = "application/json"
		' Set the ContentType property of the WebRequest. 
		request.Method = "POST"
		Dim byteArray As Byte() = Encoding.UTF8.GetBytes(json)
		' Set the ContentLength property of the WebRequest. 
		request.ContentLength = byteArray.Length
		Dim authInfo As String = "Api_Key:X"
		authInfo = Convert.ToBase64String(Encoding.[Default].GetBytes(authInfo))
		request.Headers("Authorization") = "Basic " & authInfo
 
		'Get the stream that holds request data by calling the GetRequestStream method. 
		Dim dataStream As Stream = request.GetRequestStream()
		' Write the data to the request stream. 
		dataStream.Write(byteArray, 0, byteArray.Length)
		' Close the Stream object. 
		dataStream.Close()
		Dim web_response As WebResponse = request.GetResponse()
		' Get the stream containing content returned by the server.
		'Send the request to the server by calling GetResponse. 
		dataStream = web_response.GetResponseStream()
		' Open the stream using a StreamReader for easy access. 
		Dim reader As New StreamReader(dataStream)
		' Read the content. 
		Dim response As String = reader.ReadToEnd()
		'return the response 
		Console.Out.WriteLine(response)
 
	End Sub
End Class