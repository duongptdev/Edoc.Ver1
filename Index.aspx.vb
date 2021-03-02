Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Web

Partial Class Index
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub Index_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") Is Nothing Then
            Response.Redirect("Signin.aspx")
        End If
        Dim email As String = Session("Login").ToString()
        'gridDanhsach.SettingsDataSecurity.AllowReadUnlistedFieldsFromClientApi = DevExpress.Utils.DefaultBoolean.True
        'gridDanhsach.FocusedRowIndex = -1
        LoadData()
    End Sub
    Private Sub LoadData()
        Dim email As String = Session("Login").ToString()
        Dim serv As New swEDoc.apiEdoc
        Dim data As DataTable = New DataTable()
        data = serv.LayDSVBNhan_pheky(email)
        'dsDagui.SelectCommand = "select * from v_VBChitiet where  Taikhoantao='" & Session("Login").ToString & "' order by idFile desc"
        'dsDagui.DataBind()
        gridDanhsach.DataSource = data
        gridDanhsach.DataBind()
    End Sub
    Protected Sub gridDanhsach_DataBinding(sender As Object, e As EventArgs)
        Dim email As String = Session("Login").ToString()
        Dim serv As New swEDoc.apiEdoc
        Dim data As DataTable = New DataTable()
        data = serv.LayDSVBNhan_pheky(email)
        'dsDagui.SelectCommand = "select * from v_VBChitiet where  Taikhoantao='" & Session("Login").ToString & "' order by idFile desc"
        'dsDagui.DataBind()
        gridDanhsach.DataSource = data
        gridDanhsach.DataBind()
    End Sub
    Protected Sub gridDanhsach_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)

    End Sub
    Protected Sub gridDanhsach_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs)
        If e.Column.FieldName = "TrangthaiVB" Then
            If e.Value = 1 Then
                e.DisplayText = "Nháp"
                e.Column.CellStyle.ForeColor = Drawing.Color.Silver
            ElseIf e.Value = 2 Then
                e.DisplayText = "Chờ ký"
                e.Column.CellStyle.ForeColor = Drawing.Color.Blue
            ElseIf e.Value = 3 Then
                e.DisplayText = "Ký hoàn tất"
                e.Column.CellStyle.ForeColor = Drawing.Color.Red
            ElseIf e.Value = 4 Then
                e.DisplayText = "Từ chối"
                e.Column.CellStyle.ForeColor = Drawing.Color.Silver
            ElseIf e.Value = 5 Then
                e.DisplayText = "Thu hồi"
            ElseIf e.Value = 6 Then
                e.DisplayText = "Xóa"
                e.Column.CellStyle.ForeColor = Drawing.Color.Green
            End If
        End If

    End Sub

    Protected Sub gridDanhsach_DataBound(sender As Object, e As EventArgs)


    End Sub
    Protected Sub btnXem_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim idfile As Integer = gridDanhsach.GetRowValues(container.VisibleIndex, "idFile")
        Dim tkk As String = gridDanhsach.GetRowValues(container.VisibleIndex, "Taikhoanky")
        Dim duongdanfile As String = gridDanhsach.GetRowValues(container.VisibleIndex, "Vitriluu")
        Dim ttk As Integer = gridDanhsach.GetRowValues(container.VisibleIndex, "Trinhtuky")
        Dim htk As Integer = gridDanhsach.GetRowValues(container.VisibleIndex, "Hinhthucky")
        Dim tenvb As String = gridDanhsach.GetRowValues(container.VisibleIndex, "TenVBGoc")
        Dim link As String = duongdanfile.Replace("D:\EDOC_TEST\WEBEDOC\Edoc0103", "http://27.71.231.212:8001")
        Session("idf") = idfile
        Session("ttk") = ttk
        btn.JSProperties("cp_idfile") = idfile
        btn.JSProperties("cp_tkk") = tkk
        btn.JSProperties("cp_ttk") = ttk
        btn.JSProperties("cp_htk") = htk
        btn.JSProperties("cp_urlFile") = link
        btn.JSProperties("cp_tenvb") = tenvb

    End Sub
    Protected Sub gridDanhsach_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        If e.DataColumn.FieldName = "Trinhtuky" Then
            Dim btn As ASPxButton = TryCast(gridDanhsach.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "btnXem"), ASPxButton)
            Dim trinhtu As String = gridDanhsach.GetRowValues(e.VisibleIndex, "Trinhtuky")
            Dim idfile As String = gridDanhsach.GetRowValues(e.VisibleIndex, "idFile")
            Dim trangthaiky As Integer = checkttky(idfile, trinhtu - 1)

            If trinhtu = 1 Then
                btn.ClientVisible = True
            Else
                If trangthaiky = 1 Then
                    btn.ClientVisible = True
                Else
                    btn.ClientVisible = False
                End If

            End If

        End If
    End Sub
    Private Function checkttky(idfile As String, trinhtu As Integer) As Integer
        Dim trangthaiky As Integer = 0
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Trangthaiky from v_VBChitiet where idFile = '" & idfile & "' and Trinhtuky=" & trinhtu
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                If reader(0) IsNot DBNull.Value Then
                    trangthaiky = Convert.ToInt32(reader(0).ToString)
                End If
            End While
            reader.Close()
        Else
            trangthaiky = 0
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()


        Return trangthaiky
    End Function
End Class
