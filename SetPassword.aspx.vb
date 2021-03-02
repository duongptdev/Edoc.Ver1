
Imports swEDoc

Partial Class SetPassword
    Inherits System.Web.UI.Page

    Protected Sub btnDangky_Click(sender As Object, e As EventArgs)
        Dim client As apiEdoc = New apiEdoc()
        Dim email = Request.QueryString("email").ToString()
        Dim pass = txtPass.Text
        Dim res As Integer = client.Thietlapmatkhau(email, pass)

        If res = 1 Then
            Response.Redirect("SignIn.aspx")
        ElseIf res = -1 Then
            lblError.Text = "Lỗi hệ thống"
        ElseIf res = 0 Then
            lblError.Text = "Không tồn tại tài khoản"
        ElseIf res = -2 Then
            lblError.Text = "Tài khoản chưa kích hoạt"
        ElseIf res = -3 Then
            lblError.Text = "Tài khoản đã bị khóa"
        ElseIf res = -4 Then
            lblError.Text = "Tài khoản đã thiết lập mật khẩu"
        End If
    End Sub
End Class
