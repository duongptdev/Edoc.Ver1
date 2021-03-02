
Imports System.IO
Imports System.Net

Partial Class DigitalSigning
    Inherits System.Web.UI.Page

    Protected Sub cpsign_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        'Dim arr As String() = e.Parameter.Split("|")
        'Dim idfile = arr(0)
        'Dim tkk = arr(1)
        'Dim ptk = arr(2)
        'Dim ttk = arr(3)
        'Dim serv As New swEDoc.apiEdoc
        'Dim res As Integer = 0
        'res = serv.KyVB(idfile, tkk, ptk, ttk)
        'e.Result = res
        Try
            Dim typelogin As Integer = Integer.Parse(Session("ptKy").ToString)

            If typelogin = 1 Then ' ky mobile
                Dim startx, starty, endx, endy As Integer
                startx = txtstartx.Text
                starty = txtstarty.Text
                endx = txtendx.Text
                endy = txtendy.Text
                Dim width, height As Integer
                width = endx - startx
                height = starty - endy


                Dim myWebClient As New WebClient
                Dim uploadWebUrl As String = "http://27.76.138.214:8888/upload.aspx"


                Dim filetoupload As String ' = Server.MapPath("TestPDF.pdf")


                Dim urlpath As String = Session("Urlfile").ToString
                Dim baseUrl As String = Request.Url.GetLeftPart(UriPartial.Authority)
                filetoupload = Server.MapPath(urlpath.Replace(baseUrl, "~/"))
                Dim filename As String = Path.GetFileName(filetoupload)
                myWebClient.UploadFile(uploadWebUrl, filetoupload)
                Dim sign_file As String = "C:\RemoteSignTest_Beta2\RemoteService\File\" & Path.GetFileName(filetoupload)

                Dim cert_serial As String = Session("Serial").ToString()
                Dim fakeserial As String = "6" & cert_serial.Substring(1, cert_serial.Length - 1)

                Dim rect As String = startx & " " & starty & " " & startx & " 00 "

                Dim pageno = e.Parameter
                Dim datatosign As String = sign_file & ";" & width & ";" & height & ";" & pageno & ";" & rect
                Dim client As New ServiceRemote.Service
                Dim code As String = Now.ToString("yyyyMMddHHmmssfff")
                client.InsertLog(fakeserial, datatosign, "PDF", code, "0", "VCDC LAB")
                Dim kq = String.Empty
                While kq = String.Empty
                    kq = client.GetSignedText(code)

                    If Not String.IsNullOrEmpty(kq) Then
                        Dim arr As String() = kq.Split("/")
                        Dim filenames As String = arr(arr.Count - 1)
                        Dim lnk As String = "http://27.76.138.214:8888/SignedFile/" & filenames
                        'Dim res_dialog As Integer = SaveFileDialog1.ShowDialog
                        'If res_dialog = vbOK Then                            
                        'Dim savepath As String = filetoupload.Replace(filename, String.Empty)
                        'If Directory.Exists(savepath) = False Then
                        '    Directory.CreateDirectory(savepath)
                        'End If
                        'Dim fn = savepath & "\" & filename
                        Dim fn_temp = Server.MapPath("~/temp") & "\" & Now.ToString("yyyyMMddHHmmss") & "_" & filename
                        myWebClient.DownloadFile(lnk, fn_temp)
                        File.Copy(fn_temp, filetoupload, True)
                        Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
                        Dim pathview As String = urlpath
                        cpsign.JSProperties("cp_path") = pathview
                    End If
                End While

            Else

            End If
            e.Result = 1
        Catch ex As Exception
            e.Result = ex.Message
        End Try
    End Sub
End Class
