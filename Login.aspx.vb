


Imports System.Data.SqlClient

Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub cpLogin_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim cookName As HttpCookie = New HttpCookie("user")
        Dim arr As String() = e.Parameter.Split("|")
        Dim tendn, matkhau As String
        tendn = arr(0)
        matkhau = arr(1)

        Dim serv As New swEDoc.apiEdoc
        '0: Tai khoan khong dung,1: thành công, -1: Lỗi,  -2 :TK chưa kích hoạt, -3: Tài khoản đã bị khóa, -4: Tài khoản bị khóa do dang nhap sai qua 5 lan, -5: Thong tin dang nhap khong dung
        Dim res As Integer = serv.Dangnhap(tendn, matkhau)
        e.Result = res & "|" & tendn


        'Dim conn As New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString)
        'conn.Open()
        'Dim comm As New SqlCommand
        'comm.Connection = conn
        'comm.CommandText = "select * from Taikhoan where Email=@email and Matkhau=@matkhau"
        'comm.Parameters.AddWithValue("email", tendn)
        'comm.Parameters.AddWithValue("matkhau", matkhau)
        'Dim reader As SqlDataReader = comm.ExecuteReader
        'If reader.HasRows Then
        '    While reader.Read
        '        Session("user") = tendn
        '        cookName.Value = tendn
        '        cookName.Expires = DateTime.Now.AddDays(1)
        '        Response.Cookies.Add(cookName)
        '    End While
        '    reader.Close()
        '    e.Result = 1 & "|" & tendn
        'Else
        '    e.Result = 0
        'End If
        'conn.Close()
        'conn.Dispose()
        'comm.Dispose()
        'SqlConnection.ClearAllPools()
    End Sub
End Class
