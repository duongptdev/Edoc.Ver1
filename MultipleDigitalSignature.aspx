<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MultipleDigitalSignature.aspx.vb" Inherits="MultipleDigitalSignature" %>

<!DOCTYPE html><!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Mar 02 2021 02:22:13 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="603d19d77e492c4c40607dbb" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8">
    <title>Digital Signing</title>
    <meta content="Digital Signing" property="og:title">
    <meta content="Digital Signing" property="twitter:title">
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
    <div class="background-modal">
        <div class="modal-form">
            <div class="heading-modal align-right">
                <div class="close-button"><img src="Content/images/Icons-Close-16px.svg" loading="lazy" alt="Close Modal"></div>
            </div>
            <form class="content-dialog">
                <div class="title-dialog">Ký Số</div>
                <div class="digital-content">
                    <div class="sign-method">
                        <div class="selection-label">Chọn phương thức ký số:</div>
                        <select class="sign-select" id="sign-method">
                            <option value="">Chọn phương thức ký</option>
                            <option value="usb-token">Ký bằng USB Token</option>
                            <option value="mobile-sign">Ký bằng Mobile Sign</option>
                        </select>
                    </div>
                    <div class="digital-cert-icate">
                        <div class="selection-label">Nhập mã đăng ký:</div>
                        <input id="register-passcode" class="register-input" type="text">
                    </div>
                    <div class="digital-cert-icate">
                        <div class="selection-label">Chứng thư số:</div>
                        <select class="sign-select" id="digital-cert">
                            <option value="digital-certificate">5402BC5ACE669C20150000000379</option>
                        </select>
                    </div>
                    <div id="usb-token" class="usb-token">
                        <div class="certificate-text">
                            <div class="label">Tên chứng thư:</div>
                            <div class="label-content">Nguyễn Trần Văn Khanh</div>
                        </div>
                        <div class="certificate-text">
                            <div class="label">Ngày cấp:</div>
                            <div class="label-content">15:23 15/05/2019</div>
                        </div>
                        <div class="certificate-text">
                            <div class="label">Ngày hết hạn:</div>
                            <div class="label-content">15/05/2021</div>
                        </div>
                        <div class="certificate-text no-margin">
                            <div class="label">Đơn vị cấp:</div>
                            <div class="label-content">Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
                        </div>
                    </div>
                    <div id="mobile-sign" class="mobile-sign">
                        <div class="certificate-text">
                            <div class="label">Tên chứng thư:</div>
                            <div class="label-content">Nguyễn Trần Văn Khanh</div>
                        </div>
                        <div class="certificate-text">
                            <div class="label">Thiết bị:</div>
                            <div class="label-content">PC-DE5Z 009</div>
                        </div>
                        <div class="certificate-text">
                            <div class="label">Device ID:</div>
                            <div class="label-content">HFNS-JSHEFHU-ZJSD-BHD</div>
                        </div>
                        <div class="certificate-text">
                            <div class="label">Ngày cấp:</div>
                            <div class="label-content">15:23 15/05/2019</div>
                        </div>
                        <div class="certificate-text">
                            <div class="label">Ngày hết hạn:</div>
                            <div class="label-content">15/05/2021</div>
                        </div>
                        <div class="certificate-text no-margin">
                            <div class="label">Đơn vị cấp:</div>
                            <div class="label-content">Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
                        </div>
                    </div>
                    <div class="qr-code">
                        <img src="images/QR-Code.png" loading="lazy" alt="" class="image-13">
                        <div class="hint-qr">Vui lòng quét mã QR Code để kết nối với tài khoản Mobile Sign</div>
                    </div>
                </div>
                <div class="center-element">
                    <button class="button-6 w-button" type="submit">Xác nhận</button>
                </div>
            </form>
        </div>
        <div class="modal-form add-width">
            <div class="heading-modal reset">
                <div class="title-modal upsize">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                <div class="close-button add-margin"><img src="Content/images/Path-30115.png" loading="lazy"
                        alt="Close Modal"></div>
            </div>
            <div class="view-image-container">
                <div class="view-image">
                    <div class="template-image remove-margin"><img src="../images/Salary-Example.png" loading="lazy"
                            width="1161" sizes="100vw"
                            srcset="../images/Salary-Example-p-500.png 500w, ../images/Salary-Example-p-800.png 800w, ../images/Salary-Example.png 833w"
                            alt="" class="image-16">
                        <div class="template-name">
                            <div class="name-file">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                            <div class="page-file">1/1</div>
                        </div>
                    </div>
                    <div class="template-image remove-margin"><img src="../images/Salary-Example.png" loading="lazy"
                            width="1161" sizes="100vw"
                            srcset="../images/Salary-Example-p-500.png 500w, ../images/Salary-Example-p-800.png 800w, ../images/Salary-Example.png 833w"
                            alt="" class="image-16">
                        <div class="template-name">
                            <div class="name-file">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                            <div class="page-file">1/1</div>
                        </div>
                    </div>
                    <div class="template-image remove-margin"><img src="../images/Salary-Example.png" loading="lazy"
                            width="1161" sizes="100vw"
                            srcset="../images/Salary-Example-p-500.png 500w, ../images/Salary-Example-p-800.png 800w, ../images/Salary-Example.png 833w"
                            alt="" class="image-16">
                        <div class="template-name">
                            <div class="name-file">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                            <div class="page-file">1/1</div>
                        </div>
                    </div>
                    <div class="template-image remove-margin"><img src="../images/Salary-Example.png" loading="lazy"
                            width="1161" sizes="100vw"
                            srcset="../images/Salary-Example-p-500.png 500w, ../images/Salary-Example-p-800.png 800w, ../images/Salary-Example.png 833w"
                            alt="" class="image-16">
                        <div class="template-name">
                            <div class="name-file">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                            <div class="page-file">1/1</div>
                        </div>
                    </div>
                    <div class="template-image remove-margin"><img src="../images/Salary-Example.png" loading="lazy"
                            width="1161" sizes="100vw"
                            srcset="../images/Salary-Example-p-500.png 500w, ../images/Salary-Example-p-800.png 800w, ../images/Salary-Example.png 833w"
                            alt="" class="image-16">
                        <div class="template-name">
                            <div class="name-file">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                            <div class="page-file">1/1</div>
                        </div>
                    </div>
                    <div class="template-image remove-margin"><img src="../images/Salary-Example.png" loading="lazy"
                            width="1161" sizes="100vw"
                            srcset="../images/Salary-Example-p-500.png 500w, ../images/Salary-Example-p-800.png 800w, ../images/Salary-Example.png 833w"
                            alt="" class="image-16">
                        <div class="template-name">
                            <div class="name-file">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                            <div class="page-file">1/1</div>
                        </div>
                    </div>
                    <div class="template-image remove-margin"><img src="../images/Salary-Example.png" loading="lazy"
                            width="1161" sizes="100vw"
                            srcset="../images/Salary-Example-p-500.png 500w, ../images/Salary-Example-p-800.png 800w, ../images/Salary-Example.png 833w"
                            alt="" class="image-16">
                        <div class="template-name">
                            <div class="name-file">Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
                            <div class="page-file">1/1</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <header id="nav" class="sticky-nav">
        <div class="close">
            <a href="index.html" class="back-to-home w-inline-block"><img src="Content/images/Icons-Close-16px.svg"
                    loading="lazy" alt="" class="close-icon">
            </a>
            <div class="file-name">Lô: Bảng thanh toán lương CBCNV Công ty CP Công nghệ thẻ NACENCOMM</div>
        </div>
        <div class="nav-right">
            <div>
                <div class="request-state">Đang tiến hành</div>
            </div>
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
    <div class="request-content">
        <div class="hide-background">
            <div class="checkbox-container">
                <div class="form-block-2 w-form">
                    <label class="w-checkbox accept-checkbox"><input type="checkbox" id="accept-checkbox-id"
                            name="checkbox" data-name="Checkbox" class="w-checkbox-input"><span
                            class="checkbox-label-2 w-form-label">Tôi đồng ý sử dụng phương thức ký điện tử và ký số để
                            thực hiện giao dịch</span></label>
                </div>
            </div>
        </div>
        <div class="request-tab">
            <div data-duration-in="300" data-duration-out="100" class="tabs-detail w-tabs">
                <div class="tabs-menu w-tab-menu">
                    <a data-w-tab="Content" class="tab-link-tab-1 w-inline-block w-tab-link w--current">
                        <div class="text-block-8">Nội dung văn bản</div>
                    </a>
                    <a data-w-tab="Activity" class="tab-link-tab-2 w-inline-block w-tab-link">
                        <div class="text-block-7">Lịch sử hoạt động</div>
                    </a>
                </div>
                <div class="tabs-content w-tab-content">
                    <div data-w-tab="Content" class="tab-pane-content w-tab-pane w--tab-active">
                        <div class="add-receiver-body add-margin">
                            <div class="preview-file-body">
                                <div class="heading-receiver">
                                    <div class="heading-step">Nội dung chi tiết</div>
                                </div>
                                <div class="file-check-info">
                                    <div class="check-content">
                                        <div class="good-info">Yêu cầu đang chờ: <span class="waiting-text">90/90</span>
                                        </div>
                                        <div class="check-divider"></div>
                                        <a href="#" class="view-all-file w-inline-block"><img
                                                src="Content/images/eye-icon.png" loading="lazy" alt="">
                                            <div class="view-all-text">Xem tất cả</div>
                                        </a>
                                    </div>
                                    <a href="#" class="sign-map w-inline-block">
                                        <div class="map-text">Xem sơ đồ lệnh ký</div><img src="Content/images/Sign-Map.png"
                                            loading="lazy" alt="">
                                    </a>
                                </div>
                                <div class="file-info-table">
                                    <div class="table-wrapper">
                                        <table class="table-ui">
                                            <colgroup>
                                                <col width="30" />
                                                <col width="50" />
                                                <col width="100" />
                                                <col width="200" />
                                                <col width="300" />
                                                <col width="250" />
                                                <col width="150" />
                                                <col width="150" />
                                                <col width="130" />
                                                <col width="130" />
                                            </colgroup>

                                            <thead>
                                                <tr>
                                                    <th><input type="checkbox" /></th>
                                                    <th>STT</th>
                                                    <th>Thời gian</th>
                                                    <th>Tên CBCNV</th>
                                                    <th>Email</th>
                                                    <th>Bộ phận</th>
                                                    <th>Chức vụ</th>
                                                    <th>Lương cơ bản</th>
                                                    <th>Lương SP</th>
                                                    <th>PC ăn trưa</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>1</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Phùng Huy Tâm</div>
                                                        </div>
                                                    </td>
                                                    <td>tam@cavn.vn</td>
                                                    <td>Ban Giám Đốc</td>
                                                    <td>Giám đốc</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>2</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Đỗ Thị Chúc</div>
                                                        </div>
                                                    </td>
                                                    <td>dochuc@cavn.vn</td>
                                                    <td>Phòng Kế Toán</td>
                                                    <td>Kế toán trưởng</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>3</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Đào Diệu Thúy</div>
                                                        </div>
                                                    </td>
                                                    <td>thuydt@cavn.vn</td>
                                                    <td>Phòng Hành Chính</td>
                                                    <td>Thủ quỹ</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>4</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Nguyễn Trần Văn Khanh</div>
                                                        </div>
                                                    </td>
                                                    <td>nguyentranvankhanh123@gmail.com</td>
                                                    <td>Ban quản lí và phát triển dự án</td>
                                                    <td>Nhân viên</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>5</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Nguyễn Trần Văn Khanh</div>
                                                        </div>
                                                    </td>
                                                    <td>nguyentranvankhanh123@gmail.com</td>
                                                    <td>Ban quản lí và phát triển dự án</td>
                                                    <td>Nhân viên</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>6</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Nguyễn Trần Văn Khanh</div>
                                                        </div>
                                                    </td>
                                                    <td>nguyentranvankhanh123@gmail.com</td>
                                                    <td>Ban quản lí và phát triển dự án</td>
                                                    <td>Nhân viên</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>7</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Nguyễn Trần Văn Khanh</div>
                                                        </div>
                                                    </td>
                                                    <td>nguyentranvankhanh123@gmail.com</td>
                                                    <td>Ban quản lí và phát triển dự án</td>
                                                    <td>Nhân viên</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                                <tr>
                                                    <td><input type="checkbox" /></td>
                                                    <td>8</td>
                                                    <td>30/ 01/2021</td>
                                                    <td>
                                                        <div class="person-name">
                                                            <img class="name-icon" src="images/eye icon.png" alt="">
                                                            <div>Nguyễn Trần Văn Khanh</div>
                                                        </div>
                                                    </td>
                                                    <td>nguyentranvankhanh123@gmail.com</td>
                                                    <td>Ban quản lí và phát triển dự án</td>
                                                    <td>Nhân viên</td>
                                                    <td>4,750,000</td>
                                                    <td>1,000,000</td>
                                                    <td>550,000</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="pagination-table">
                                        <div class="pagination-block">
                                            <div class="pagination">
                                                <a href="#"><img src="Content/images/Previous-Icon.png" alt=""></a>
                                                <a href="#" class="active">1</a>
                                                <a href="#">2</a>
                                                <a href="#">3</a>
                                                <a href="#">4</a>
                                                <a href="#">5</a>
                                                <a href="#">6</a>
                                                <a href="#"><img src="Content/images/Next-Icon.png" alt=""></a>
                                            </div>
                                        </div>
                                        <div class="page-count">Trang 1 trên 10 (90 bản ghi)</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footer-button w-clearfix">
                            <div class="sign-button-container">
                                <a href="index.html" class="back-page w-button">Từ chối 90/90</a>
                                <a href="#" id="sign-button" class="sign-button w-button">Ký 90/90</a>
                            </div>
                        </div>
                    </div>
                    <div data-w-tab="Activity" class="w-tab-pane">
                        <div class="function-panel">
                            <div class="download-icon"><img src="../images/Download.png" loading="lazy" alt=""></div>
                            <div class="print-icon"><img src="../images/Print.png" loading="lazy" alt=""></div>
                        </div>
                        <div class="page-content">
                            <div class="request-infomation">
                                <div class="request-heading">
                                    <div class="info-heading">Thông tin chi tiết</div>
                                </div>
                                <div class="request-body">
                                    <div class="request-text">
                                        <div class="info-wrapper">
                                            <div class="title-info">Tiêu đề Mail</div>
                                            <div class="subtitle-info">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.
                                            </div>
                                        </div>
                                        <div class="info-wrapper">
                                            <div class="title-info">ID Văn bản</div>
                                            <div class="subtitle-info">647b1951-4d66-416f-8b84-5ac5e7a01d14</div>
                                        </div>
                                        <div class="info-wrapper">
                                            <div class="title-info">Ngày tạo văn bản</div>
                                            <div class="subtitle-info">15:05 13/12/2020</div>
                                        </div>
                                        <div class="info-wrapper">
                                            <div class="title-info">Ngày gửi</div>
                                            <div class="subtitle-info">15:05 15/12/2020</div>
                                        </div>
                                        <div class="info-wrapper">
                                            <div class="title-info add-margin">Người nhận</div>
                                            <div class="recipient-info">
                                                <div class="recipient-text">
                                                    <div class="subtitle-info">Nguyễn Thu Hồng</div>
                                                    <div class="hint-text">hongktqd@nacencomm.vn</div>
                                                </div>
                                                <div class="recipient-role"><img src="../images/Sign.png" loading="lazy"
                                                        alt="" class="image-11">
                                                    <div class="subtitle-info">Ký tài liệu</div>
                                                </div>
                                            </div>
                                            <div class="recipient-info">
                                                <div class="recipient-text">
                                                    <div class="subtitle-info">Trần Thu Thảo</div>
                                                    <div class="hint-text">thaotomnic@nacencomm.vn</div>
                                                </div>
                                                <div class="recipient-role"><img src="../images/Sign.png" loading="lazy"
                                                        alt="" class="image-11">
                                                    <div class="subtitle-info">Nhận bản sao</div>
                                                </div>
                                            </div>
                                            <div class="recipient-info">
                                                <div class="recipient-text">
                                                    <div class="subtitle-info">Nguyễn Hoàng Hải</div>
                                                    <div class="hint-text">hainh@nacencomm.vn</div>
                                                </div>
                                                <div class="recipient-role"><img src="../images/Sign.png" loading="lazy"
                                                        alt="" class="image-11">
                                                    <div class="subtitle-info">Ký tài liệu</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="request-text">
                                        <div class="info-wrapper">
                                            <div class="title-info">Tên văn bản</div>
                                            <div class="subtitle-info">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.
                                            </div>
                                        </div>
                                        <div class="info-wrapper">
                                            <div class="title-info">Người gửi</div>
                                            <div class="subtitle-info">Nguyễn Trần Văn Khanh</div>
                                            <div class="hint-text">nguyentranvankhanh123@gmail.com</div>
                                        </div>
                                        <div class="info-wrapper">
                                            <div class="title-info">Trạng thái</div>
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="request-activity">
                                <div class="activity-title">
                                    <div class="info-heading">Lịch sử hoạt động</div>
                                    <a href="#" class="sign-map w-inline-block">
                                        <div class="map-text">Xem sơ đồ lệnh ký</div><img src="../images/Sign-Map.png"
                                            loading="lazy" alt="">
                                    </a>
                                </div>
                                <div class="w-layout-grid title-grid">
                                    <div class="username">
                                        <div class="name-text">Người dùng</div>
                                    </div>
                                    <div class="time">
                                        <div class="name-text">Thời gian</div><img src="../images/Sort-Icon.png"
                                            loading="lazy" alt="" class="image-12">
                                    </div>
                                    <div class="activity">
                                        <div class="name-text">Hoạt động</div>
                                    </div>
                                    <div class="state">
                                        <div class="name-text">Trạng thái</div>
                                    </div>
                                </div>
                                <div class="table-background">
                                    <div class="w-layout-grid title-grid">
                                        <div class="username">
                                            <div class="subtitle-info">Nguyễn Trần Văn Khanh</div>
                                            <div class="hint-text">nguyentranvankhanh123@gmail.com</div>
                                        </div>
                                        <div class="time block">
                                            <div class="subtitle-info">17/12/2020</div>
                                            <div class="hint-text">10:25:25 AM</div>
                                        </div>
                                        <div class="activity">
                                            <div class="subtitle-info">Tạo văn bản</div>
                                            <div class="hint-text">Nguyễn Trần Văn Khanh đã tạo văn bản ( Hợp đồng dịch
                                                vụ VMI-NACENCOMM 13.7.20.docx. )</div>
                                        </div>
                                        <div class="state">
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                    <div class="row-divider"></div>
                                    <div class="w-layout-grid title-grid">
                                        <div class="username">
                                            <div class="subtitle-info">Nguyễn Trần Văn Khanh</div>
                                            <div class="hint-text">nguyentranvankhanh123@gmail.com</div>
                                        </div>
                                        <div class="time block">
                                            <div class="subtitle-info">17/12/2020</div>
                                            <div class="hint-text">10:35:13 AM</div>
                                        </div>
                                        <div class="activity">
                                            <div class="subtitle-info">Gửi văn bản</div>
                                            <div class="hint-text">Nguyễn Trần Văn Khanh đã gửi yêu cầu ký</div>
                                        </div>
                                        <div class="state">
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                    <div class="row-divider"></div>
                                    <div class="w-layout-grid title-grid">
                                        <div class="username">
                                            <div class="subtitle-info">Nguyễn Thu Hồng</div>
                                            <div class="hint-text">hongktqd@nacencomm.vn</div>
                                        </div>
                                        <div class="time block">
                                            <div class="subtitle-info">18/12/2020</div>
                                            <div class="hint-text">09:25:15 AM</div>
                                        </div>
                                        <div class="activity">
                                            <div class="subtitle-info">Mở văn bản</div>
                                            <div class="hint-text">Nguyễn Thu Hồng đã xem văn bản ( Hợp đồng dịch vụ
                                                VMI-NACENCOMM 13.7.20.docx. )</div>
                                        </div>
                                        <div class="state">
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                    <div class="row-divider"></div>
                                    <div class="w-layout-grid title-grid">
                                        <div class="username">
                                            <div class="subtitle-info">Nguyễn Thu Hồng</div>
                                            <div class="hint-text">hongktqd@nacencomm.vn</div>
                                        </div>
                                        <div class="time block">
                                            <div class="subtitle-info">18/12/2020</div>
                                            <div class="hint-text">09:27:16 AM</div>
                                        </div>
                                        <div class="activity">
                                            <div class="subtitle-info">Đã ký</div>
                                            <div class="hint-text">Nguyễn Thu Hồng đã ký thành công văn bản ( Hợp đồng
                                                dịch vụ VMI -NACENCOMM 13.7.20.docx. )</div>
                                        </div>
                                        <div class="state">
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                    <div class="row-divider"></div>
                                    <div class="w-layout-grid title-grid">
                                        <div class="username">
                                            <div class="subtitle-info">Trần Thu Thảo</div>
                                            <div class="hint-text">thaotomnic@nacencomm.vn</div>
                                        </div>
                                        <div class="time block">
                                            <div class="subtitle-info">18/12/2020</div>
                                            <div class="hint-text">10:15:23 AM</div>
                                        </div>
                                        <div class="activity">
                                            <div class="subtitle-info">Mở văn bản</div>
                                            <div class="hint-text">Trần Thu Thảo đã xem văn bản ( Hợp đồng dịch vụ
                                                VMI-NACENCOMM 13.7.20.docx. )</div>
                                        </div>
                                        <div class="state">
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                    <div class="row-divider"></div>
                                    <div class="w-layout-grid title-grid">
                                        <div class="username">
                                            <div class="subtitle-info">Nguyễn Hoàng Hải</div>
                                            <div class="hint-text">hainh@nacencomm.vn</div>
                                        </div>
                                        <div class="time block">
                                            <div class="subtitle-info">18/12/2020</div>
                                            <div class="hint-text">03:27:16 PM</div>
                                        </div>
                                        <div class="activity">
                                            <div class="subtitle-info">Mở văn bản</div>
                                            <div class="hint-text">Nguyễn Hoàng Hải đã xem văn bản ( Hợp đồng dịch vụ
                                                VMI-NACENCOMM 13.7.20.docx. )</div>
                                        </div>
                                        <div class="state">
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                    <div class="row-divider"></div>
                                    <div class="w-layout-grid title-grid">
                                        <div class="username">
                                            <div class="subtitle-info">Nguyễn Hoàng Hải</div>
                                            <div class="hint-text">hainh@nacencomm.vn</div>
                                        </div>
                                        <div class="time block">
                                            <div class="subtitle-info">18/12/2020</div>
                                            <div class="hint-text">04:27:16 PM</div>
                                        </div>
                                        <div class="activity">
                                            <div class="subtitle-info">Đã ký</div>
                                            <div class="hint-text">Nguyễn Hoàng Hải đã ký thành công văn bản ( Hợp đồng
                                                dịch vụ VMI-NACENCOMM 13.7.20.docx. )</div>
                                        </div>
                                        <div class="state">
                                            <div class="request-state regular">Đang tiến hành</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>
    <script src="Scripts/js/webflow.js" type="text/javascript"></script>
    <script src="Scripts/js/pages/add-signature-modal.js"></script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>

</html>

