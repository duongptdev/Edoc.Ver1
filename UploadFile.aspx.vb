
Imports System
Imports System.Data.SqlClient
Imports System.Drawing
Imports System.IO
Imports System.Web
Imports DevExpress.Web
Imports Spire.Doc
Imports Spire.Pdf
Imports Spire.Pdf.Graphics

Partial Class UploadFile
    Inherits System.Web.UI.Page
    Public fn As String
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub UploadFile_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        gridBangluong.Visible = False
    End Sub
    Protected Sub btnUpload_Click(sender As Object, e As EventArgs)

        If FileUpload2.HasFile Then
            Dim taikhoan As String = Session("Login").ToString
            Dim rootpath As String = Server.MapPath("FilePDF/" & taikhoan & "/")
            Dim drname As String = Server.MapPath("FilePDF/" & taikhoan & "/Fileinput/")
            Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
            If Not Directory.Exists(rootpath) Then
                Directory.CreateDirectory(rootpath)
            End If
            If Not Directory.Exists(drname) Then
                Directory.CreateDirectory(drname)
            End If
            Dim ext, fullname, fileinput As String
            fullname = FileUpload2.FileName
            Session("Namefile") = fullname
            ext = Path.GetExtension(FileUpload2.FileName)
            Dim temp As String() = fullname.Split(".")
            fileinput = drname & temp(0) & "_" & Path.GetRandomFileName & ext
            FileUpload2.SaveAs(fileinput)
            Dim tengoc, newfile As String
            tengoc = fullname

            newfile = drname & temp(0) & "_" & Path.GetRandomFileName & ".pdf"

            Dim ul As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
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
            If (Session("Login") = "dochuc@cavn.vn") Then
                Dim serv As New swEDoc.apiEdoc
                Dim tenthumuc As String = "2"
                Dim clsBangluong As List(Of Bangluong) = SplitFile(newfile, tenthumuc)
                Session("tempData") = clsBangluong

                'For i = 0 To clsBangluong.Count - 1
                '    Dim item As Bangluong = clsBangluong(i)
                '    Dim tengocf, vitriluu, nguoinhan, vitri As String
                '    Dim hoten As String = GetNamefromSTT(i + 1)
                '    tengocf = "file" & i & ".pdf"
                '    vitri = item.duongdanfile
                '    vitriluu = vitri.Replace("D:\Web\Edoc", "http://192.168.2.108:8001")
                '    nguoinhan = item.nguoinhan
                '    'luu file vb
                '    Dim idfile As Integer = serv.TaoVB(tengoc, vitriluu, Session("Login").ToString(), 1)
                '    Session("idf") = idfile
                '    'gan nguoi ky 
                '    Call serv.Thietlaptaikhoanky(idfile, "hangdtt@cavn.vn", 1, 1, Session("Login").ToString())
                '    Call serv.Thietlaptaikhoanky(idfile, "phamduongcntt60@gmail.com", 2, 1, Session("Login").ToString())
                '    Call serv.Thietlaptaikhoanky(idfile, "oanh@cavn.vn", 3, 1, Session("Login").ToString())
                '    'Call serv.Thietlaptaikhoanky(idfile, nguoinhan, 3, 1, Session("Login").ToString())

                '    'Call serv.GuiVB_Capnhatchitietguinguoinhan(idfile, nguoinhan)
                '    'Call serv.GuiVB_CapnhatTTVB(idfile)

                '    'check trangthai ky trong bang Signrequest
                '    Dim daky As Boolean = CheckTTDaky(item.link)
                '    Dim idthietlap As String = GetIDThietlap(vitriluu)
                '    If daky = True Then
                '        Call UpdateTrangthaiKy(idthietlap)
                '    End If
                'Next
                'Dim client As New swEDoc.apiEdoc
                'client.GuiVB(Session("idf"), Session("Login"))
                'Dim info As String = "242 92 142 47 1"
                'Dim cls As List(Of Bangluong) = DirectCast(Session("tempData"), List(Of Bangluong))
                'Dim j As Integer
                'Dim rec As Integer
                'For j = 0 To cls.Count - 1
                '    Dim code As String = Now.ToString("yyyyMMddHHmmssfff")

                '    rec = client.TaoYCKy(code, Session("Login").ToString(), cls(j).link, info)
                'Next
                ' Response.Redirect("Index.aspx")

                gridBangluong.DataSource = clsBangluong
                gridBangluong.DataBind()
                pnUpLoad.Visible = False
                gridBangluong.Visible = True

            Else
                '  Dim rl As String = ul.Replace("http://192.168.2.108:8001", "http://27.71.213.212:8001")
                Dim file1 As String = ul & "/FilePDF/" & taikhoan & "/Fileinput/" & Path.GetFileName(newfile)
                Session("Urlfile") = file1
                Dim serv As New swEDoc.apiEdoc
                Dim idfile As Integer = serv.TaoVB(tengoc, newfile, taikhoan, 1)
                Session("idFile") = idfile
                Session("user") = taikhoan
                'aspxUpload.JSProperties("cp_tengoc") = tengoc
                'aspxUpload.JSProperties("cp_duongdan") = newfile
                Response.Redirect("AddReceivee.aspx")
            End If
        End If
        'e.CallbackData = idfile & "|" & url & "/FilePDF/" & taikhoan & "/Fileinput/" & Path.GetFileName(newfile)
        'aspxUpload.JSProperties("idfile") = idfile
        'trangthai van ban :0: Bản nháp,1: Đang chờ, 2: Bị từ chối, 3: Đã thu hồi, 4: Đã xóa,5: Đã hoàn thành
    End Sub
    Private Sub UpdateTrangthaiKy(idthietlap As String)
        Dim sql As String = "update Thietlapnguoiky set Trangthaiky=1, Thoigianky='" & Now.ToString("yyyy-MM-dd HH:mm:ss") & "' where Taikhoanky='" & Session("Login").ToString() & "' and IDThietlap='" & idthietlap & "'"
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = sql
        comm.ExecuteNonQuery()

        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()

    End Sub
    Private Function GetIDThietlap(vitriluu As String) As Integer
        Dim idthietlap As Integer = 0
        Dim sql As String = "select IDThietlap from v_VBChitiet where Taikhoanky='" & Session("Login").ToString() & "' and Vitriluu='" & vitriluu & "'"
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = sql
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                If reader(0) IsNot DBNull.Value Then
                    idthietlap = Convert.ToInt32(reader(0).ToString)

                End If
            End While
            reader.Close()
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        Return idthietlap
    End Function
    Private Function CheckTTDaky(vitriluu As String) As Boolean
        Dim sql As String = "select Status from SignRequest where Taikhoan='" & Session("Login").ToString() & "' and Linkfile='" & vitriluu & "'"
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = sql
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                If reader(0) IsNot DBNull.Value Then
                    If reader(0) = 1 Then
                        Return True
                    End If

                End If
            End While
            reader.Close()
        Else
            Return False
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()

    End Function
    Private Function SplitFile(pdffile As String, tenthucmuc As String) As List(Of Bangluong)
        'Dim file As String = Session("fileupload")
        Dim clsBangluong As New List(Of Bangluong)
        Dim pdf As New PdfDocument()
        pdf.LoadFromFile(pdffile)
        Dim i As Integer
        For i = 0 To pdf.Pages.Count - 1
            Dim thumuccon As String = tenthucmuc
            Dim fd As String = Server.MapPath("~/FilePDF/" & Session("Login").ToString() & "/SplitFile/" & thumuccon & "/")
            If Directory.Exists(fd) = False Then
                Directory.CreateDirectory(fd)
            End If
            Dim startPageIndex As Integer = i
            Dim hoten As String = GetNamefromSTT(i + 1)
            If String.IsNullOrEmpty(hoten) Then
                hoten = Path.GetRandomFileName()
            End If
            Dim filename As String = "Bangluong_" & thumuccon & "_" & hoten & "_" & i & ".pdf"
            Dim fn As String = Server.MapPath("~/FilePDF/" & Session("Login").ToString() & "/SplitFile/" & thumuccon & "/" & filename)


            Dim url As String = HttpContext.Current.Request.Url.Scheme & ": //" & HttpContext.Current.Request.Url.Authority
            pdf.SaveToFile(fn, startPageIndex, startPageIndex, Spire.Pdf.FileFormat.PDF)
            Dim ulr As String = fn.Replace("D:\Web\Edoc", "http://27.71.231.212:8001")
            Dim item As New Bangluong
            item.link = "http://27.71.231.212:8001" + "/FilePDF/" & Session("Login").ToString() & "/SplitFile/" & thumuccon & "/" & filename
            item.STT = i + 1
            item.duongdanfile = ulr
            item.nguoinhan = GetNamefromSTT(i + 1)
            clsBangluong.Add(item)
        Next
        pdf.Close()
        Return clsBangluong


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
    Protected Sub btnDangxuat_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Signin.aspx")
    End Sub
    Public Class Bangluong

        Public Property STT As String
        Public Property duongdanfile As String
        Public Property nguoinhan As String

        Public Property link As String

    End Class
    Protected Sub aspxUpload_FileUploadComplete(sender As Object, e As FileUploadCompleteEventArgs)

    End Sub


    Protected Sub cpluubl_Callback(source As Object, e As CallbackEventArgs)
        Try

            Dim clsbangluong As List(Of Bangluong) = Session("tempData")
            Dim serv As New swEDoc.apiEdoc
            Dim i As Integer
            For i = 0 To clsbangluong.Count - 1
                Dim item As Bangluong = clsbangluong(i)
                Dim tengoc, vitriluu, nguoinhan As String
                Dim hoten As String = GetNamefromSTT(i + 1)
                tengoc = item.nguoinhan & i & ".pdf"
                vitriluu = item.duongdanfile
                nguoinhan = item.nguoinhan
                'luu file vb
                Dim idfile As Integer = serv.TaoVB(tengoc, vitriluu, Session("Login").ToString, 1)

                'gan nguoi ky 
                If Session("Login") = "dochuc@cavn.vn" Then
                    Call serv.Thietlaptaikhoanky(idfile, "dochuc@cavn.vn", 1, 1, Session("Login"))
                    Call serv.Thietlaptaikhoanky(idfile, "tam@cavn.vn", 1, 1, Session("Login"))
                    Call serv.Thietlaptaikhoanky(idfile, "thuydd@cavn.vn", 3, 1, Session("Login"))
                    Call serv.Thietlaptaikhoanky(idfile, nguoinhan, 3, 1, Session("Login"))
                ElseIf Session("Login") = "ketoancnhcm@cavn.vn" Then
                    Call serv.Thietlaptaikhoanky(idfile, "ketoancnhcm@cavn.vn", 1, 1, Session("Login"))
                    Call serv.Thietlaptaikhoanky(idfile, "huynhtv@cavn.vn", 2, 1, Session("Login"))
                    Call serv.Thietlaptaikhoanky(idfile, nguoinhan, 3, 1, Session("Login"))
                End If

                serv.GuiVB(idfile, Session("Login"))
                'check trangthai ky trong bang Signrequest
                Dim daky As Boolean = CheckTTDaky(item.link)
                Dim idthietlap As String = GetIDThietlap(vitriluu)
                If daky = True Then
                    '   Call UpdateTrangthaiKy(idthietlap)
                    If Session("Login") = "dochuc@cavn.vn" Then
                        Call serv.KyVB(idfile, "dochuc@cavn.vn", Session("ptKy"), 1)
                    ElseIf Session("Login") = "ketoancnhcm@cavn.vn" Then
                        Call serv.KyVB(idfile, "ketoancnhcm@cavn.vn", Session("ptKy"), 1)
                    End If

                End If
            Next

            e.Result = "Lưu danh sách bảng lương thành công: " & clsbangluong.Count & "bản ghi."
            'e.Result = "Lưu danh sách bảng lương thành công:  " & clsbangluong.Count & "    bản ghi."
        Catch ex As Exception
            e.Result = ex.Message
        End Try
    End Sub
    Protected Sub cpkybl_Callback(source As Object, e As CallbackEventArgs)
        Try
            Dim serv As New swEDoc.apiEdoc
            Dim info As String = "242 92 142 47 1"
            Dim cls As List(Of Bangluong) = DirectCast(Session("tempData"), List(Of Bangluong))
            Dim j As Integer
            Dim rec As Integer
            For j = 0 To cls.Count - 1
                Dim code As String = Now.ToString("yyyyMMddHHmmssfff")

                rec = serv.TaoYCKy(code, Session("Login"), cls(j).link, info)
            Next
            e.Result = 1
        Catch ex As Exception
            e.Result = ex.Message
        End Try

    End Sub
End Class
