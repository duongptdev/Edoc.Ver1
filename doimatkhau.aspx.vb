Imports System.Data.SqlClient
Partial Class doimatkhau
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub cp_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim oldpass, newpass As String
        oldpass = txtoldpass.Text
        newpass = txtnewpass.Text
        Dim user As String = hduser("value")
        Dim checkpass As Integer = CheckMKCu(user, oldpass)
        If checkpass = 1 Then
            Dim conn As New SqlConnection
            conn.ConnectionString = sConString
            conn.Open()
            Dim comm As New SqlCommand
            comm.Connection = conn
            comm.CommandText = String.Format("Update Taikhoan Set Matkhau ='{0}' where Email = '{1}'", newpass, user)
            comm.ExecuteNonQuery()
            conn.Close()
            conn.Dispose()
            comm.Dispose()
            SqlConnection.ClearAllPools()
            e.Result = 1
        Else
            e.Result = 0
        End If

    End Sub

    Private Function CheckMKCu(user As String, oldpass As String) As Integer
        Dim res As Integer = 0
        Try
            Dim conn As New SqlConnection
            conn.ConnectionString = sConString
            conn.Open()
            Dim comm As New SqlCommand
            comm.Connection = conn
            comm.CommandText = String.Format("Select * from Taikhoan where Email = '{0}' and Matkhau='{1}'", user, oldpass)
            Dim reader As SqlDataReader = comm.ExecuteReader
            If reader.HasRows Then
                res = 1
            Else
                res = 0
            End If
            conn.Close()
            conn.Dispose()
            comm.Dispose()
            SqlConnection.ClearAllPools()
        Catch ex As Exception
            res = 0
        End Try


        Return res

    End Function
End Class
