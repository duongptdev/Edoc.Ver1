Imports System.Data.SqlClient
Imports System.IO
Imports System.Net
Imports DevExpress.Web

Partial Class Danhsachyeucau
    Inherits System.Web.UI.Page

    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub btnXem_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim duongdanfile As String = gridDanhsach.GetRowValues(container.VisibleIndex, "Vitriluu")
        Dim loaivb As String = gridDanhsach.GetRowValues(container.VisibleIndex, "PhanloaiVB")

        Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
        Dim pathview As String = String.Empty
        If loaivb = 1 Then

            Dim link As String = duongdanfile.Replace("D:\EDOC\WebEDOC\", "http://edoc.nacencomm.vn/")
            pathview = link
        Else
            pathview = url & "/FilePDF/" & hdUser("value").ToString & "/Fileinput/" & Path.GetFileName(duongdanfile)
        End If

        btn.JSProperties("cp_path") = pathview

    End Sub
    Protected Sub gridDanhsach_DataBinding(sender As Object, e As EventArgs)
        dsDagui.SelectCommand = "select * from v_VBChitiet where  Taikhoantao='" & hdUser("value").ToString & "' order by idFile desc"
        dsDagui.DataBind()
        gridDanhsach.DataSource = dsDagui
    End Sub
    Protected Sub gridDanhsach_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)

    End Sub

    Private Sub Danhsachyeucau_Load(sender As Object, e As EventArgs) Handles Me.Load
        '   pdftron.PDFNetLoader  PDFNet.Initialize("I-Warez 2015:OEM:AZBYCXAZBYCXAZBYCXAZBYCXAZBYCXAZBYCX")

        '  PDFNet.Initialize("I-Warez 2015:OEM:AZBYCXAZBYCXAZBYCXAZBYCXAZBYCXAZBYCX")

        If Not IsPostBack Then
            hdUser("value") = String.Empty
        End If
    End Sub
    Protected Sub gridVBnhan_DataBinding(sender As Object, e As EventArgs)
        dsDanhan.SelectCommand = "select * from v_VBChitiet where  Taikhoanky='" & hdUser("value").ToString & "' order by idFile desc"
        dsDanhan.DataBind()
        gridVBnhan.DataSource = dsDanhan
    End Sub
    Protected Sub gridVBnhan_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)

        If e.Column.FieldName = "Taikhoantao" Then
            Dim email As String = gridDanhsach.GetRowValues(e.ListSourceRowIndex, "Taikhoantao")
            e.Value = GetnamefromEmail(email)
        End If

    End Sub
    Protected Sub gridDanhsach_CustomCallback(sender As Object, e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        gridDanhsach.DataBind()
    End Sub
    Protected Sub gridVBnhan_CustomCallback(sender As Object, e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        gridVBnhan.DataBind()
    End Sub

    Private Function GetnamefromEmail(email As String) As String
        Dim hoten As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select hoten from Canbo where Email = '" & email & "'"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                hoten = reader(0).ToString
            End While
            reader.Close()
        Else
            hoten = String.Empty
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        Return hoten
    End Function
    Protected Sub gridVBnhan_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs)
        If e.Column.FieldName = "TrangthaiVB" Then

            If e.Value = 0 Then
                e.DisplayText = "Tạo nháp"
            ElseIf e.Value = 1 Then
                e.DisplayText = "Đang chờ"
            ElseIf e.Value = 2 Then
                e.DisplayText = "Bị từ chối"

            ElseIf e.Value = 3 Then
                e.DisplayText = "Đã thu hồi"
            ElseIf e.Value = 4 Then
                e.DisplayText = "Đã xóa"
            ElseIf e.Value = 5 Then
                e.DisplayText = "Đã hoàn thành"

            End If
            'trangthai van ban :0: Bản nháp,1: Đang chờ, 2: Bị từ chối, 3: Đã thu hồi, 4: Đã xóa,5: Đã hoàn thành
        End If
    End Sub
    Protected Sub gridDanhsach_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs)
        If e.Column.FieldName = "TrangthaiVB" Then

            If e.Value = 0 Then
                e.DisplayText = "Tạo nháp"
            ElseIf e.Value = 1 Then
                e.DisplayText = "Đang chờ"
            ElseIf e.Value = 2 Then
                e.DisplayText = "Bị từ chối"

            ElseIf e.Value = 3 Then
                e.DisplayText = "Đã thu hồi"
            ElseIf e.Value = 4 Then
                e.DisplayText = "Đã xóa"
            ElseIf e.Value = 5 Then
                e.DisplayText = "Đã hoàn thành"

            End If
        End If
    End Sub
    Protected Sub btnXemvbnhan_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim duongdanfile As String = gridVBnhan.GetRowValues(container.VisibleIndex, "Vitriluu")
        Dim nguoigui As String = gridVBnhan.GetRowValues(container.VisibleIndex, "Taikhoantao")
        Dim loaivb As String = gridVBnhan.GetRowValues(container.VisibleIndex, "PhanloaiVB")
        Dim pathview As String = String.Empty
        If (File.Exists(duongdanfile)) Then
            Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
            If loaivb = 1 Then
                'bang luong
                Dim link As String = duongdanfile.Replace("D:\EDOC\WebEDOC\", "http://edoc.nacencomm.vn/")
                'pathview = url & "/FilePDF/" & nguoigui & "/SplitFile/" & Path.GetFileName(duongdanfile)
                pathview = link
            Else
                'tai lieu, vb khac
                pathview = url & "/FilePDF/" & nguoigui & "/Fileinput/" & Path.GetFileName(duongdanfile)
            End If


            btn.JSProperties("cp_path") = pathview
            btn.JSProperties("cp_base64") = ConvertBase64PDF(duongdanfile)
        Else
            btn.JSProperties("cp_path") = String.Empty
            btn.JSProperties("cp_base64") = String.Empty
        End If

    End Sub

    Private Sub Danhsachyeucau_PreInit(sender As Object, e As EventArgs) Handles Me.PreInit

    End Sub
    Protected Sub btnSign_Click(sender As Object, e As EventArgs)
        Dim typelogin As Integer = hdphuongthuc("value")


        If typelogin = 1 Then
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
                Dim urlpath As String = hdduongdan("value")
                Dim baseUrl As String = Request.Url.GetLeftPart(UriPartial.Authority)
                filetoupload = Server.MapPath(urlpath.Replace(baseUrl, "~/"))
                Dim filename As String = Path.GetFileName(filetoupload)
                myWebClient.UploadFile(uploadWebUrl, filetoupload)
                Dim sign_file As String = "C:\RemoteSignTest_Beta2\RemoteService\File\" & "TestPDF.pdf"

                Dim cert_serial As String = hdserial("value")
                Dim fakeserial As String = "6" & cert_serial.Substring(1, cert_serial.Length - 1)

                Dim rect As String = startx & " " & starty & " " & startx & " 00 "

                Dim pageno = 1
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

                        Dim savepath As String = Server.MapPath("~/FILEPDF/" & hdUser("value") & "/Fileinput/")
                        If Directory.Exists(savepath) = False Then
                            Directory.CreateDirectory(savepath)
                        End If

                        Dim fn = savepath & "\" & filename
                        myWebClient.DownloadFile(lnk, fn)
                        ' PdfViewer1.LoadDocument(fn)
                        'myWebClient.DownloadFile(lnk, SaveFileDialog1.FileName)
                        '    PdfViewer1.LoadDocument(Path.GetFullPath(SaveFileDialog1.FileName))
                        'MsgBox("Đã tải về tài liệu đã ký")
                        '   End If
                    End If
                End While
            End If

        Else
        End If
    End Sub
    Protected Sub cpSave_Callback(source As Object, e As CallbackEventArgs)
        Try
            Dim physicpath As String = String.Empty
            If hdduongdan.Contains("value") Then
                Dim urlpath As String = hdduongdan("value")
                Dim baseUrl As String = Request.Url.GetLeftPart(UriPartial.Authority)

                physicpath = Server.MapPath(urlpath.Replace(baseUrl, "~/"))
            End If
            Dim bytes As Byte() = Convert.FromBase64String(e.Parameter.Replace("data:application/pdf;base64,", ""))
            File.WriteAllBytes(physicpath, bytes)
            e.Result = 1
        Catch ex As Exception
            e.Result = ex.Message
        End Try
    End Sub
    Protected Sub cpsign_Callback(source As Object, e As CallbackEventArgs)
        Try
            Dim typelogin As Integer = hdphuongthuc("value")
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
                    Dim urlpath As String = hdduongdan("value")
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
    Protected Sub cpReload_Callback(source As Object, e As CallbackEventArgs)
        'If Not String.IsNullOrEmpty(e.Parameter) Then
        Dim lnk As String = e.Parameter
        Dim files As String = Server.MapPath(lnk.Replace("http://edoc.nacencomm.vn", "~"))
        If File.Exists(files) Then
            Dim b64 As String = ConvertBase64PDF(files)
            e.Result = b64
        End If
        'End If
    End Sub

    Private Function ConvertBase64PDF(files As String) As String

        Dim bytes As Byte() = File.ReadAllBytes(files)

        Dim base64String As String = Convert.ToBase64String(bytes)
        Return base64String
    End Function

    Protected Sub cpSignall_Callback(ByVal source As Object, ByVal e As CallbackEventArgs)

        Dim client As New swEDoc.apiEdoc
        Dim info As String = "414 92 165 56 1" ' fix vi tri thu quy

        'Dim cls As List(Of Bangluong) = DirectCast(Session("tempData"), List(Of Bangluong))
        'Dim i As Integer
        'For i = 0 To cls.Count - 1
        '    Dim code As String = Now.ToString("yyyyMMddHHmmssfff")

        '    client.TaoYCKy(code, hdUser("value"), cls(i).link, info)
        'Next


        Dim duongdanfile As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Vitriluu from v_VBChitiet where Taikhoanky = 'thuydd@cavn.vn' and PhanloaiVB=1 and Trangthaiky=0"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                Dim code As String = Now.ToString("yyyyMMddHHmmssfff")
                duongdanfile = reader(0).ToString
                client.TaoYCKy(code, hdUser("value"), duongdanfile.Replace("D:\EDOC\WebEDOC\", "http://edoc.nacencomm.vn/"), info)
            End While
            reader.Close()
        Else

        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        e.Result = 1
    End Sub
End Class
