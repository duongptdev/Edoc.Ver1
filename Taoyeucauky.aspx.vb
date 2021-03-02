
Imports System
Imports System.Configuration
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Net
Imports System.Threading
Imports System.Web
Imports DevExpress.Web
Imports DevExpress.XtraReports.Web
Imports Spire.Doc
Imports Spire.Pdf
Imports Spire.Pdf.Graphics


Partial Class Taoyeucauky

    Inherits System.Web.UI.Page
    Public fn As String
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub aspxUpload_FileUploadComplete(sender As Object, e As DevExpress.Web.FileUploadCompleteEventArgs)
        Dim taikhoan As String = hdUser("value").ToString
        Dim rootpath As String = Server.MapPath("FilePDF/" & taikhoan & "/")
        Dim drname As String = Server.MapPath("FilePDF/" & taikhoan & "/Fileinput/")
        If Not Directory.Exists(rootpath) Then
            Directory.CreateDirectory(rootpath)
        End If
        If Not Directory.Exists(drname) Then
            Directory.CreateDirectory(drname)
        End If
        Dim ext, fullname, fileinput As String
        fullname = e.UploadedFile.FileName
        ext = Path.GetExtension(e.UploadedFile.FileName)
        Dim temp As String() = fullname.Split(".")
        fileinput = drname & temp(0) & "_" & Path.GetRandomFileName & ext


        e.UploadedFile.SaveAs(fileinput)




        'Dim drname As String = Server.MapPath("FilePDF/")
        'If Not Directory.Exists(drname) Then
        '    Directory.CreateDirectory(drname)
        'End If
        'Dim ext, name, fullname As String
        'fullname = e.UploadedFile.FileName
        'Dim temp As String() = fullname.Split(".")

        'ext = Path.GetExtension(e.UploadedFile.FileName)
        'name = temp(0) & "_" & Path.GetRandomFileName & ".pdf"
        'Dim filePath As String = Server.MapPath("FilePDF/")

        'e.UploadedFile.SaveAs(newfile)

        Dim tengoc, newfile As String
        tengoc = fullname
        newfile = drname & temp(0) & "_" & Path.GetRandomFileName & ".pdf"



        If ext = ".pdf" Then
            If System.IO.File.Exists(fileinput) = True Then
                System.IO.File.Copy(fileinput, newfile)
                fn = newfile
                'show file pdf
            End If
        ElseIf ext = ".docx" Then
            If System.IO.File.Exists(fileinput) = True Then

                Dim document As New Document()
                document.LoadFromFile(fileinput)
                'Convert Word to PDF                    
                document.SaveToFile(newfile, Spire.Doc.FileFormat.PDF)
                fn = newfile
                'PdfViewer1.LoadDocument(NewCopy)
            End If
        ElseIf ext = ".doc" Then
            If System.IO.File.Exists(fileinput) = True Then
                Dim document As New Document()
                document.LoadFromFile(fileinput)
                'Convert Word to PDF                    
                document.SaveToFile(newfile, Spire.Doc.FileFormat.PDF)
                fn = newfile
                'PdfViewer1.LoadDocument(NewCopy)
            End If
        ElseIf ext = ".xls" Then
            If System.IO.File.Exists(fileinput) = True Then
                Dim workbook As New Spire.Xls.Workbook()
                workbook.LoadFromFile(fileinput)
                workbook.Worksheets(0).PageSetup.FitToPagesWide = 1
                workbook.Worksheets(0).PageSetup.FitToPagesTall = 0
                workbook.Worksheets(0).PageSetup.PaperSize = Spire.Xls.PaperSizeType.PaperA4
                workbook.Worksheets(0).PageSetup.TopMargin = 0.5
                workbook.Worksheets(0).PageSetup.LeftMargin = 0.5
                workbook.Worksheets(0).PageSetup.RightMargin = 0.5
                workbook.Worksheets(0).PageSetup.BottomMargin = 0.5
                workbook.Worksheets(0).PageSetup.Orientation = Spire.Xls.PageOrientationType.Landscape
                workbook.Worksheets(0).SaveToPdf(newfile)

                fn = newfile
                'PdfViewer1.LoadDocument(newfile)
            End If
        ElseIf ext = ".xlsx" Then
            If System.IO.File.Exists(fileinput) = True Then
                Dim workbook As New Spire.Xls.Workbook()
                workbook.LoadFromFile(fileinput)
                workbook.Worksheets(0).PageSetup.FitToPagesWide = 1
                workbook.Worksheets(0).PageSetup.FitToPagesTall = 0
                workbook.Worksheets(0).PageSetup.PaperSize = Spire.Xls.PaperSizeType.PaperA4
                workbook.Worksheets(0).PageSetup.TopMargin = 0.5
                workbook.Worksheets(0).PageSetup.LeftMargin = 0.5
                workbook.Worksheets(0).PageSetup.RightMargin = 0.5
                workbook.Worksheets(0).PageSetup.BottomMargin = 0.5
                workbook.Worksheets(0).PageSetup.Orientation = Spire.Xls.PageOrientationType.Landscape
                workbook.Worksheets(0).SaveToPdf(newfile)
                '  workbook.SaveToFile(newfile, Spire.Xls.FileFormat.PDF)
                fn = newfile
                'PdfViewer1.LoadDocument(newfile)
            End If
        ElseIf ext = ".txt" Then
            Dim text As String = File.ReadAllText(fileinput)
            Dim doc As New Spire.Pdf.PdfDocument()
            Dim section As PdfSection = doc.Sections.Add()
            Dim page As PdfPageBase = section.Pages.Add()
            Dim font As New Spire.Pdf.Graphics.PdfFont(PdfFontFamily.Helvetica, 11)
            Dim format As New Spire.Pdf.Graphics.PdfStringFormat()
            format.LineSpacing = 20.0F
            Dim brush As PdfBrush = PdfBrushes.Black
            Dim textWidget As New PdfTextWidget(text, font, brush)
            Dim y As Single = 0
            Dim textLayout As New PdfTextLayout()
            textLayout.Break = PdfLayoutBreakType.FitPage
            textLayout.Layout = PdfLayoutType.Paginate
            Dim bounds As New RectangleF(New PointF(0, y), page.Canvas.ClientSize)
            textWidget.StringFormat = format
            textWidget.Draw(page, bounds, textLayout)
            fn = newfile
            doc.SaveToFile(newfile, Spire.Pdf.FileFormat.PDF)
            'PdfViewer1.LoadDocument(newfile)
        Else
            Dim doc As New Spire.Pdf.PdfDocument()
            Dim section As PdfSection = doc.Sections.Add()
            Dim page As PdfPageBase = doc.Pages.Add()
            Dim image As Spire.Pdf.Graphics.PdfImage = Spire.Pdf.Graphics.PdfImage.FromFile(fileinput)
            'Set image display location and size in PDF
            Dim widthFitRate As Single = image.PhysicalDimension.Width / page.Canvas.ClientSize.Width
            Dim heightFitRate As Single = image.PhysicalDimension.Height / page.Canvas.ClientSize.Height
            Dim fitRate As Single = Math.Max(widthFitRate, heightFitRate)
            Dim fitWidth As Single = image.PhysicalDimension.Width / fitRate
            Dim fitHeight As Single = image.PhysicalDimension.Height / fitRate
            page.Canvas.DrawImage(image, 30, 30, fitWidth, fitHeight)
            Dim tempfile As String = "preview.pdf"
            doc.SaveToFile(newfile, Spire.Pdf.FileFormat.PDF)
            fn = newfile
            'PdfViewer1.LoadDocument(newfile)
        End If
        If (hdUser("value") = "dochuc@cavn.vn") Then
            Dim tenthumuc As String = hdthumuc("value")
            Dim clsBangluong As List(Of Bangluong) = SplitFile(newfile, tenthumuc)
            Session("tempData") = clsBangluong
            'gridBangluong.DataSource = clsBangluong
            'gridBangluong.DataBind()
        Else
            Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority

            'Dim serv As New swEDoc.apiEdoc
            'Dim idfile As Integer = serv.TaoVB(tengoc, newfile, taikhoan)

            Session("user") = taikhoan
            e.CallbackData = url & "/FilePDF/" & taikhoan & "/Fileinput/" & Path.GetFileName(newfile)
            aspxUpload.JSProperties("cp_tengoc") = tengoc
            aspxUpload.JSProperties("cp_duongdan") = newfile
        End If




        'aspxUpload.JSProperties("idfile") = idfile
        'trangthai van ban :0: Bản nháp,1: Đang chờ, 2: Bị từ chối, 3: Đã thu hồi, 4: Đã xóa,5: Đã hoàn thành
    End Sub


    Protected Sub cpSave_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = 0
        Dim tengoc As String = hdTengoc("value").ToString
        Dim duongdanfile As String = hdduongdan("value").ToString

        Dim idfile As Integer = serv.TaoVB(tengoc, duongdanfile, hdUser("value"), 0)
        If idfile > 0 Then
            If cmbNguoinhan.Tokens.Count > 0 Then
                Dim i As Integer
                Dim arr As String() = cmbNguoinhan.Value.ToString.Split(",")
                For i = 0 To arr.Count - 1
                    res = serv.Thietlaptaikhoanky(idfile, arr(i), 1, 1, hdUser("value").ToString)
                    'serv.GuiVB_Capnhatchitietguinguoinhan(idfile, arr(i))
                Next
                '  serv.GuiVB_CapnhatTTVB(idfile)
            End If
        Else
            res = 0
        End If
        ' Dim idfile As Integer = Convert.ToInt32(hdIDfile("value").ToString)
        'hinh thuc ky: 0: Ký điện tử, 1: ký số, 2: Xem

        e.Result = res
    End Sub

    Private Sub Taoyeucauky_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdUser("value") = String.Empty
            hdIDfile("value") = String.Empty
            hdTengoc("value") = String.Empty
            hdduongdan("value") = String.Empty
        End If
        Spire.License.LicenseProvider.SetLicenseKey("PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiIHN0YW5kYWxvbmU9InllcyI/Pgo8TGljZW5zZSBLZXk9ImNyOERaN1hKMkR5MUs2UUJBTkRPSVRLdlpjTzZkelVod2lsSHBnVlluQ3k0cXlHV2V6TFZubFJGeFAxNU1mSWZnUmdNWm1XaEdOQWRFNFRqZWZnQ1ovbFR2b1BkSXRIbDZXdDVBNWk1TVhFbnFkQnVPMUthRnovRFFzYUdWTGhzdjlySG1ybnRxSElFRGxJeGRxYUpNcGtLb0Frd1A3d1N6T01KMVkrbUNmVTVVRmV6REwvTjd1enJ4M0Y0d2I1SGErd0E2VFQ5VFJ3SzAzejlFS01aRmwzU1lSL3o0YVU3TE0wZFNYWTlqU0ZKZ2dqZlZzRFVLaUJyVm5td1ljaXVyOUVrYmw5Q3RaWTAzdG1yZm01QlplKzZnaHRFTm4wb2gzMzh0WlJleWpjcjc0QWs3MWhnWWtuTE9CQzE1VllmalhzcXVBVW13MlI2TWNWMlBPT2JyY1RSYlhBZ3pvUWJPeWQ4U2JFWmN3aE43NktQd1dzUVFTMUowdGlZSFVLeE9tMnQ0ZkJWMGhQVmhhOUI4Y0swNHFKUVp0MDBaMWNKRGEwd2I4VWx6RWs5QkhVVzJlbk9mVDE0UnlIQ2krWUdlbVBLY2RDUXJoMXpyWVRGN0ltb0x4N3h1NGV2RFRZc2xzV0JrbFFJb3g4NnJWckVVa1N0dXErQUNTWS9xVTM5L1Zhd3Y5S0FmUjVUZUVicGt3RGhTYjBOQkFqVDhBeXRsRFZkR2ZpZzBxS0czVllpVHBYRnc1cHRMVmgrYmtkK2RnN3Z4dHZyNDVaVVdKZXlyekdOR0g3YUZZZDZwLzJNRy9YSlRsR3ovU05RbzJDUExraU83SlhuOU5HZXhaN3BIbTBkZ3pNWmJHRVhxVmR2bG04MTJhL1hMMVNxeEdVWStvNVpsVUM3WTV4Z2dhRCtGZVA5enpoeUpxSUVwcDk3My9ScTRteG1wQWZMcVNzTzJSeHlTcStpdjFDc3AwQ3JvMDc4OEhybDFteWt4dVQweWRSWVpDNkRTeDhNMi9MWTNkOXNud3U3NkFmYjVDOVF1ZE9Zc0wzREh2aGZncmNVSWUvcUhmVFo5QWF6Y3pUanlyM2RPQkFjczBLZk12Y0xVUzRSeHZDdW1NNDVyNDJnMXJ3UGluN2JBcmYvZnNMTzZtS3g0WWRoSURNWlF6V3RjbkhFSTF5TXJ6aU9pdXhMdE8xalRBV25uU2VLVDJ0cXI3Tm42Qmg5TURHNjZZK2lJaW4xV05TUCtMdDFYdXRkajNKTyt4b1FNUVB5ZFpoZkJYZXpVMEhRMnd0eEdwdzRNczRTMTVJbFg1TEdXR3dXeUdYTWNjVWd3b1RDeFRGYmgyZFo0Vkg3OVZHTEVFR1JRWEZrNTRBdlFLdFBpdUcxY0w4RFo3WEoyRHkxSzZUUWVORE9YeFl2NFNveitCMHNBS0VwTVRrNCtTYWpYNksrSjlUOFhZVXRTOE8wWWZGUFZqZkhIYTZORWQyODdVcUlqMnJnQlF1bjVDV3hCczFHUm5BYmd1Z3MyL2ZQakcwZmdQemdSYzR5Q3ZObFg4V2pKUnloc3U5VFRKTjd1R3NOdnprU2IyZWlyQmhEaG1vQ0Jqa0wyYnMzT3I2d2pnNnBUNVpmNGhEdDF0STBJNXo1aytxQXVSZnRhd1lmamhXYmpMS0xKOTlUVk1kRDZaTCtTenNtQkNWN05lYm96V0RUTWgrRnJPT292R09ZbUk1bWp4Smd1MVRXNnI1V0JUK2oxSjBFNmJIb2tEMWo0Wm1DWUQreVBPUW1PMm1yUTNGdC9jVmZwQWlJdzliRkgwZ1FIbXQ4QnNuZnQ2MVV3c1h6cSs2akNvY1hOOUMvRXZPblhTczZuVlNGSkVBL3l1QmNIazZxOWdqanBnRG1NTEcrNlpxR1VjRWMzZEp2THpuK3pNT0p3TDI4WUQxN3BLSXBUNnd6WFBFVFJwWS9qNHhoMkQvaFhJRVNHcTk1eTVmZE9MNmx1QT09IiBWZXJzaW9uPSI5LjkiPgogICAgPFR5cGU+UnVudGltZTwvVHlwZT4KICAgIDxVc2VybmFtZT5Vc2VyTmFtZTwvVXNlcm5hbWU+CiAgICA8RW1haWw+ZU1haWxAaG9zdC5jb208L0VtYWlsPgogICAgPE9yZ2FuaXphdGlvbj5Pcmdhbml6YXRpb248L09yZ2FuaXphdGlvbj4KICAgIDxMaWNlbnNlZERhdGU+MjAxNi0wMS0wMVQxMjowMDowMFo8L0xpY2Vuc2VkRGF0ZT4KICAgIDxFeHBpcmVkRGF0ZT4yMDk5LTEyLTMxVDEyOjAwOjAwWjwvRXhwaXJlZERhdGU+CiAgICA8UHJvZHVjdHM+CiAgICAgICAgPFByb2R1Y3Q+CiAgICAgICAgICAgIDxOYW1lPlNwaXJlLk9mZmljZSBQbGF0aW51bTwvTmFtZT4KICAgICAgICAgICAgPFZlcnNpb24+OS45OTwvVmVyc2lvbj4KICAgICAgICAgICAgPFN1YnNjcmlwdGlvbj4KICAgICAgICAgICAgICAgIDxOdW1iZXJPZlBlcm1pdHRlZERldmVsb3Blcj45OTk5OTwvTnVtYmVyT2ZQZXJtaXR0ZWREZXZlbG9wZXI+CiAgICAgICAgICAgICAgICA8TnVtYmVyT2ZQZXJtaXR0ZWRTaXRlPjk5OTk5PC9OdW1iZXJPZlBlcm1pdHRlZFNpdGU+CiAgICAgICAgICAgIDwvU3Vic2NyaXB0aW9uPgogICAgICAgIDwvUHJvZHVjdD4KICAgIDwvUHJvZHVjdHM+CiAgICA8SXNzdWVyPgogICAgICAgIDxOYW1lPklzc3VlcjwvTmFtZT4KICAgICAgICA8RW1haWw+aXNzdWVyQGlzc3Vlci5jb208L0VtYWlsPgogICAgICAgIDxVcmw+aHR0cDovL3d3dy5pc3N1ZXIuY29tPC9Vcmw+CiAgICA8L0lzc3Vlcj4KPC9MaWNlbnNlPg==")
    End Sub
    Protected Sub cpsign_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
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

                            Dim savepath As String = Server.MapPath("~/FILEPDF/" & hdUser("value") & "/Fileinput/")
                            If Directory.Exists(savepath) = False Then
                                Directory.CreateDirectory(savepath)
                            End If
                            Dim fn = savepath & "\" & filename
                            myWebClient.DownloadFile(lnk, fn)
                            Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
                            Dim pathview As String = url & "/FilePDF/" & hdUser("value").ToString & "/Fileinput/" & Path.GetFileName(fn)
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

    Private Function SplitFile(pdffile As String, tenthucmuc As String) As List(Of Bangluong)
        'Dim file As String = Session("fileupload")
        Dim clsBangluong As New List(Of Bangluong)
        Dim pdf As New PdfDocument()
        pdf.LoadFromFile(pdffile)
        Dim i As Integer
        For i = 0 To pdf.Pages.Count - 1
            Dim thumuccon As String = tenthucmuc
            Dim fd As String = Server.MapPath("~/FilePDF/" & hdUser("value") & "/SplitFile/" & thumuccon & "/")
            If Directory.Exists(fd) = False Then
                Directory.CreateDirectory(fd)
            End If
            Dim startPageIndex As Integer = i
            Dim hoten As String = GetNamefromSTT(i + 1)
            If String.IsNullOrEmpty(hoten) Then
                hoten = Path.GetRandomFileName()
            End If
            Dim filename As String = "Bangluong_" & thumuccon & "_" & hoten & "_" & i & ".pdf"
            Dim fn As String = Server.MapPath("~/FilePDF/" & hdUser("value") & "/SplitFile/" & thumuccon & "/" & filename)


            Dim url As String = HttpContext.Current.Request.Url.Scheme & ": //" & HttpContext.Current.Request.Url.Authority
            pdf.SaveToFile(fn, startPageIndex, startPageIndex, Spire.Pdf.FileFormat.PDF)

            Dim item As New Bangluong
            item.link = "http://edoc.nacencomm.vn" + "/FilePDF/" & hdUser("value") & "/SplitFile/" & thumuccon & "/" & filename
            item.STT = i + 1
            item.duongdanfile = fn
            item.nguoinhan = GetNamefromSTT(i + 1)
            clsBangluong.Add(item)
        Next
        pdf.Close()
        Return clsBangluong


    End Function

    Private Function GetHoten(stt As String) As String
        Dim tentaikhoan As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Hoten from DSNhanvienNCM where STT = '" & stt & "'"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                tentaikhoan = reader(0).ToString
            End While
            reader.Close()
        Else
            tentaikhoan = String.Empty
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        Return tentaikhoan
    End Function

    Private Function GetNamefromSTT(stt As String) As String
        Dim tentaikhoan As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Taikhoan from DSNhanvienNCM where STT = '" & stt & "'"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                tentaikhoan = reader(0).ToString
            End While
            reader.Close()
        Else
            tentaikhoan = String.Empty
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        Return tentaikhoan
    End Function


    Protected Sub gridBangluong_CustomCallback(sender As Object, e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        gridBangluong.DataBind()
    End Sub
    Protected Sub gridBangluong_DataBinding(sender As Object, e As EventArgs)
        Dim cls As List(Of Bangluong) = DirectCast(Session("tempData"), List(Of Bangluong))
        gridBangluong.DataSource = cls
    End Sub
    Protected Sub cpSaveBL_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Try
            Dim clsbangluong As List(Of Bangluong) = Session("tempData")
            Dim serv As New swEDoc.apiEdoc
            Dim i As Integer
            For i = 0 To clsbangluong.Count - 1
                Dim item As Bangluong = clsbangluong(i)
                Dim tengoc, vitriluu, nguoinhan As String
                Dim hoten As String = GetNamefromSTT(i + 1)
                tengoc = "file" & i & ".pdf"
                vitriluu = item.duongdanfile
                nguoinhan = item.nguoinhan
                'luu file vb
                Dim idfile As Integer = serv.TaoVB(tengoc, vitriluu, hdUser("value").ToString, 1)
                'gan nguoi ky 
                Call serv.Thietlaptaikhoanky(idfile, "dochuc@cavn.vn", 1, 1, hdUser("value").ToString)
                Call serv.Thietlaptaikhoanky(idfile, "tam@cavn.vn", 2, 1, hdUser("value").ToString)
                Call serv.Thietlaptaikhoanky(idfile, "thuydd@cavn.vn", 3, 1, hdUser("value").ToString)
                Call serv.Thietlaptaikhoanky(idfile, nguoinhan, 3, 1, hdUser("value").ToString)

                ' Call serv.GuiVB_Capnhatchitietguinguoinhan(idfile, nguoinhan)
                '  Call serv.GuiVB_CapnhatTTVB(idfile)
            Next
            e.Result = "Lưu danh sách bảng lương thành công:  " & clsbangluong.Count & "    bản ghi."
        Catch ex As Exception
            e.Result = ex.Message
        End Try

    End Sub
    Protected Sub cpSignAll_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Try
            'Dim myWebClient As New WebClient
            'Dim uploadWebUrl As String = "http://27.76.138.214:8888/upload.aspx"
            'Dim startx, starty, endx, endy As Integer
            'startx = 242
            'starty = 97
            'Dim code_arr As New List(Of CodeFile)
            'Dim width, height As Integer
            'width = 137
            'height = 54

            'Dim filetoupload As String ' = Server.MapPath("TestPDF.pdf")
            'Dim client As New ServiceRemote.Service
            'Dim cert_serial As String = hdserial("value")
            'Dim fakeserial As String = "6" & cert_serial.Substring(1, cert_serial.Length - 1)

            'Dim cls As List(Of Bangluong) = DirectCast(Session("tempData"), List(Of Bangluong))
            'Dim i As Integer
            'For i = 0 To cls.Count - 1
            '    Dim urlpath As String = cls(i).duongdanfile
            '    Dim baseUrl As String = Request.Url.GetLeftPart(UriPartial.Authority)
            '    filetoupload = Server.MapPath(urlpath.Replace(baseUrl, "~/"))
            '    Dim filename As String = Path.GetFileName(filetoupload)
            '    myWebClient.UploadFile(uploadWebUrl, filetoupload)
            '    Dim sign_file As String = "C:\RemoteSignTest_Beta2\RemoteService\File\" & Path.GetFileName(filetoupload)


            '    Dim rect As String = startx & " " & starty & " " & startx & " 00 "

            '    Dim pageno = e.Parameter
            '    Dim datatosign As String = sign_file & ";" & width & ";" & height & ";" & 1 & ";" & rect

            '    Dim code As String = Now.ToString("yyyyMMddHHmmssfff")
            '    client.InsertLog(fakeserial, datatosign, "PDF", code, "0", "VCDC LAB")
            '    Dim item As New CodeFile
            '    item.Code = code
            '    item.filename = Path.GetFileName(filetoupload)
            '    code_arr.Add(item)
            'Next

            '' push notification -----------------------------------------------
            'Dim clienthsdt As serviceHSDT.service = New serviceHSDT.service
            'Dim devid As String = clienthsdt.GetDevIDFromSerial(cert_serial)
            'Dim regid As String = clienthsdt.GetRegIDFromDevID(devid)
            'If (regid <> "0") And (regid <> "2") Then


            '    Dim message, title As String
            '    message = "Bạn có một yêu cầu ký văn bản"
            '    title = "Signing Request"
            '    Dim key As String = 1

            '    Call USendNoitificationIOS(regid, message, title, key, code_arr(0).Code)
            'End If
            '' push notification -----------------------------------------------

            'Thread.Sleep(20000)
            '' get result -------------------------------------------------------


            'Dim kq = String.Empty
            'Dim count_file As Integer = cls.Count - 1
            'Do While count_file >= 0

            '    While kq = String.Empty
            '        kq = client.GetSignedText(code_arr(count_file).Code)
            '        If Not String.IsNullOrEmpty(kq) Then


            '            Dim arr As String() = kq.Split("/")
            '            Dim filenames As String = arr(arr.Count - 1)
            '            Dim lnk As String = "http://27.76.138.214:8888/SignedFile/" & filenames
            '            'Dim res_dialog As Integer = SaveFileDialog1.ShowDialog
            '            'If res_dialog = vbOK Then

            '            Dim savepath As String = Server.MapPath("~/FILEPDF/" & hdUser("value") & "/SplitFile/")
            '            If Directory.Exists(savepath) = False Then
            '                Directory.CreateDirectory(savepath)
            '            End If
            '            Dim fn = savepath & "\" & code_arr(count_file).filename
            '            myWebClient.DownloadFile(lnk, fn)
            '            count_file = count_file - 1
            '            kq = String.Empty
            '        End If
            '    End While
            'Loop

            Dim client As New swEDoc.apiEdoc
            Dim info As String = "242 92 142 47 1" ' fix vi tri ke toan

            Dim cls As List(Of Bangluong) = DirectCast(Session("tempData"), List(Of Bangluong))
            Dim i As Integer
            For i = 0 To cls.Count - 1
                Dim code As String = Now.ToString("yyyyMMddHHmmssfff")

                client.TaoYCKy(code, hdUser("value"), cls(i).link, info)
            Next


            e.Result = 1
        Catch ex As Exception
            e.Result = ex.Message
        End Try
    End Sub

    Private Function USendNoitificationIOS(ByVal regid As String, ByVal message As String, ByVal title As String, key As String, code As String) As String
        '     Try
        Dim applicationID As String = "AIzaSyB39vaN2qFh0B47f-NlClti8WZgz8dGHUs"
        ' Dim customToken As String = Await FirebaseAuth.DefaultInstance.CreateCustomTokenAsync(uid)

        Dim SENDER_ID As String = "422856567567"
        Dim value As String = message
        Dim tRequest As WebRequest
        'tRequest = WebRequest.Create("https://fcm.googleapis.com/v1/projects/pushpassenger-945b2/messages:send")
        tRequest = WebRequest.Create("https://fcm.googleapis.com/fcm/send")
        tRequest.Method = "POST"
        tRequest.UseDefaultCredentials = True
        tRequest.PreAuthenticate = True
        tRequest.Credentials = CredentialCache.DefaultNetworkCredentials
        tRequest.ContentType = "application/json"
        tRequest.Headers.Add(String.Format("Authorization: key={0}", applicationID))
        tRequest.Headers.Add(String.Format("Sender: id={0}", SENDER_ID))
        'Dim postData As String = " {""registration_ids"":[" & """" & regid & """],""priority"":  ""high"",""notification"": { ""title"": """ & title & """, ""body"" :""" & message & """}}"

        Dim postData As String = " {""to"":" & """" & regid & """,""priority"":  ""high"",""notification"": { ""title"": """ & title & """, ""body"" :""" & message & """},""data"":{""key"":""" & key & """,""code"":""" & code & """}}"
        Dim byteArray() As Byte = Encoding.UTF8.GetBytes(postData)
        tRequest.ContentLength = byteArray.Length
        Dim dataStream As Stream = tRequest.GetRequestStream
        dataStream.Write(byteArray, 0, byteArray.Length)
        dataStream.Close()
        Dim tResponse As WebResponse = tRequest.GetResponse
        dataStream = tResponse.GetResponseStream
        Dim tReader As StreamReader = New StreamReader(dataStream)
        Dim sResponseFromServer As String = tReader.ReadToEnd
        tReader.Close()
        dataStream.Close()
        tResponse.Close()
        Return sResponseFromServer

        'Catch ex As Exception
        '    Dim msgError As String = ex.ToString
        '    Return msgError
        'End Try

    End Function

    Protected Sub btnXem_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim duongdanfile As String = gridBangluong.GetRowValues(container.VisibleIndex, "link")

        btn.JSProperties("cp_path") = duongdanfile
    End Sub
End Class
Public Class Bangluong

    Public Property STT As String
    Public Property duongdanfile As String
    Public Property nguoinhan As String

    Public Property link As String

End Class

Public Class CodeFile

    Public Property Code As String
    Public Property filename As String


End Class
