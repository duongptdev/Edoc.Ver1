
Imports System.Configuration
Imports System.Data.SqlClient

Partial Class Thietlaptaikhoan
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub cpLuutt_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim user As String = hdUser("value").ToString
        Dim client As New swEDoc.apiEdoc

        Dim idtaikhoan As String = GetidTaikhoan(user)
        Dim val As Integer = rdPhuongthucky.SelectedItem.Value
        If val = 2 Then
            Dim res As Integer = client.Thietlapphuongthuckytoken(user, "1234", 1)
        End If

        If val = 1 Then
            Dim res As Integer = client.Thietlapphuongthuckymobilesign_IDCTS(user, txtMadangky.Text, rdPhuongthucky.SelectedItem.Value)
        End If

        'Dim phuongthuc As Integer = rdPhuongthucky.Value
        'Dim serial, idcts, sqlcomm As String
        'If rdPhuongthucky.SelectedIndex = 1 Then
        '    If Not String.IsNullOrEmpty(txtSerial.Text) Then
        '        serial = txtSerial.Text
        '    End If
        '    If Not String.IsNullOrEmpty(txtMadangky.Text) Then
        '        idcts = txtMadangky.Text
        '    End If
        '    sqlcomm = String.Format("insert into Thietlapphuongthucky (idTaikhoan, Phuongthucky,Serialno,IDCTS) values ({0},{1},'{2}','{3}')", idtaikhoan, phuongthuc, serial, idcts)
        'Else
        '    sqlcomm = String.Format("insert into Thietlapphuongthucky (idTaikhoan, Phuongthucky) values ({0},{1})", idtaikhoan, phuongthuc)
        'End If

        'Dim conn As New SqlConnection
        'Dim comm As New SqlCommand
        'conn.ConnectionString = sConString
        'conn.Open()
        'comm.Connection = conn
        'comm.CommandText = sqlcomm
        'comm.ExecuteNonQuery()
        'conn.Close()
        'conn.Dispose()
        'comm.Dispose()
        'SqlConnection.ClearAllPools()
        e.Result = 1
        '0: Ký điện tử, 1: Ký mobile sign, 2: Ký USB token, 3: Ký HSM


    End Sub

    Private Function GetidTaikhoan(user As String) As String
        Dim idtaikhoan As String = String.Empty

        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select idTaikhoan from Taikhoan where Email = '" & user & "'"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                idtaikhoan = reader(0).ToString
            End While
            reader.Close()
        Else
            idtaikhoan = String.Empty
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        Return idtaikhoan
    End Function
    Protected Sub cpGetInfo_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        If Not String.IsNullOrEmpty(e.Parameter) Then
            Dim user As String = e.Parameter
            Dim client As New swEDoc.apiEdoc
            '  serv.Laythietlapphuongthuckysomacdinh()
            Dim cls As New swEDoc.clThietlapphuongthucky
            cls = client.Laythietlapphuongthuckysomacdinh(user)
            If cls.Phuongthucky = 1 Then
                e.Result = cls.Serialno & "|" & cls.Phuongthucky
            Else
                e.Result = "" & "|" & cls.Phuongthucky
            End If
        End If
    End Sub
End Class
