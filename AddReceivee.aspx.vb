Imports System.Data.SqlClient
Partial Class AddReceivee
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub AddReceivee_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") Is Nothing Then
            Response.Redirect("Signin.aspx")
        End If
        'gridBangluong.DataSource = Session("tempData")
        'gridBangluong.DataBind()
        GetHoTen()
    End Sub
    Private Sub GetHoTen()
        Dim email As String = Session("Login").ToString
        Dim fname As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Hoten from Taikhoan where Email = '" & email & "'"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                fname = reader(0).ToString()
                Session("Name") = fname
            End While
        Else
            Session("Name") = String.Empty
        End If
    End Sub
    Protected Sub cpaddrecei_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Try
            Dim idFile As Integer = Session("idFile").ToString()
            Dim tkt As String = Session("Login").ToString()
            Dim arr As String() = e.Parameter.Split("|")
            Dim a, b As String
            Dim c As String
            c = arr(0)
            a = arr(1)
            b = arr(2)
            Session("tkk") = c
            Dim ttk As String() = c.Split(",")
            Dim htk As String() = a.Split(",")
            Dim tkk As String() = b.Split(",")
            Dim i As Integer
            Dim serv As New swEDoc.apiEdoc
            Dim res As Integer = 0
            If ttk.Count = 0 Then
                For i = 0 To htk.Count - 1
                    res = serv.Thietlaptaikhoanky(idFile, tkk(i), 1, htk(i), tkt)

                Next
                serv.GuiVB(idFile, Session("Login"))
            Else
                For i = 0 To htk.Count - 1
                    res = serv.Thietlaptaikhoanky(idFile, tkk(i), Integer.Parse(ttk(i)), htk(i), tkt)

                Next
                Call serv.GuiVB(idFile, Session("Login"))
            End If


            Dim url As String = Session("Urlfile").ToString()
            Dim response = String.Format(res) + "|" + url
            e.Result = response
        Catch ex As Exception
            e.Result = ex.Message
        End Try

        'If res = 1 Then
        '    Response.Redirect("AddSigntureField.aspx")
        'End If
    End Sub
    Protected Sub btnDangxuat_Click(sender As Object, e As EventArgs)
        Session.Clear()
        Response.Redirect("Signin.aspx")
    End Sub
End Class
