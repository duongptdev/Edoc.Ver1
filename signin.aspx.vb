
Partial Class signin
    Inherits System.Web.UI.Page
    Private Sub signin_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        lblError.Text = String.Empty


    End Sub
    Protected Sub cpLogin_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim cookName As HttpCookie = New HttpCookie("user")
        Dim arr As String() = e.Parameter.Split("|")
        Dim tendn, matkhau As String
        tendn = arr(0)
        matkhau = arr(1)

        Dim serv As New swEDoc.apiEdoc
        '0: Tai khoan khong dung,1: thành công, -1: Lỗi,  -2 :TK chưa kích hoạt, -3: Tài khoản đã bị khóa, -4: Tài khoản bị khóa do dang nhap sai qua 5 lan, -5: Thong tin dang nhap khong dung
        Dim res As Integer = serv.Dangnhap(tendn, matkhau)
        If res = 1 Then
            Dim arr1 As New swEDoc.clTTTaikhoan
            arr1 = serv.Laythongtintaikhoan(tendn)
            Dim email As String = arr1.Email
            Dim name As String = arr1.Hoten
            Dim sodt As String = arr1.Sodienthoai
            Dim mst As String = arr1.Masothue
            Dim tentc As String = arr1.Tentochuc
            Dim datechangpass As String = arr1.NgaydoiMK
            e.Result = res & "|" & email & "|" & name & "|" & sodt & "|" & mst & "|" & tentc & "|" & datechangpass
        End If


    End Sub
    Protected Sub cpGetInfo_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        If Not String.IsNullOrEmpty(e.Parameter) Then
            Dim user As String = e.Parameter
            Dim client As New swEDoc.apiEdoc
            '  serv.Laythietlapphuongthuckysomacdinh()
            Dim cls As New swEDoc.clThietlapphuongthucky
            cls = client.Laythietlapphuongthuckysomacdinh(user)
            If cls.Phuongthucky = 1 Then
                e.Result = cls.Serialno & "|" & cls.Phuongthucky
            Else
                e.Result = "" & "|" & cls.Phuongthucky
            End If
        End If
    End Sub

    Protected Sub btnDangNhap_Click(sender As Object, e As EventArgs)
        Dim mRegxExpression As Regex

        If txtEmail.Text.Trim() <> String.Empty Then
            mRegxExpression = New Regex("^([a-zA-Z0-9_\-])([a-zA-Z0-9_\-\.]*)@(\[((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}|((([a-zA-Z0-9\-]+)\.)+))([a-zA-Z]{2,}|(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\])$")

            If Not mRegxExpression.IsMatch(txtEmail.Text.Trim()) Then
                lblError.Text = "Sai định dạng email"
            Else

                Dim email = txtEmail.Text
                Dim pass = txtPass.Text
                Dim cls As New swEDoc.clThietlapphuongthucky
                Dim serv As New swEDoc.apiEdoc
                cls = serv.Laythietlapphuongthuckysomacdinh(email)
                If cls.Phuongthucky = 1 Then
                    Session("Serial") = cls.Serialno
                    Session("ptKy") = cls.Phuongthucky
                Else
                    Session("Serial") = ""
                    Session("ptKy") = cls.Phuongthucky
                End If
                Dim res As Integer = serv.Dangnhap(email, pass)

                If res = 1 Then
                    Session.Remove("Email")
                    Session("Login") = txtEmail.Text
                    Dim arr1 As New swEDoc.clTTTaikhoan
                    Dim em As String = txtEmail.Text
                    arr1 = serv.Laythongtintaikhoan(em)

                    Session("Ten") = arr1.Hoten
                    Dim arr2 As New swEDoc.clThietlapphuongthucky
                    Dim ptk As String = arr2.Macdinh
                    Session("ptkmd") = ptk
                    Session("SDT") = arr1.Sodienthoai
                    Session("MST") = arr1.Masothue
                    Session("TenTC") = arr1.Tentochuc
                    Session("DateChange") = arr1.NgaydoiMK
                    Response.Redirect("Index.aspx")
                ElseIf res = -1 Then
                    lblError.Text = "Lỗi hệ thống"
                ElseIf res = -2 Then
                    lblError.Text = "Tài khoản chưa được kích hoạt"
                ElseIf res = -3 Then
                    lblError.Text = "Tài khoản đang bị khóa"
                ElseIf res = -4 Then
                    lblError.Text = "Tài khoản đã nhập sai quá 5 lần và đang bị khóa"
                ElseIf res = -5 Then
                    lblError.Text = "Sai thông tin đăng nhập"
                ElseIf res = 0 Then
                    lblError.Text = "Không tồn tại tài khoản"
                End If
            End If
        End If

    End Sub
End Class
