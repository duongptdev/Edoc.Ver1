
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Protected Sub btnDangxuat_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Signin.aspx")
    End Sub
End Class

