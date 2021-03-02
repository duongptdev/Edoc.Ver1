<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="doimatkhau.aspx.vb" Inherits="doimatkhau" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <script type="text/javascript">
        $(document).ready(function () {

            var user = localStorage.getItem("user");
            if (user == null) {
                window.location = 'signin.aspx';
            }
            else {
                hduser.Set('value', user);

            }
        });

        function ChangePass(s, e) {
            if (ASPxClientEdit.ValidateGroup('changepass') == true) {
                cp.PerformCallback();
            }
        }

        function EndUpdate(s, e) {
            var res = e.result;
            if (res != null) {
                if (res == 1) {
                    alert('Cập nhật mật khẩu mới thành công');
                }
                else {
                    alert('Mật khẩu cũ không đúng');
                }
            }
            else {
                alert('Lỗi hệ thống');
            }
        }
    </script>
    <dx:ASPxCallback ID="cp" ClientInstanceName="cp" OnCallback="cp_Callback" runat="server">
        <ClientSideEvents CallbackComplete="EndUpdate" />
    </dx:ASPxCallback>
    <dx:ASPxHiddenField ID="hduser" ClientInstanceName="hduser" runat="server"></dx:ASPxHiddenField>

    <div class="container-fluid" style="padding:50px">
        <h4>Đổi mật khẩu</h4>
        <hr />
         <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="100%">
             <PanelCollection>
                 <dx:PanelContent>
                     <table style="width:100%;">
                         <tr>
                             <td style="width:200px;">
                                 Mật khẩu cũ:
                             </td>
                             <td style="padding-bottom:10px;">
                                 <dx:ASPxTextBox ID="txtoldpass" Password="true" runat="server" Width="300px" Theme="Material" ClientInstanceName="txtoldpass">
                                     <ValidationSettings RequiredField-IsRequired="true" ValidationGroup="changepass" ErrorDisplayMode="ImageWithTooltip" ErrorText="Chưa có giá trị" />
                                 </dx:ASPxTextBox>
                             </td>
                         </tr>

                           <tr>
                             <td style="width:200px;">
                                 Mật khẩu mới:
                             </td>
                             <td style="padding-bottom:10px;">
                                 <dx:ASPxTextBox ID="txtnewpass" runat="server" Password="true" Width="300px" Theme="Material" ClientInstanceName="txtnewpass">
                                       <ValidationSettings RequiredField-IsRequired="true" ValidationGroup="changepass" ErrorDisplayMode="ImageWithTooltip" ErrorText="Chưa có giá trị" />
                                 </dx:ASPxTextBox>
                             </td>
                         </tr>

                             <tr>
                             <td style="width:200px;">
                                 Mật khẩu mới:
                             </td>
                             <td>
                                 <dx:ASPxButton ID="btnUpdatePass" ClientInstanceName="btnupdate" runat="server" Text="Đổi mật khẩu" AutoPostBack="false" ValidationGroup="changepass">
                                     <ClientSideEvents click="ChangePass" />
                                 </dx:ASPxButton>
                             </td>
                         </tr>
                         
                     </table>
                 </dx:PanelContent>
             </PanelCollection>
         </dx:ASPxPanel>
    </div>

   
</asp:Content>

