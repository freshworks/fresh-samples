Imports System.Net
Imports System.Text
Imports System.IO

Class Program
	Public Shared Sub Main()
		Dim test As String = [String].Empty
		

		Dim request As HttpWebRequest = DirectCast(WebRequest.Create("http://domain.freshdesk.com/helpdesk/tickets.json"), HttpWebRequest)
		request.ContentType = "application/json"
		request.Method = "GET"
		Dim authInfo As String = "Api_key:X"
		authInfo = Convert.ToBase64String(Encoding.[Default].GetBytes(authInfo))
		request.Headers("Authorization") = "Basic " & authInfo
		Using response As HttpWebResponse = DirectCast(request.GetResponse(), HttpWebResponse)
			Dim dataStream As Stream = response.GetResponseStream()
			Dim reader As New StreamReader(dataStream)
			test = reader.ReadToEnd()
			reader.Close()
			dataStream.Close()
		End Using
		Console.Out.WriteLine(test)
	End Sub
End Class