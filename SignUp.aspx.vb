
Partial Class SignUp
    Inherits System.Web.UI.Page
    Private Sub SignUp_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        lblError.Text = String.Empty


    End Sub
    Protected Sub btnDangKy_Click(sender As Object, e As EventArgs)
        Dim mRegxExpression As Regex
        Dim serv As New swEDoc.apiEdoc
        Dim email As String = txtEmail.Text


        If txtEmail.Text.Trim() <> String.Empty Then
            mRegxExpression = New Regex("^([a-zA-Z0-9_\-])([a-zA-Z0-9_\-\.]*)@(\[((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}|((([a-zA-Z0-9\-]+)\.)+))([a-zA-Z]{2,}|(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\])$")

            If Not mRegxExpression.IsMatch(txtEmail.Text.Trim()) Then
                lblError.Text = "Sai định dạng email"
            Else
                Session("Email") = email
                Response.Redirect("Register.aspx")
            End If
        End If
    End Sub
End Class
