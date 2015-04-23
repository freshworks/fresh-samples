Imports System.IO
Imports System.Net
Imports System.Text

Namespace FreshdeskTest
	Class CreateTicketWithAttachment
		Private Const _APIKey As String = "dmOra0rbCOgI3R9lPna"
		Private Const _Url As String = "http://googlehelper.freshdesk.com/helpdesk/tickets.json"
		' verify if you have to use http or https for your account
		Private Shared Sub writeCRLF(o As Stream)
			Dim crLf As Byte() = Encoding.ASCII.GetBytes(vbCr & vbLf)
			o.Write(crLf, 0, crLf.Length)
		End Sub

		Private Shared Sub writeBoundaryBytes(o As Stream, b As String, isFinalBoundary As Boolean)
			Dim boundary As String = If(isFinalBoundary = True, "--" & b & "--", "--" & b & vbCr & vbLf)
			Dim d As Byte() = Encoding.ASCII.GetBytes(boundary)
			o.Write(d, 0, d.Length)
		End Sub

		Private Shared Sub writeContentDispositionFormDataHeader(o As Stream, name As String)
			Dim data As String = "Content-Disposition: form-data; name=""" & name & """" & vbCr & vbLf & vbCr & vbLf
			Dim b As Byte() = Encoding.ASCII.GetBytes(data)
			o.Write(b, 0, b.Length)
		End Sub

		Private Shared Sub writeContentDispositionFileHeader(o As Stream, name As String, fileName As String, contentType As String)
			Dim data As String = "Content-Disposition: form-data; name=""" & name & """; filename=""" & fileName & """" & vbCr & vbLf
			data += "Content-Type: " & contentType & vbCr & vbLf & vbCr & vbLf
			Dim b As Byte() = Encoding.ASCII.GetBytes(data)
			o.Write(b, 0, b.Length)
		End Sub

		Private Shared Sub writeString(o As Stream, data As String)
			Dim b As Byte() = Encoding.ASCII.GetBytes(data)
			o.Write(b, 0, b.Length)
		End Sub

		Public Shared Sub Main(args As String())
			Console.WriteLine("Application starting...")

			' Define boundary:
			Dim boundary As String = "----------------------------" & DateTime.Now.Ticks.ToString("x")

			' Web Request:
			Dim wr As HttpWebRequest = DirectCast(WebRequest.Create(_Url), HttpWebRequest)

			wr.Headers.Clear()

			' Method and headers:
			wr.ContentType = "multipart/form-data; boundary=" & boundary
			wr.Method = "POST"
			wr.KeepAlive = True

			' Basic auth:
			Dim login As String = _APIKey & ":X"
			Dim credentials As String = Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(login))
			wr.Headers(HttpRequestHeader.Authorization) = "Basic " & credentials

			' Body:
			Using rs As Stream = wr.GetRequestStream()
				' Email:
				writeBoundaryBytes(rs, boundary, False)
				writeContentDispositionFormDataHeader(rs, "helpdesk_ticket[email]")
				writeString(rs, "example@example.com")
				writeCRLF(rs)

				' Subject:
				writeBoundaryBytes(rs, boundary, False)
				writeContentDispositionFormDataHeader(rs, "helpdesk_ticket[subject]")
				writeString(rs, "Ticket Title")
				writeCRLF(rs)

				' Description:
				writeBoundaryBytes(rs, boundary, False)
				writeContentDispositionFormDataHeader(rs, "helpdesk_ticket[description]")
				writeString(rs, "Ticket description.")
				writeCRLF(rs)

				' Attachment:
				writeBoundaryBytes(rs, boundary, False)
				writeContentDispositionFileHeader(rs, "helpdesk_ticket[attachments][][resource]", "data.txt", "text/plain")
				Dim fs As New FileStream("/Users/user/Desktop/data.txt", FileMode.Open, FileAccess.Read)
				Dim data As Byte() = New Byte(fs.Length - 1) {}
				fs.Read(data, 0, data.Length)
				fs.Close()
				rs.Write(data, 0, data.Length)
				writeCRLF(rs)

				' End marker:
				writeBoundaryBytes(rs, boundary, True)

				rs.Close()
			End Using

			' Response processing:
			Try
				Console.WriteLine("Submitting Request")
				Dim response = DirectCast(wr.GetResponse(), HttpWebResponse)
				Dim resStream As Stream = response.GetResponseStream()
				Dim resJson As String = New StreamReader(resStream, Encoding.ASCII).ReadToEnd()
				Console.WriteLine(resJson)
			Catch ex As Exception
				Console.WriteLine("ERROR")
				Console.WriteLine(ex.Message)
			Finally
				Console.WriteLine(Environment.NewLine)
				Console.WriteLine(Environment.NewLine)
			End Try

		End Sub

	End Class
End Namespace