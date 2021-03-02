
Imports System.IO

Partial Class Resend
    Inherits System.Web.UI.Page
    Protected Sub Resend_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Email") IsNot Nothing Then
            lblEmail.Text = Session("Email").ToString
        End If
    End Sub
    Protected Sub btnResend_Click(sender As Object, e As EventArgs)
        Dim email As String = Session("Email").ToString()
        Dim serv As New swEDoc.apiEdoc
        Dim url As String = "http://hddt.nacencomm.vn:108/SetPassword.aspx?email=" & email
        Dim body As String = String.Empty

        Using reader As StreamReader = New StreamReader(Server.MapPath("SendEmail.html"))
            body = reader.ReadToEnd()
        End Using

        body = body.Replace("{Url}", url)
        Dim subject As String = "Kích hoạt tài khoản"
        Dim ccmail As String = ""
        Dim tieude As String = ""
        serv.SendMail(email, subject, body, ccmail, tieude)
    End Sub

End Class
