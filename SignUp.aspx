<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SignUp.aspx.vb" Inherits="SignUp" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Wed Jan 13 2021 06:46:38 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ff2cfb7b1ab6d1256371d41" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
<head>
    <meta charset="utf-8">
    <title>Sign Up</title>
    <meta content="Sign Up" property="og:title">
    <meta content="Sign Up" property="twitter:title">
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
</head>
<body class="body">
    <form id="form1" runat="server">
        <div class="container">
            <div class="card-container">
                <div class="card">
                    <div class="card-content">
                        <div class="content-container">
                            <div class="heading-card">Đăng ký tài khoản</div>
                            <div class="subtitle-card">Quy trình đăng ký rất đơn giản và nhanh chóng.<br>
                                Hãy nhập Email của bạn để bắt đầu</div>
                            <div class="email-form w-form">

                                <label for="Email" class="form-label">Email*</label>
                                <asp:TextBox ID="txtEmail" runat="server" CssClass="orm-field w-input"></asp:TextBox>
                                <%--  <input type="email" class="form-field w-input" autofocus="true" maxlength="256" name="Email" data-name="Email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Nhập Email của bạn" title="Vui lòng nhập đúng định dạng mail" id="Email" required="">--%>
                                <%-- <a href="Register.aspx" class="form-button button-color w-button"  style="width:120px">Đăng ký</a>--%>
                                <div>
                                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label></div>




                                <div class="w-form-done">
                                    <div>Thank you! Your submission has been received!</div>
                                </div>
                                <div class="w-form-fail">
                                    <div>Oops! Something went wrong while submitting the form.</div>
                                </div>
                            </div>
                            <div class="d-flex flex-column">
                                <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" CssClass="form-button button-color w-button d-flex flex-column" OnClick="btnDangKy_Click" />

                            </div>
                            <div class="text-link">Bạn đã có tài khoản? <a href="SignIn.aspx" class="link">Đăng nhập</a> ngay</div>
                        </div>
                    </div>
                    <div class="card-image">
                        <img src="Content/images/Group-15086.png" loading="lazy" alt="" class="image"></div>
                </div>
            </div>

            <div class="copyright">
                <img src="Content/images/Icon-material-copyright.png" loading="lazy" alt="" class="image-2">
                <div class="text-block">Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
            </div>
        </div>
        <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="js/webflow.js" type="text/javascript"></script>
        <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
        <script>
            $(document).ready(function () {
                $("#txtEmail").attr("placeholder", "Nhập Email của bạn");

            });
        </script>
        <script>
            $('#btnDangKy').click(function () {
                var a = $('#txtEmail').val();
                if (a == "") {
                    alert("Mời nhập Email");
                    return false;
                }
            });
        </script>
    </form>
</body>
</html>



