<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="PassWord.aspx.vb" Inherits="PassWord" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="setting-body">
    <div class="setting-menu">
      <div class="title-menu">cài đặt</div>
      <a href="SettingAccount.aspx" class="menu-item-link w-inline-block">
        <div class="menu-item-text">Thiết lập tài khoản</div>
      </a>
      <a href="Electronic-Signature.aspx" class="menu-item-link w-inline-block">
        <div class="menu-item-text">Chữ ký điện tử</div>
      </a>
      <a href="DigitalSignture.aspx" class="menu-item-link w-inline-block">
        <div class="menu-item-text">Chữ ký số</div>
      </a>
      <a href="PassWord.aspx" aria-current="page" class="menu-item-link w-inline-block w--current">
        <div class="menu-item-text">Mật khẩu</div>
      </a>
      <a href="#" class="menu-item-link w-inline-block">
        <div class="menu-item-text">Gói dịch vụ</div>
      </a>
    </div>
    <div class="setting-content">
      <div class="title-body">Mật khẩu</div>
      <div class="subtitle-body">Chủ động quản lý quyền riêng tư và bảo mật của bạn. Giữ cho mật khẩu của bạn<br>an toàn và luôn được cập nhật.</div>
      <div class="add-signature-button">
        <div class="button-text" id="datechange">Lần cuối thay đổi: </div>
        <div class="password-divider"></div>
        <a href="ChangePass.aspx" class="password-button w-inline-block"><img src="Content/images/Lock Icon.png" loading="lazy" alt="" class="icon-button">
          <div class="password-text">Đổi mật khẩu</div>
        </a>
      </div>
    </div>
  </div>
    <script src="Scripts/jquery-3.3.1.min.js"></script>
       <script>
        $(document).ready(function () {
    
            var datechang = '<%= Session("DateChange") %>';
           
             document.getElementById("datechange").innerHTML ="Lần cuối thay đổi:"+ datechang;
        });
    </script>
        </asp:Content>