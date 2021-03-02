<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SetPassword.aspx.vb" Inherits="SetPassword" %>
<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Wed Jan 13 2021 06:46:38 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ff56c756062a3215c5c0a16" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
<head>
    <meta charset="utf-8">
    <title>Set Up Password</title>
    <meta content="Set Up Password" property="og:title">
    <meta content="Set Up Password" property="twitter:title">
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
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="card">
                <div class="card-content">
                    <div class="content-container">
                        <div class="content">
                            <div class="heading-card">Cài đặt mật khẩu</div>
                            <div class="subtitle-card">
                                Chỉ còn một bước cuối để tăng tính bảo mật cho<br>
                                tài khoản của bạn. Hãy thiết lập mật khẩu.
                            </div>
                        </div>
                        <div class="email-form w-form">
                            <form id="wf-form-Password-Form" name="wf-form-Password-Form" data-name="Password Form" redirect="sign-in" data-redirect="sign-in" method="post" class="form">
                                <label for="Password" class="form-label">Mật khẩu</label>
                                <div class="password-field">
                                    <asp:TextBox ID="txtPass" runat="server" CssClass="form-field w-input" TextMode="Password"></asp:TextBox>
                                    <%--                  <input type="password" class="form-field w-input" autofocus="true" maxlength="256" name="Password" data-name="Password" pattern="[0-9a-zA-Z]{6,}" placeholder="Nhập mật khẩu" title="Vui lòng nhập đúng định dạng mật khẩu" id="password1" required="">--%>
                                    <a href="#" class="eye-icon w-inline-block" onclick="showPassword1()">
                                        <img src="Content/images/Mask-Group-432.png" loading="lazy" alt="" class="eye-image"></a>
                                </div>
                                <div class="password-field">
                                    <asp:TextBox ID="txtrePass" runat="server" CssClass="form-field w-input" TextMode="Password"></asp:TextBox>
                                    <%--           <input type="password" class="form-field add-margin w-input" maxlength="256" name="Re-type-password" data-name="Re-type password" pattern="[0-9a-zA-Z]{6,}" placeholder="Nhập lại mật khẩu" title="Vui lòng nhập đúng định dạng mật khẩu" id="password2" required="">--%>
                                    <a href="#" class="eye-icon w-inline-block" onclick="showPassword2()">
                                        <img src="Content/images/Mask-Group-432.png" loading="lazy" alt="" class="eye-image"></a>
                                </div>
                                <div class="password-hint">
                                    <div class="hint-container">
                                        <div class="rectangle"></div>
                                        <div class="hint-content">Mật khẩu tối thiểu 6 ký tự</div>
                                    </div>
                                    <div class="hint-container add-margin">
                                        <div class="rectangle"></div>
                                        <div class="hint-content">Không chứa các ký tự đặc biệt /, &gt;, &lt; và dấu cách</div>
                                    </div>
                                </div>
                                <div>
                                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger"></asp:Label>
                                </div>
                                <asp:Button ID="btnDangky" runat="server" Text="Đăng ký" CssClass="form-button button-color w-button text-center input-group" OnClick="btnDangky_Click" />
                                <%--  <a value="Đăng ký" href="SignIn.aspx" class="form-button button-color w-button text-center input-group"  style="width:120px">Đăng ký</a>--%>
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
                    <img src="Content/images/Group-14558.png" loading="lazy" alt="" class="image">
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
            function showPassword1() {
                var x = document.getElementById("txtPass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
            function showPassword2() {
                var x = document.getElementById("txtrePass");
                if (x.type === "password") {
                    x.type = "text";
                } else {
                    x.type = "password";
                }
            }
        </script>
        <script>
            $('#btnDangky').click(function () {
                var x = $("#txtPass").val();
                var y = $("#txtrePass").val();
                if (x != y) {
                    alert("Xác nhận mật khẩu không đúng");
                    return false;
                }
            });
        </script>
          <script>
            $(document).ready(function () {
                $("#txtrePass").attr("placeholder", "Nhập lại mật khẩu");
                $("#txtPass").attr("placeholder", "Nhập mật khẩu");
            });
        </script>
    </form>
</body>
</html>
