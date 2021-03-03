<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MultipleReviewAndSend.aspx.vb" Inherits="MultipleReviewAndSend" %>

<!DOCTYPE html><!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Mar 02 2021 02:22:13 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="603d141e9de5d766260641aa" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8">
    <title>Review And Send</title>
    <meta content="Review And Send" property="og:title">
    <meta content="Review And Send" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js" type="text/javascript"></script>
    <script
        type="text/javascript">WebFont.load({ google: { families: ["Merriweather:300,300italic,400,400italic,700,700italic,900,900italic", "Great Vibes:400"] } });</script>
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script
        type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
</head>

<body>
    <header id="nav" class="sticky-nav">
        <div class="close">
            <a href="../index.html" class="back-to-home w-inline-block"><img src="Content/images/Icons-Close-16px.svg"
                    loading="lazy" alt=""></a>
        </div>
        <div class="step-tab">
            <div class="done---step">
                <div class="dot-step"><img src="Content/images/Done-Step.png" loading="lazy" alt=""></div>
                <div class="done-step">Tải lên</div>
            </div>
            <div class="spacing---step"><img src="Content/images/Link-Step.png" loading="lazy" alt=""></div>
            <div class="non-step">
                <div class="dot-step"><img src="Content/images/Done-Step.png" loading="lazy" alt=""></div>
                <div class="done-step">Xem trước dữ liệu</div>
            </div>
            <div class="spacing---step"><img src="Content/images/Link-Step.png" loading="lazy" alt=""></div>
            <div class="non-step">
                <div class="dot-step"><img src="Content/images/Group-14876.svg" loading="lazy" alt=""></div>
                <div class="next-step">Xác nhận và hoàn tất</div>
            </div>
        </div>
        <div class="nav-right">
            <div class="nav-divider"></div>
            <div class="nav-user">
                <div class="user-avatar">
                    <div class="first-word-name">K</div>
                </div><img src="Content/images/Drop Default.svg" loading="lazy" alt="" class="drop-default"><img
                    src="../images/Drop-Hover.svg" loading="lazy" alt="" class="drop-hover"><img
                    src="../images/Drop-Clicked.svg" loading="lazy" alt="" class="drop-clicked">
                <div class="user-dropdown">
                    <div class="user-drop-card">
                        <div class="user-name-card">Nguyễn Trần Văn Khanh</div>
                        <div class="user-email-card">nguyentranvankhanh123@gmail.com</div>
                        <div class="card-divider add-margin"></div>
                        <a href="../settings.html" class="option-button w-inline-block"><img
                                src="../images/Account-Setting.svg" loading="lazy" alt="" class="icon-option">
                            <div class="option-text">Cài đặt tài khoản</div>
                        </a>
                        <a href="../setting/plan-and-billing.html" class="option-button w-inline-block"><img
                                src="../images/Plan.svg" loading="lazy" alt="" class="icon-option">
                            <div class="option-text">Gói dịch vụ</div>
                        </a>
                        <a href="#" class="option-button w-inline-block"><img src="../images/Help.svg" loading="lazy"
                                alt="" class="icon-option">
                            <div class="option-text">Trợ giúp và hỗ trợ</div>
                        </a>
                        <div class="card-divider"></div>
                        <a href="#" class="option-button remove-padding w-inline-block"><img src="../images/Log-Out.svg"
                                loading="lazy" alt="" class="icon-option">
                            <div class="option-text">Đăng xuất</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="review-body">
        <div class="review-and-send">
            <div class="review-text">
                <div class="review-heading">Xác nhận và gửi yêu cầu</div>
                <div class="heading-review-form">Email gửi người nhận</div>
            </div>
            <div class="review-form">
                <div class="w-form">
                    <form id="email-form" name="email-form" data-name="Email Form">
                        <div class="mail-title"><label for="name" class="message-label">Tiêu đề Email*</label><input
                                type="text" class="text-field-4 w-input" maxlength="256" name="name" data-name="Name"
                                placeholder="Nhập tiêu đề mail" id="name" required=""></div>
                        <div class="mail-message"><label for="email" class="message-label">Lời nhắn</label><textarea
                                placeholder="Nhập lời nhắn" maxlength="5000" id="field" name="field"
                                class="textarea w-input"></textarea></div>
                        <div class="form-review-button">
                            <a href="../add-signature-field.html" class="button-5 w-button">Quay lại</a><input
                                type="submit" value="Gửi yêu cầu" data-wait="" class="submit-button w-button">
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
    </div>
    <div class="request-info">
        <div class="request-container">
            <div class="heading-info">Thông tin chung</div>
            <div class="sender-content">
                <div class="sender-title">Người gửi</div>
                <div class="sender-subtitle">Nguyen Tran Van Khanh</div>
            </div>
            <div class="info-divider"></div>
            <div class="file-name-info">
                <div class="sender-title change-color">Người gửi</div>
                <div class="file-name-border">
                    <div class="file-text">Bảng thanh toán lương CBCNV Công ty NACENCOMM</div>
                </div>
            </div>
            <div class="info-divider"></div>
            <div class="sender-title add-margin">Người nhận</div>
            <div class="list-info">
                <div class="order-rectangle add-prop">
                    <div class="order-text">1</div>
                </div>
                <div class="order-card">
                    <div class="title-receiver">
                        <div class="heading">Ký tài liệu</div>
                    </div>
                    <div class="info-review">
                        <div class="info-name">Đỗ Thị Chúc</div>
                        <div class="info-mail">dochuc@cavn.vn</div>
                    </div>
                </div>
            </div>
            <div class="list-info">
                <div class="order-rectangle add-prop">
                    <div class="order-text">2</div>
                </div>
                <div class="order-card">
                    <div class="title-receiver">
                        <div class="heading">Ký tài liệu</div>
                    </div>
                    <div class="info-review">
                        <div class="info-name">Phùng Huy Tâm</div>
                        <div class="info-mail">tam@cavn.vn</div>
                    </div>
                </div>
            </div>
            <div class="list-info">
                <div class="order-rectangle add-prop">
                    <div class="order-text">3</div>
                </div>
                <div class="order-card">
                    <div class="title-receiver">
                        <div class="heading">Ký tài liệu</div>
                    </div>
                    <div class="info-review">
                        <div class="info-name">Đào Diệu Thúy</div>
                        <div class="info-mail">thuydt@cavn.vn</div>
                    </div>
                </div>
            </div>
            <div class="list-info">
                <div class="order-rectangle add-prop">
                    <div class="order-text">4</div>
                </div>
                <div class="order-card">
                    <div class="title-receiver">
                        <div class="heading">Ký tài liệu</div>
                    </div>
                    <div class="info-review">
                        <div class="info-name">Nguyễn Thị Thu Hồng</div>
                        <div class="info-mail">hongktqd123@gmail.com</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="footer-container">
            <div class="footer-text">Powered by <a href="#" class="link-5">Ca2</a>
            </div>
            <div class="footer-link">
                <a href="#" class="link-footer">Liên hệ</a>
                <div class="footer-divider"></div>
                <a href="#" class="link-footer">Điều khoản sử dụng</a>
                <div class="footer-divider"></div>
                <a href="#" class="link-footer">Chính sách bảo mật</a>
                <div class="footer-divider"></div>
                <a href="#" class="link-footer">Quyền sở hữu trí tuệ</a>
            </div>
            <div class="copyright-footer"><img src="../images/Icon-metro-copyright.png" loading="lazy" alt=""
                    class="image-7">
                <div class="footer-text">Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
            </div>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script src="../js/webflow.js" type="text/javascript"></script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>

</html>

