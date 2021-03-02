Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Partial Class AddSigntureField
    Inherits System.Web.UI.Page
    Protected Sub AddSigntureField_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") Is Nothing Then
            Response.Redirect("Signin.aspx")
        End If
        GetHoTen()
    End Sub
    Public Function GetHoTen() As List(Of String)
        Dim sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim fname As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        Dim hoten As New List(Of String)
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Hoten from Taikhoan"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                fname = reader(0).ToString()
                hoten.Add(fname)
            End While
            reader.Close()
        End If
        Return hoten
    End Function
    Protected Sub cpSave_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Try
            Dim physicpath As String = String.Empty

            Dim urlpath As String = Session("Urlfile").ToString()
            Dim baseUrl As String = Request.Url.GetLeftPart(UriPartial.Authority)

            physicpath = Server.MapPath(urlpath.Replace(baseUrl, "~/"))

            Dim bytes As Byte() = Convert.FromBase64String(e.Parameter.Replace("data:application/pdf;base64,", ""))
            File.WriteAllBytes(physicpath, bytes)
            e.Result = 1
        Catch ex As Exception
            e.Result = ex.Message
        End Try
    End Sub
    Protected Sub btnSign_Click(sender As Object, e As EventArgs)

    End Sub
    Protected Sub cpsign_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Try
            Dim typelogin As Integer = Integer.Parse(Session("ptKy"))

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

                If hdduongdan.Contains("value") Then
                    Dim urlpath As String = Session("Urlfile").ToString
                    Dim baseUrl As String = Request.Url.GetLeftPart(UriPartial.Authority)
                    filetoupload = Server.MapPath(urlpath.Replace(baseUrl, "~/"))
                    Dim filename As String = Path.GetFileName(filetoupload)
                    myWebClient.UploadFile(uploadWebUrl, filetoupload)
                    Dim sign_file As String = "C:\RemoteSignTest_Beta2\RemoteService\File\" & Path.GetFileName(filetoupload)

                    Dim cert_serial As String = hdserial("value")
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
                End If
            Else

            End If
            e.Result = 1
        Catch ex As Exception
            e.Result = ex.Message
        End Try
    End Sub
    Protected Sub btnDangxuat_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Signin.aspx")
    End Sub
    Protected Sub cpky_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)

    End Sub
    Protected Sub cpSigndoc_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim arr As String() = e.Parameter.Split("|")
        Dim linkfile As String = arr(0)
        '   Dim url As String = linkfile.Replace("http://192.168.2.108:8001", "http://27.71.231.212:8001")
        Dim code As String = arr(1)
        Dim tk As String = arr(2)
        Dim info As String = arr(3)
        Dim idfile As Integer = Session("idFile")
        Dim ttk As Integer = arr(4)
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = 0
        res = serv.TaoYCKy(code, tk, linkfile, info)

        e.Result = res
    End Sub
End Class
