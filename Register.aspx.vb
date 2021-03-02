
Imports System.IO

Partial Class Register
    Inherits System.Web.UI.Page

    Protected Sub btnDangKy_Click(sender As Object, e As EventArgs)
        'Dim hoten As String = txtHoTen.Text
        'Dim email As String = Session("email").ToString

        'Dim tentochuc As String = txtTenToChuc.Text
        'Dim masothue As String = txtMST.Text
        'Dim dienthoai As String = txtSDT.Text


        'Dim lstThongtin As New swEDoc.clDangky
        'lstThongtin.Hoten = hoten
        'lstThongtin.Email = email
        'lstThongtin.Tentochuc = tentochuc
        'lstThongtin.Masothue = masothue
        'lstThongtin.Sodienthoai = dienthoai

        'Dim serv As New swEDoc.apiEdoc

        'Dim res As Integer = serv.Dangky(lstThongtin)
        'Dim res1 As Integer = 0
        'Dim res2 As Integer = 0
        'If res = 1 Then
        '    res1 = serv.Kichhoattaikhoan(email)
        '    If res1 = 1 Then
        '        res2 = serv.Thietlapmatkhau(email, )
        '        e.Result = res2
        '    End If
        'ElseIf res = -3 Then
        '    e.Result = res

        'End If

        If cbDieuKhoan.Checked = True Then
            Dim hoten As String = txtHoTen.Text
            Dim sdt As String = txtSDT.Text
            Dim tentc As String = txtTenToChuc.Text
            Dim mst As String = txtMST.Text
            Dim email As String = Session("Email").ToString()
            Dim cl As New swEDoc.clDangky
            cl.Email = email
            cl.Hoten = hoten
            cl.Sodienthoai = sdt
            cl.Masothue = mst
            cl.Tentochuc = tentc
            Dim serv As New swEDoc.apiEdoc
            Dim res As Integer = serv.Dangky(cl)
            If res = 1 Then

                Dim body1 As String = String.Empty
                    Dim subject1 As String = "Xác nhận đăng ký"
                    Dim ccmail1 As String = ""
                    Dim tieude1 As String = "Xác nhận đăng ký tài khoản"
                    Using reader As StreamReader = New StreamReader(Server.MapPath("Notification.html"))
                        body1 = reader.ReadToEnd()
                    End Using

                    Dim res1 As Integer = serv.SendMail(email, subject1, body1, ccmail1, tieude1)
                    Response.Redirect("RequesSuccess.aspx")

            ElseIf res = -1 Then
                    lblError.Text = "Lỗi đăng ký"
                ElseIf res = -3 Then
                    lblError.Text = "Email đã được đăng ký"
                Else
                    lblError.Text = "Đăng ký không thành công"
            End If
        Else
            lblError.Text = "Bạn cần chấp nhận điều khoản"
        End If
    End Sub

End Class
