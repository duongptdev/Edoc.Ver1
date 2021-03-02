
Partial Class ChangePass
    Inherits System.Web.UI.Page

    Protected Sub cppChangePass_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Try
            Dim email As String = Session("Login").ToString()
            Dim arr As String() = e.Parameter.Split("|")
            Dim oldpass = arr(0)
            Dim newpass = arr(1)
            Dim serv As New swEDoc.apiEdoc
            Dim res As Integer = 0
            res = serv.Doimatkhau(email, oldpass, newpass)
            e.Result = res
        Catch ex As Exception
            e.Result = ex.Message
        End Try
    End Sub
End Class
