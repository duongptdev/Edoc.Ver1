
Partial Class Dangky
    Inherits System.Web.UI.Page

    Protected Sub cpDangky_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim hoten As String = txtHoten.Text
        Dim email As String = txtEmail.Text
        Dim tentochuc As String = txtTentochuc.Text
        Dim masothue As String = txtMasothue.Text
        Dim dienthoai As String = txtDienthoai.Text
        Dim lstThongtin As New swEDoc.clDangky
        lstThongtin.Hoten = hoten
        lstThongtin.Email = email
        lstThongtin.Tentochuc = tentochuc
        lstThongtin.Masothue = masothue
        lstThongtin.Sodienthoai = dienthoai
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = serv.Dangky(lstThongtin)
        Dim res1 As Integer = 0
        Dim res2 As Integer = 0
        If res = 1 Then
            res1 = serv.Kichhoattaikhoan(email)
            If res1 = 1 Then
                res2 = serv.Thietlapmatkhau(email, "123456")
                e.Result = res2
            End If
        ElseIf res = -3 Then
            e.Result = res
        End If
    End Sub
End Class
Public Class clDangky
    Public Property Email As String
    Public Property Hoten As String
    Public Property Sodienthoai As String
    Public Property Masothue As String
    Public Property Tentochuc As String
End Class
