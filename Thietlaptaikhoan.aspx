<%@ Page Title="" Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Thietlaptaikhoan.aspx.vb" Inherits="Thietlaptaikhoan" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script type="text/javascript">
        function ThaydoiPT() {
            var index = rdphuongthuc.GetSelectedIndex();
            if (index == 1) {
                pnmobile.SetVisible(true);
            } else {
                pnmobile.SetVisible(false);
            }
        }
        function SaveData(s, e) {
            
                cpluuthongtin.PerformCallback();
            
        }

          $(document).ready(function () {

            var user = localStorage.getItem("user");
            if (user == null) {
                window.location = 'login.aspx';
            }
            else {
                hduser.Set('value', user);
                
            }
          });
        function SaveDone(s, e) {
            if (e.result != null) {
                if (e.result == 1) {
                    alert('Lưu thiết lập thành công');
                    var user = hduser.Get('value');
                    cpgetinfo.PerformCallback(user);
                   // localStorage.setItem("phuongthucky", rdphuongthuc.GetValue());
                }
                else {
                    alert('Lỗi không lưu được dữ liệu');
                }
            }
        }

        function GetInfoDone(s, e) {
            if (e.result != null) {

               
                var arr = e.result.split('|');
                localStorage.setItem("phuongthucky", arr[1]);

                localStorage.setItem("serial", arr[0]);                
            }

        }
    </script>

    <dx:ASPxCallback ID="cpGetInfo" ClientInstanceName="cpgetinfo" OnCallback="cpGetInfo_Callback" runat="server">
        <ClientSideEvents CallbackComplete="GetInfoDone" />
    </dx:ASPxCallback>

     <dx:ASPxHiddenField ID="hdUser" runat="server" ClientInstanceName="hduser"></dx:ASPxHiddenField>
    <div style="margin: auto; width: 50%; padding-top: 50px">
        <h2 style="font-family: Courier New; font-weight:bold">THIẾT LẬP TÀI KHOẢN KÝ</h2>
        <div>

            <div style="padding-bottom: 30px">
                 <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="true" Text="Chọn phương thức ký:" Font-Size="11.5pt"></dx:ASPxLabel>
                <div style="padding-top:20px">
                       <dx:ASPxRadioButtonList ID="rdPhuongthucky" runat="server" ValueType="System.String" Theme="Material" Width="100%" ClientInstanceName="rdphuongthuc">
                           <Items>
                               <dx:ListEditItem Text="Ký Token" Value="2" />
                               <dx:ListEditItem Text="Ký Mobile Sign" Value="1" />

                           </Items>
                           <ClientSideEvents SelectedIndexChanged="ThaydoiPT" />
                       </dx:ASPxRadioButtonList></div>

            </div>
            <div style="padding-bottom: 10px">
                <dx:ASPxPanel ID="pnMobilesign" runat="server" Width="100%" ClientInstanceName="pnmobile" ClientVisible="false">
                    <PanelCollection>
                        <dx:PanelContent>
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text=" Nhập mã đăng ký chứng thư số:" Font-Size="11.5pt"></dx:ASPxLabel><br /><br />
                        <dx:ASPxTextBox ID="txtMadangky" runat="server" Width="20%" Theme="Material"></dx:ASPxTextBox>
                            <br />
                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Hoặc số serial number:" Font-Size="11.5pt"></dx:ASPxLabel><br /><br />
                        <dx:ASPxTextBox ID="txtSerial" runat="server" Width="100%" Theme="Material"></dx:ASPxTextBox>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>

            </div>


            <div style="text-align: left; padding-top: 20px">
                <dx:ASPxButton ID="btnSave" runat="server" Text="Lưu thay đổi" Theme="Material" Width="250px" AutoPostBack="false" >
                    <ClientSideEvents Click="SaveData" />
                </dx:ASPxButton>
            </div>

            <dx:ASPxCallback ID="cpLuutt" runat="server" ClientInstanceName="cpluuthongtin" OnCallback="cpLuutt_Callback">
                <ClientSideEvents CallbackComplete="SaveDone" />
            </dx:ASPxCallback>
        </div>
    </div>
</asp:Content>

