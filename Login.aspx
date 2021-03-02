<%@ Page Language="VB"  AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
    <link href="css/normalize.css" rel="stylesheet" type="text/css" />
    <link href="css/webflow.css" rel="stylesheet" type="text/css" />
    <link href="css/qlcv.webflow.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.4.7/webfont.js" type="text/javascript"></script>
    <script type="text/javascript">WebFont.load({ google: { families: ["Roboto:100,100italic,300,300italic,regular,italic,500,500italic,700,700italic,900,900italic:latin,vietnamese"] } });</script>
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="https://daks2k3a4ib2z.cloudfront.net/img/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="https://daks2k3a4ib2z.cloudfront.net/img/webclip.png" rel="apple-touch-icon" />
   
</head>
<body class="body">
   <form id="form1" runat="server">
        <div class="div-block">
            <img src="img/logoNCM1.png" class="image" />
            <div class="w-form">
                <div id="email-form"   class="form">
                    <div class="formlogin">
                        <div class="text-block-4"></div>
                        <dx:ASPxTextBox ID="txtUserID" runat="server" Width="100%" ClientInstanceName="txtuserid" Border-BorderColor="Transparent" Border-BorderStyle="None" Font-Names="Courier New" Font-Size="11pt"></dx:ASPxTextBox>
                 
                    </div>
                    <div class="formlogin">
                        <div class="text-block-4"></div>
                           <dx:ASPxTextBox ID="txtPass" runat="server" Width="100%" ClientInstanceName="txtpassword" Border-BorderColor="Transparent" Border-BorderStyle="None" Password="true" Font-Names="Courier New" Font-Size="11pt"></dx:ASPxTextBox>
                    </div>
          <div style="text-align:center">
                    <a href="#" class="button w-button" onclick="Checkaccount()">Đăng nhập</a>
                      <br />
                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Đăng ký tài khoản"  RenderMode="Link" Theme="Material" AutoPostBack="false">
                        <ClientSideEvents Click="function () { window.location.href = 'register.aspx';}" />
                    </dx:ASPxButton></div>
                </div>
            </div>
        </div>
    </form>
   <script type="text/javascript">
      
         function Checkaccount()
        {
            var uid, password;
            uid = txtuserid.GetText();
            password = txtpassword.GetText();
            if (uid != '' && password != '') {
                cplogin.PerformCallback(uid + '|' + password);
            }
            else
                alert('Vui lòng nhập đủ thông tin đăng nhập');
       }
       function LoginComp(s, e) {
           if (e.result != null) {
               //0: Tai khoan khong dung,1: thành công, -1: Lỗi,  -2 :TK chưa kích hoạt, -3: Tài khoản đã bị khóa, -4: Tài khoản bị khóa do dang nhap sai qua 5 lan, -5: Thong tin dang nhap khong dung
               
               var arr = e.result.split('|');
               var trangthai = arr[0];
               
               if (trangthai == 1) {

                   localStorage.setItem("user", arr[1]);

                   window.location.href = 'Danhsachyeucau.aspx';
               } else if (trangthai == 0) {
                   alert('Tài khoản đăng nhập không đúng.');

               } else if (trangthai == -1) {
                   alert('Lỗi');
               } else if (trangthai == -2) {
                   alert('Tài khoản chưa kích hoạt.');

               } else if (trangthai == -3) {
                   alert('Tài khoản đã bị khóa.');
               }
                else if (trangthai == -4) {
                   alert('Tài khoản đã bị khóa do đăng nhập sai quá 5 lần.');
               }
                else if (trangthai == -5) {
                   alert('Thông tin đăng nhập không đúng.');
               }
           }
       }
   </script>
    <dx:ASPxCallback ID="cpLogin" runat="server" OnCallback="cpLogin_Callback" ClientInstanceName="cplogin">
        <ClientSideEvents CallbackComplete="LoginComp" />
    </dx:ASPxCallback>
</body>

</html>
