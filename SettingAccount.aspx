<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="SettingAccount.aspx.vb" Inherits="SettingAccount" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" />
    <link href="Content/css/normalize.css" rel="stylesheet" />
    <link href="Content/css/webflow.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/js/webflow.js"></script>
</asp:Content>
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
            <div class="title-body">Thông tin tài khoản</div>
            <div class="user-info">
                <div class="user-avatar">
                    <img src="Content/images/avatar.png" loading="lazy" alt=""></div>
                <div class="user-email">
                    <div class="name" id="ten"></div>
                    <div class="email" id="email"></div>
                </div>
            </div>
            <div class="verify-account">
                <img src="Content/images/Done Icon.png" loading="lazy" alt="" class="done-icon">
                <div class="verify-text">Tài khoản đã xác minh</div>
            </div>
            <div class="user-divider"></div>
            <div class="personal-info">
                <div class="info-left">
                    <div class="text-wrapper">
                        <div class="info-title">Họ và tên</div>
                        <div class="info-subtitle" id="hoten"></div>
                    </div>
                    <div class="text-wrapper">
                        <div class="info-title">Email</div>
                        <div class="info-subtitle" id="mail"></div>
                    </div>
                    <div class="text-wrapper">
                        <div class="info-title">Số điện thoại</div>
                        <div class="info-subtitle" id="sdt"></div>
                    </div>
                </div>
                <div class="info-right">
                    <div class="text-wrapper">
                        <div class="info-title">Công ty và địa chỉ</div>


                        
                    </div>
                    <div class="text-wrapper">
                        <div class="info-title">CMND/ CCCD/ Passport</div>
                        <div class="info-subtitle"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            var name='<%= Session("Ten") %>';
            var email='<%= Session("Login") %>';
            var sdt='<%= Session("SDT") %>';
            var mst='<%= Session("MST") %>';
            var datechang = '<%= Session("DateChange") %>';
             document.getElementById("ten").innerHTML = name;
             document.getElementById("email").innerHTML = email;
             document.getElementById("hoten").innerHTML = name;
             document.getElementById("mail").innerHTML = email;
             document.getElementById("sdt").innerHTML = sdt;
             document.getElementById("ten").innerHTML = name;
        });
    </script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->

</asp:Content>
