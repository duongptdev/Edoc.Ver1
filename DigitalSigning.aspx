﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DigitalSigning.aspx.vb" Inherits="DigitalSigning" %>
<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Mon Feb 22 2021 02:20:19 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="601114c4df80e4456ff44736" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
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
    <script type="text/javascript">WebFont.load({ google: { families: ["Merriweather:300,300italic,400,400italic,700,700italic,900,900italic", "Great Vibes:400"] } });</script>
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
    <script src="Scripts/jquery-3.3.1.min.js"></script>
       <script>
         function SignDoc(){
          //var idfile = localStorage.getItem("idFile");
          //var tkk = localStorage.getItem("Taikhoanky");
          //var ptk = localStorage.getItem("Phuongthucky");
          //var ttk = localStorage.getItem("trinhtuky");
          //cpsign.PerformCallback(idfile + "|" + tkk + "|" + ptk + "|" + ttk);
              loading.Show();
            var phuongthuc = '<%= Session("ptKy") %>';
            if (phuongthuc == 1) {
                var page = sessionStorage.getItem("signpage");
                cpsign.PerformCallback(page);
            }
              else{
                loading.Hide();
                var linkfile=localStorage.getItem('urlFile');
                var code=new Date().YYYYMMDDHHMMSS();
                var tk ='<%= Session("Login") %>';
                var info= sessionStorage.getItem("signInfo");
              
                if(info!=null){
                    $.ajax({
                        type: "POST",
                        url: "http://27.71.231.212:8039/apiEdoc.asmx/TaoYCKy",
                         //url: "http://localhost:8002/apiEdoc.asmx/TaoYCKy",
                        data: JSON.stringify({ Code: code,Taikhoan:tk,Linkfile:linkfile,Info: info }),
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            if (response.d>0)
                            {
                                alert('Gửi yêu cầu ký văn bản thành công. Nếu ký bằng USB token, vui lòng ký văn bản đang chờ bằng tool ký bằng USB Token.');
                                window.location.href = "Index.aspx";
                                //cpchecksigned.PerformCallback(code);

                            }
                        },

                        failure: function (response) {

                        },
                        error: function (response) {
                        }
                    });
                }
                else{
                    alert('Chưa chọn vùng ký trên văn bản')
                }             
            }            
        }
        function EndSignDoc(s,e) {
           
            if (e.result == 1) {
                alert("Ký thành công");
            } else if (e.result == 0) {
                alert("Ký không thành công");
            } else if (e.result == -1) {
                alert("Lỗi hệ thống");
            } else if (e.result == -2) {
                alert("Tài khoản không đủ điều kiện để ký ");
            } else {
                alert(e.result);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <dx:ASPxTextBox ID="txtstartx" ClientInstanceName="txtstartx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtstarty" ClientInstanceName="txtstarty" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtendx" ClientInstanceName="txtendx" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
        <dx:ASPxTextBox ID="txtendy" ClientInstanceName="txtendy" runat="server" Width="170px" ClientVisible="false"></dx:ASPxTextBox>
    <div class="background-modal">
        <div class="modal-form">
            <div class="heading-modal align-right">
                <div class="close-button">
                    <img src="Content/images/Path-30115.png" loading="lazy" alt="Close Modal"></div>
            </div>
            <div class="content-dialog">
                <div class="title-dialog">Ký Số</div>
                <div class="digital-content">
                    <div class="sign-method">
                        <div class="selection-label">Chọn phương thức ký số:</div>
                        <div></div>
                    </div>
                    <div class="digital-cert-icate">
                        <div class="selection-label">Chứng thư số:</div>
                        <div></div>
                    </div>
                    <div class="usb-token">
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
                    <div class="mobile-sign">
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
                    <a href="#" class="button-6 w-button">Xác nhận</a>
                </div>
            </div>
        </div>
    </div>
    <header id="nav" class="sticky-nav">
        <div class="close">
            <div class="file-name">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.</div>
        </div>
        <div class="nav-right">
            <div>
                <div class="request-state">Đang tiến hành</div>
            </div>
            <div class="nav-divider"></div>
            <div class="nav-user">
                <div data-hover="" data-delay="0" class="w-dropdown">
                    <div class="w-dropdown-toggle">
                        <div class="w-icon-dropdown-toggle"></div>
                        <div class="text-block-3">Dropdown</div>
                        <img src="Content/images/Group-15056.png" loading="lazy" alt="user">
                    </div>
                    <nav class="w-dropdown-list">
                        <a href="#" class="w-dropdown-link">Link 1</a>
                        <a href="#" class="w-dropdown-link">Link 2</a>
                        <a href="#" class="w-dropdown-link">Link 3</a>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <div class="request-content">
        <div class="hide-background">
            <div class="checkbox-container">
                <div class="form-block-2 w-form">
                    <label class="w-checkbox accept-checkbox">
                        <input type="checkbox" id="accept-checkbox-id" name="checkbox" data-name="Checkbox" class="w-checkbox-input"><span class="checkbox-label-2 w-form-label">Tôi đồng ý sử dụng phương thức ký điện tử và ký số để thực hiện giao dịch</span></label>
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
                <div class="w-tab-content">
                    <div data-w-tab="Content" class="tab-pane-content w-tab-pane w--tab-active">
                        <div class="pdf-container">
                            <div class="center-viewer">
                               <%-- <iframe id="pdf-files" style="border: 1px solid #000000" title="PDF in an i-Frame" src="Content/images/demopdf.pdf"
                                    frameborder="1" scrolling="auto" height="780" width="1350"></iframe>--%>
                                  <div id="viewer1" style="width: 100%; height: 1000px;"></div>
                            </div>
                        </div>
                        <div class="footer-button w-clearfix">
                            <div class="sign-button-container">
                                <a href="#" class="back-page w-button">Từ chối</a>
                                <input type="button" name="name" onclick="SignDoc()" class="sign-button w-button" value="Ký" />
                               <%-- <a href="#" onclick="SignDoc()" class="sign-button w-button">Ký</a>--%>
                            </div>
                        </div>
                    </div>
                    <div data-w-tab="Activity" class="w-tab-pane">
                        <div class="function-panel">
                            <div class="download-icon">
                                <img src="Content/images/Download.png" loading="lazy" alt=""></div>
                            <div class="print-icon">
                                <img src="Content/images/Print.png" loading="lazy" alt=""></div>
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
                                            <div class="subtitle-info">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.</div>
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
                                                <div class="recipient-role">
                                                    <img src="images/Sign.png" loading="lazy" alt="" class="image-11">
                                                    <div class="subtitle-info">Ký tài liệu</div>
                                                </div>
                                            </div>
                                            <div class="recipient-info">
                                                <div class="recipient-text">
                                                    <div class="subtitle-info">Trần Thu Thảo</div>
                                                    <div class="hint-text">thaotomnic@nacencomm.vn</div>
                                                </div>
                                                <div class="recipient-role">
                                                    <img src="images/Receive-a-copy.png" loading="lazy" alt="" class="image-11">
                                                    <div class="subtitle-info">Nhận bản sao</div>
                                                </div>
                                            </div>
                                            <div class="recipient-info">
                                                <div class="recipient-text">
                                                    <div class="subtitle-info">Nguyễn Hoàng Hải</div>
                                                    <div class="hint-text">hainh@nacencomm.vn</div>
                                                </div>
                                                <div class="recipient-role">
                                                    <img src="images/Sign.png" loading="lazy" alt="" class="image-11">
                                                    <div class="subtitle-info">Ký tài liệu</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="request-text">
                                        <div class="info-wrapper">
                                            <div class="title-info">Tên văn bản</div>
                                            <div class="subtitle-info">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.</div>
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
                                        <div class="map-text">Xem sơ đồ lệnh ký</div>
                                        <img src="Content/images/Sign-Map.png" loading="lazy" alt="">
                                    </a>
                                </div>
                                <div class="w-layout-grid title-grid">
                                    <div class="username">
                                        <div class="name-text">Người dùng</div>
                                    </div>
                                    <div class="time">
                                        <div class="name-text">Thời gian</div>
                                        <img src="Content/images/Sort-Icon.png" loading="lazy" alt="" class="image-12">
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
                                            <div class="hint-text">Nguyễn Trần Văn Khanh đã tạo văn bản ( Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx. )</div>
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
                                            <div class="hint-text">Nguyễn Thu Hồng đã xem văn bản ( Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx. )</div>
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
                                            <div class="hint-text">Nguyễn Thu Hồng đã ký thành công văn bản ( Hợp đồng dịch vụ VMI -NACENCOMM 13.7.20.docx. )</div>
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
                                            <div class="hint-text">Trần Thu Thảo đã xem văn bản ( Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx. )</div>
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
                                            <div class="hint-text">Nguyễn Hoàng Hải đã xem văn bản ( Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx. )</div>
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
                                            <div class="hint-text">Nguyễn Hoàng Hải đã ký thành công văn bản ( Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx. )</div>
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
      <dx:ASPxLoadingPanel ID="loading" runat="server" ClientInstanceName="loading" Text="Đang xử lý" modal="true" />
          <dx:ASPxCallback ID="cpsign" runat="server" OnCallback="cpsign_Callback" ClientInstanceName="cpsign">
      <ClientSideEvents CallbackComplete="EndSignDoc" />
    </dx:ASPxCallback>
<script src="Scripts/jquery-3.3.1.min.js"></script>
    <script src="Scripts/js/webflow.js" type="text/javascript"></script>
    <script src="Scripts/js/pages/accept-checkbox.js"></script>
    <script src="lib/webviewer.min.js"></script>
    <script>
         Object.defineProperty(Date.prototype, 'YYYYMMDDHHMMSS', {
            value: function() {
                function pad2(n) {  // always returns a string
                    return (n < 10 ? '0' : '') + n;
                }

                return this.getFullYear() +
                       pad2(this.getMonth() + 1) + 
                       pad2(this.getDate()) +
                       pad2(this.getHours()) +
                       pad2(this.getMinutes()) +
                       pad2(this.getSeconds());
            }
        });
        $(document).ready(function () {
            var duongdan = localStorage.getItem("urlFile");
              var doc = duongdan;
            sessionStorage.setItem("path", doc);
            sessionStorage.setItem('document', doc);
                if (duongdan != null || duongdan != '') {
                localStorage.setItem('value', duongdan);

                const instance = getInstance();
                if (instance != null) {
                    instance.loadDocument(doc);
                }
                else {

                    WebViewer(
                        {
                            //    path: 'http://localhost:8001/lib/',
                            path: 'http://192.168.2.108:8001/lib/',
                            //pdftronServer: 'http://localhost:8001',
                            initialDoc: doc,
                        },
                        document.getElementById('viewer1')
                    ).then(instance => {
                        //samplesSetup(instance);
                        const { Annotations, docViewer, annotManager } = instance;
                        const getMouseLocation = e => {
                            const { docViewer, annotManager } = instance;
                            const scrollElement = docViewer.getScrollViewElement();
                            const scrollLeft = scrollElement.scrollLeft || 0;
                            const scrollTop = scrollElement.scrollTop || 0;
                            //var pagenumber = docViewer.getCurrentPage();
                            const doc = docViewer.getDocument();
                            ////const pdfCoords = doc.getViewerCoordinates(pagenumber, e.x, e.y); 
                            //const viewerCoords1  = doc.getViewerCoordinates(pagenumber, e.x, e.y);
                            //const pdfCoords = doc.getPDFCoordinates(pagenumber, viewerCoords.x, viewerCoords.y);
                            var windowCoordinates = { x: e.pageX + scrollLeft, y: e.pageY + scrollTop }
                            const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                            const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                            const clickedPage = (page.first !== null) ? page.first : docViewer.getCurrentPage();
                            const pageCoordinates = displayMode.windowToPage(windowCoordinates, clickedPage);
                            const viewerCoords = doc.getViewerCoordinates(clickedPage, pageCoordinates.x, pageCoordinates.y);
                            sessionStorage.setItem('x', viewerCoords.x);
                            sessionStorage.setItem('y', viewerCoords.y);
                            return {
                                x: viewerCoords.x, // e.pageX + scrollLeft,
                                y: viewerCoords.y //e.pageY + scrollTop
                            };
                        };

                        instance.setHeaderItems(header => {
                            header.push({
                                type: 'actionButton',
                                img: '/img/logoNCM1.png',
                                onClick: async () => {
                                    const doc = docViewer.getDocument();
                                    const xfdfString = await annotManager.exportAnnotations();
                                    const data = await doc.getFileData({
                                        // saves the document with annotations in it
                                        xfdfString
                                    });
                                    const arr = new Uint8Array(data);
                                    const blob = new Blob([arr], { type: 'application/pdf' });

                                    var a = "test";
                                    // sessionStorage.setItem('val',blob);

                                    var reader = new FileReader();
                                    reader.readAsDataURL(blob);
                                    reader.onloadend = function () {
                                        var base64data = reader.result;
                                        sessionStorage.setItem('val', base64data);
                                        cpsave.PerformCallback(base64data);
                                    }
                                    //   cpsave.PerformCallback(blob);
                                    //window.saveAs(blob, a + '.pdf');
                                }
                            })

                            docViewer.on('mouseLeftDown', e => {
                                // refer to getMouseLocation implementation above
                                const windowCoordinates = getMouseLocation(e);
                                //  console.log(windowCoordinates);
                                txtstartx.SetText(windowCoordinates.x);
                                txtstarty.SetText(windowCoordinates.y);
                            });

                            docViewer.on('mouseLeftUp', e => {
                                // refer to getMouseLocation implementation above
                                const windowCoordinates = getMouseLocation(e);
                                const displayMode = docViewer.getDisplayModeManager().getDisplayMode();
                                const page = displayMode.getSelectedPages(windowCoordinates, windowCoordinates);
                                //  console.log(windowCoordinates);
                                txtendx.SetText(windowCoordinates.x);
                                txtendy.SetText(windowCoordinates.y);
                                const clickedPage = docViewer.getCurrentPage();
                                const rectangleAnnot = new Annotations.RectangleAnnotation();
                                rectangleAnnot.PageNumber = clickedPage;
                                // values are in page coordinates with (0, 0) in the top left

                                var startx, starty, endx, endy;
                                startx = txtstartx.GetText();
                                starty = txtstarty.GetText();
                                endx = txtendx.GetText();
                                endy = txtendy.GetText();

                                var width, height;
                                width = Math.abs(endx - startx);
                                height = Math.abs(starty - endy);

                                const doc = docViewer.getDocument();
                                var point = { x: startx, y: starty }
                                const viewerCoords1 = doc.getViewerCoordinates(clickedPage, startx, starty);

                                rectangleAnnot.X = viewerCoords1.x;
                                rectangleAnnot.Y = viewerCoords1.y;
                                rectangleAnnot.Width = width;
                                rectangleAnnot.Height = height;
                                annotManager.redrawAnnotation(rectangleAnnot);
                                var signinfo = txtstartx.GetText() + " " + txtstarty.GetText() + " " + width + " " + height + " " + clickedPage;
                                sessionStorage.setItem("signInfo", signinfo);
                                sessionStorage.setItem("signpage", clickedPage);

                            });
                        });
                    });
                }
            } else {
                alert('Không tìm thấy file');
            }


        });
              
     
    </script>
    </form>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>

