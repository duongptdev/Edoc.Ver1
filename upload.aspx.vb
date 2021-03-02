
Partial Class upload
    Inherits System.Web.UI.Page

    Private Sub upload_load(sender As Object, e As EventArgs) Handles Me.Load
        Dim folder As String = Request.QueryString("user")
        label1.text = folder
        For Each f As String In Request.Files.AllKeys
            Dim file As HttpPostedFile = Request.Files(f)
            file.SaveAs(Server.MapPath(("~/" + folder + file.FileName)))
        Next
    End Sub
End Class
