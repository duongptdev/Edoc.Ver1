<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Register.aspx.vb" Inherits="Register" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Wed Jan 13 2021 06:46:38 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ff3e3c66f97dd2958dd9e8b" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
<head>
    <meta charset="utf-8">
    <title>Customer Information</title>
    <meta content="Customer Information" property="og:title">
    <meta content="Customer Information" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        #lblError{
            color:red;
            font-size:15px
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-content">
                    <div class="content-wrapper">
                        <div class="content-container reset-margin">
                            <div class="heading-card">Thông tin đăng ký</div>
                            <div class="subtitle-card">
                                Hãy đảm bảo bạn điền đúng thông tin để chúng tôi xác định<br>
                                danh tính một cách chuẩn xác nhất!
                            </div>
                        </div>
                        <div class="information-form w-form">
                            <form id="wf-form-Infomation-Form" name="wf-form-Infomation-Form" data-name="Infomation Form" redirect="mail/activation" data-redirect="mail/activation" method="post">
                                 <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                                <div class="two-field">
                                         
                                    <div class="field-1">
                                        <label for="Name-3" class="form-label">Họ và tên*</label>
                                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="form-field w-input"></asp:TextBox>
                                         <%--<input type="text" class="form-field w-input" autofocus="true" maxlength="256" name="Name" data-name="Name" placeholder="Nhập họ và tên" id="Name" required="">--%></div>
                                        <div class="form-divider"></div>
                                        <div class="field-2">
                                            <label for="Phone" class="form-label">Số điện thoại*</label>
                                            <asp:TextBox ID="txtSDT" runat="server" CssClass="form-field w-input" TextMode="Number"></asp:TextBox>
<%--                                             <input type="tel" class="form-field w-input" maxlength="256" name="Phone" data-name="Phone" pattern=".{10,}" placeholder="Nhập số điện thoại" title="Số điện thoại chưa chính xác" id="Phone" required="">--%></div>
                                        </div>
                                        <label for="Organization" class="form-label">Tên tổ chức</label>
                                        <asp:TextBox ID="txtTenToChuc" runat="server" CssClass="form-field w-input"></asp:TextBox>
                                        <label for="Organization" class="form-label">Mã số thuế</label>
                                        <asp:TextBox ID="txtMST" runat="server" CssClass="form-field w-input" TextMode="Number"></asp:TextBox>
                                         <%-- <input type="text" class="form-field w-input" maxlength="256" name="Organization" data-name="Organization" placeholder="Nhập tên tổ chức" id="Organization">--%>
                  <%--              <label for="MST" class="form-label">Mã số thuế</label>--%>
                                <%--<input type="text" class="form-field w-input" maxlength="256" name="MST" data-name="MST" placeholder="Nhập mã số thuế" id="MST">--%>
                                <label class="w-checkbox term-checkbox">
                                    <asp:CheckBox ID="cbDieuKhoan" runat="server"  CssClass="w-checkbox-input"/>
                                       <%-- <input type="checkbox" id="Điều khoản và chính sách" data-name="Điều khoản và chính sách" required="" class="w-checkbox-input">--%>
                                    <span for="Điều khoản và chính sách" class="checkbox-label w-form-label" style="padding-top:6px">Tôi đã đọc và đồng ý với các <a href="#" class="link">Điều khoản &amp; Chính sách</a> của <a href="#" class="link">Ca2.Signhub</a></span>
                                    </label>
                          
                                <div class="two-button">
                                    <a href="SignUp.aspx" class="ghost-button w-button">Quay lại</a>
                                    <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" CssClass="form-button button-color add-width w-button" OnClick="btnDangKy_Click" />
                                   <%-- <a href="RequestSucces.aspx" class="form-button button-color add-width w-button" style="width: 120px">Đăng ký</a>--%>
                                </div>
                           
                            </form>
                            <div class="w-form-done">
                                <div>Thank you! Your submission has been received!</div>
                            </div>
                            <div class="w-form-fail">
                                <div>Oops! Something went wrong while submitting the form.</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-image">
                    <img src="Content/images/Group-14557.png" loading="lazy" alt="" class="image"/>
                </div>
            </div>
            <div class="copyright">
                <img src="Content/images/Icon-material-copyright.png" loading="lazy" alt="" class="image-2">
                <div class="text-block">Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
            </div>
        </div>
        <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="Scripts/js/webflow.js" type="text/javascript"></script>
        <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
          <script>
            $(document).ready(function () {
                $("#txtHoTen").attr("placeholder", "Nhập họ và tên");
                $("#txtSDT").attr("placeholder", "Nhập số điện thoại");
                $("#txtTenToChuc").attr("placeholder", "Nhập tên tổ chức");
                $("#txtMST").attr("placeholder", "Nhập mã số thuế");
            });
        </script>
     <%--   <script>
           $('#btnDangKy').click(function () {
                var a = $('#txtHoTen').val();
                var b = $("#txtSDT").val();
                var c = $("#txtTenToChuc").val();
                var d = $("#txtMST").val();
                if (a == "" || b == "" || c == "" | d == "") {
                    alert("Mời nhập đầy đủ thông tin");
                    return false;
                }
            });
        </script>--%>
    </form>
</body>
</html>