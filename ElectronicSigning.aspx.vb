
Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports DevExpress.Web

Partial Class ElectronicSigning
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub cpsign_Callback(source As Object, e As CallbackEventArgs)
        'Dim arr1 As String() = e.Parameter.Split("|")
        'Dim pageno As Integer = arr1(0)
        'Dim ptk As Integer = arr1(1)
        'Dim arr As String() = e.Parameter.Split("|")
        'Dim idfile As Integer = arr(0)
        'Dim tkk As String = arr(1)
        'Dim ptk As Integer = arr(2)
        'Dim ttk As Integer = arr(3)
        'Dim serv As New swEDoc.apiEdoc
        'Dim res As Integer = 0
        'res = serv.KyVB(idfile, tkk, ptk, ttk)
        'e.Result = res
        Try
            Dim typelogin As Integer = 1

            If typelogin = 1 Then ' ky mobile
                Dim startx, starty, endx, endy As Integer
                'startx = txtstartx.Text
                'starty = txtstarty.Text
                'endx = txtendx.Text
                'endy = txtendy.Text
                startx = 241
                starty = 508
                endx = 186
                endy = 114
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


                Dim datatosign As String = sign_file & ";" & width & ";" & height & ";" & 1 & ";" & rect
                Dim client As New ServiceRemote.Service
                Dim code As String = Now.ToString("yyyyMMddHHmmssfff")
                client.InsertLog(fakeserial, datatosign, "PDF", code, "0", "VCDC LAB")
                Threading.Thread.Sleep(500)
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
    Protected Sub cpupdate_Callback(source As Object, e As CallbackEventArgs)
        Dim idfile As Integer = Session("idf")
        Dim ttk As Integer = Session("ttk")
        Dim user As String = Session("Login")
        Dim ptk As String = Session("Login")


        Dim serv As New swEDoc.apiEdoc
        Call serv.KyVB(idfile, user, Session("ptKy"), ttk)
        e.Result = "Cập nhật trạng thái đã ký thành công."
    End Sub
    Private Function GetTTThietlap(fieldname As String, idthietlap As String) As String
        Dim res As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "select " & fieldname & " from Thietlapnguoiky where idThietlap = " & idthietlap
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                If reader(0) IsNot DBNull.Value Then
                    res = reader(0).ToString
                End If
            End While
            reader.Close()
        Else
            res = 0
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()


        Return res
    End Function
    Private Function GetIDThietlap(idfile As String, user As String) As Integer
        Dim idthietlap As Integer = 0
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "select IDThietlap from Thietlapnguoiky where idFile=" & idfile & " and Taikhoanky=" & user
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                If reader(0) IsNot DBNull.Value Then
                    idthietlap = Convert.ToInt32(reader(0).ToString)
                End If
            End While
            reader.Close()
        Else
            idthietlap = 0
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()


        Return idthietlap
    End Function

    Protected Sub cpendsign_Callback(source As Object, e As CallbackEventArgs)
        Dim arr As String() = e.Parameter.Split("|")
        Dim linkfile As String = arr(0)
        Dim code As String = arr(1)
        Dim tk As String = arr(2)
        Dim info As String = arr(3)
        Dim res As Integer = 0
        Dim serv As New swEDoc.apiEdoc
        res = serv.TaoYCKy(code, tk, linkfile, info)
        e.Result = res
    End Sub
End Class
