
Imports System.IO

Partial Class RequesSuccess
    Inherits System.Web.UI.Page
    Protected Sub RequesSuccess_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Email") IsNot Nothing Then
            lblEmail.Text = Session("Email").ToString
        End If
    End Sub
    Protected Sub btnXacnhan_Click(sender As Object, e As EventArgs)
        Dim email As String = Session("Email").ToString()
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = serv.Kichhoattaikhoan(email)

        If res = 1 Then
            Dim url As String = "http://hddt.nacencomm.vn:108/SetPassword.aspx?email=" & email
            Dim body As String = String.Empty
            Dim subject As String = "Kích hoạt tài khoản"
            Dim ccmail As String = ""
            Dim tieude As String = "Kích hoạt tài khoản"

            Using reader As StreamReader = New StreamReader(Server.MapPath("SendEmail.html"))
                body = reader.ReadToEnd()
            End Using

            body = body.Replace("{Url}", url)
            Dim req = serv.SendMail(email, subject, body, ccmail, tieude)

            If True Then

                If res = "1" Then
                    Response.Redirect("Resend.aspx")
                End If
            End If


        ElseIf res = -1 Then
            lblError.Text = "Lỗi hệ thống"
        ElseIf res = 0 Then
            lblError.Text = "Tài khoản không tồn tại"
        ElseIf res = -3 Then
            lblError.Text = "Tài khoản đã bị khóa"
        ElseIf res = -4 Then
            lblError.Text = "Tài khoản đã được kích hoạt"
        End If
    End Sub
End Class
