﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="UploadFile.aspx.vb" Inherits="UploadFile" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Jan 19 2021 02:07:46 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="5ffd64db7387a547a446a2b1" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8">
    <title>Upload file</title>
    <meta content="Upload file" property="og:title">
    <meta content="Upload file" property="twitter:title">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Webflow" name="generator">
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">

    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script type="text/javascript">!function (o, c) { var n = c.documentElement, t = " w-mod-"; n.className += t + "js", ("ontouchstart" in o || o.DocumentTouch && c instanceof DocumentTouch) && (n.className += t + "touch") }(window, document);</script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
    <link href="Content/images/webclip.png" rel="apple-touch-icon">
    <script>
        function SaveBL() {
            cpluubl.PerformCallback();
        }
        function EnđSave(s, e) {
            alert(e.result);
            window.location.href = "Index.aspx";
        }
        function SaveSign() {
            cpkybl.PerformCallback();
        }
        function EndSign(s, e) {
            var res = e.result;

            if (res == 1) {
                alert('Đã gửi yêu cầu ký');
            }
            else {
                alert('error:' + res);
            }
        }
    </script>
</head>

<body class="body-2">
    <form id="form1" runat="server">
        <header id="nav" class="sticky-nav">
            <div class="close">
                <a href="index.html" class="back-to-home w-inline-block">
                    <img src="Content/images/Icons-Close-16px.svg"
                        loading="lazy" alt=""></a>
            </div>
            <div class="step-tab">
                <div class="done---step">
                    <div class="dot-step">
                        <img src="Content/images/Group-14876.svg" loading="lazy" alt="">
                    </div>
                    <div class="body-text-13 blue medium">Tải lên</div>
                </div>
                <div class="spacing---step">
                    <img src="Content/images/Group-14878.svg" loading="lazy" alt="">
                </div>
                <div class="non-step">
                    <div class="dot-step">
                        <img src="Content/images/Group-14877.svg" loading="lazy" alt="">
                    </div>
                    <div class="body-text-13 grey">Thêm người nhận</div>
                </div>
                <div class="spacing---step">
                    <img src="Content/images/Group-14878.svg" loading="lazy" alt="">
                </div>
                <div class="non-step">
                    <div class="dot-step">
                        <img src="Content/images/Group-14877.svg" loading="lazy" alt="">
                    </div>
                    <div class="body-text-13 grey">Gán trường ký</div>
                </div>
                <div class="spacing---step">
                    <img src="Content/images/Group-14878.svg" loading="lazy" alt="">
                </div>
                <div class="non-step">
                    <div class="dot-step">
                        <img src="Content/images/Group-14877.svg" loading="lazy" alt="">
                    </div>
                    <div class="body-text-13 grey">Xác nhận và hoàn tất</div>
                </div>
            </div>
            <div class="nav-right">
                <div class="nav-divider"></div>
                <div class="nav-user">
                    <div data-hover="" data-delay="0" class="w-dropdown">
                        <div class="w-dropdown-toggle">
                            <div class="w-icon-dropdown-toggle"></div>
                            <div class="text-block-3">Dropdown</div>
                            <img src="Content/images/Group-15056.png" loading="lazy"
                                alt="user">
                        </div>
                        <nav class="w-dropdown-list">
                            <asp:Button ID="btnDangxuat" runat="server" CssClass="w-dropdown-link border" Text="Đăng xuất" OnClick="btnDangxuat_Click" />
                            <a href="#" class="w-dropdown-link">Link 2</a>
                            <a href="#" class="w-dropdown-link">Link 3</a>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
      
      
   
            <dx:ASPxGridView ID="gridBangluong" runat="server"></dx:ASPxGridView>
         
                
        <div class="main-div" id="maindiv">
            <div class="div-block-17">


                <asp:Panel ID="pnUpLoad" Width="100%" runat="server">
                    <div class="div-block-6">
                        <div class="heading-step">Tải lên Tài liệu mới</div>
                        <div class="show-list">
                            <a href="#" class="list-mode w-inline-block">
                                <img src="Content/images/Group-15086_2.png" loading="lazy"
                                    alt=""></a>
                            <a href="#" class="card-mode w-inline-block">
                                <img src="Content/images/Group-15087_2.png" loading="lazy"
                                    alt=""></a>
                        </div>
                    </div>

                    <div id="drop-area" class="div-block-5">
                        <div class="div-block-12">
                            <div class="div-block-7">
                                <div class="text-16 can-giua">
                                    Kéo và thả tài liệu trực tiếp từ thiết bị của bạn. Hoặc bạn có
                                thể tải lên tài liêu có định dạng .pdf/ .doc/ .docx/ .jpg/ .png
                                </div>
                            </div>
                            <a id="upload-file-btn" href="#" class="button-3 w-button">Tải lên</a>
                            <%--     <asp:FileUpload ID="FileUpload1" runat="server" CssClass="w-hidden" />--%>
                            <asp:FileUpload ID="FileUpload2" runat="server" CssClass="w-hidden" />
                            <%-- <dx:ASPxUploadControl ID="aspxUpload" runat="server" BrowseButton-Text="Chọn file" UploadMode="Auto"
                                Width="100%" Theme="Material" OnFileUploadComplete="aspxUpload_FileUploadComplete"
                                ShowUploadButton="True" ShowProgressPanel="True"
                                AdvancedModeSettings-EnableFileList="True" AdvancedModeSettings-FileListPosition="Bottom" >
                              <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".doc,.docx,.pdf,.xls,.xlsx" />
                                <ClientSideEvents  FileUploadComplete="UploadCompleted" />
                        </dx:ASPxUploadControl>--%>
                            <%--   <input type="text" id="newname" />--%>
                            <input id="upload-file-input" name="upload-file" accept=".pdf,.doc,.docx,.jpg,.png" type="file" class="w-hidden" />
                            <%--   <div id="output"></div>--%>
                        </div>
                        <div class="div-block-15"></div>
                        <div class="div-block-14">
                            <div class="div-block-7">
                                <div class="body-text-13 grey">Hoặc:</div>
                            </div>
                            <div class="div-block-9">
                                <div class="div-block-10">
                                    <img src="Content/images/Group-15049.svg" loading="lazy" alt="">
                                </div>
                                <div class="div-block-11">
                                    <img src="Content/images/Group-15048.svg" loading="lazy" alt="">
                                </div>
                                <div>
                                    <img src="Content/images/Group-15047.svg" loading="lazy" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="card-pdf" class="card-pdf">
                        <div class="card-ui">
                            <div class="pdf-content">
                                <div class="icon-card">
                                    <img src="Content/images/File-Card-Icon.png" loading="lazy" alt="">
                                </div>
                                <div class="pdf-card-content">
                                    <div id="file-name" class="text-block-5"></div>
                                    <div id="file-size" class="text-block-6"></div>
                                </div>
                            </div>
                            <div class="function-card">
                                <div data-hover="" data-delay="0" class="w-dropdown">
                                    <div class="dropdown-toggle-6 w-dropdown-toggle">
                                        <img src="Content/images/Group-15086_1.png"
                                            loading="lazy" alt="function">
                                    </div>
                                    <nav class="w-dropdown-list">
                                        <a href="#" id="renamefile" class="w-dropdown-link">Đổi tên tài liệu</a>
                                        <a href="#" class="w-dropdown-link">Xóa tài liệu</a>
                                        <a href="#" onclick="window.location.href='UploadFile.aspx'" class="w-dropdown-link">Tải lại tài liệu</a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </asp:Panel>
         
                 
                  
          
                <div class="upload-file-button">
                    <a href="upload-file.html" aria-current="page" class="back-button hiding w-button w--current">Quay
                        lại</a>
                    <asp:Button ID="btnUpload" runat="server" Text="Tiếp tục" CssClass="button-4 w-button" OnClick="btnUpload_Click" />
                    <%-- <asp:Button ID="btnSaveBL" runat="server" Text="Tiếp tục" CssClass="button-4 w-button" OnClick="btnUpload_Click" />
                       <asp:Button ID="btnKy" runat="server" Text="Tiếp tục" CssClass="button-4 w-button" OnClick="btnUpload_Click" />--%>
                    <input id="btnSaveBL" type="button" value="Ký tất cả" onclick="SaveSign()" class="button-4 w-button" style="margin-left: 5px" />
                    <input id="btnKy" type="button" value="Lưu bảng lương" onclick="SaveBL()" class="button-4 w-button" style="margin-left: 5px" />
                    <%--  <dx:ASPxButton ID="btnSaveBL" runat="server" Text="Lưu bảng lương" CssClass="button-4 w-button">
                        <ClientSideEvents Click="SaveBL" />
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="btnKy" runat="server" Text="Ký bảng lương" CssClass="button-4 w-button">
                        <ClientSideEvents Click="SaveSign" />
                    </dx:ASPxButton>--%>

                    <%--  <dx:ASPxButton ID="btnSavevl" runat="server" Text="Tiếp tục" CssClass="button-4 w-button" clien></dx:ASPxButton>--%>

                    <%-- <button type="submit" class="button-4 w-button">Tiếp tục</button>--%>
                </div>

            </div>
        </div>



        <dx:ASPxCallback ID="cpluubl" OnCallback="cpluubl_Callback" ClientInstanceName="cpluubl" runat="server">
            <ClientSideEvents CallbackComplete="EnđSave" />
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cpkybl" OnCallback="cpkybl_Callback" ClientInstanceName="cpkybl" runat="server">
            <ClientSideEvents CallbackComplete="EndSign" />
        </dx:ASPxCallback>
        <div class="footer">
            <div class="footer-container">
                <div class="footer-text">
                    Powered by <a href="#" class="link-5">Ca2</a>
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
                <div class="copyright-footer">
                    <img src="Content/images/Icon-metro-copyright.png" loading="lazy" alt=""
                        class="image-7">
                    <div class="footer-text">Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
                </div>
            </div>
        </div>

        <script src="Scripts/jquery-3.3.1.min.js"></script>
        <script src="Scripts/js/webflow.js" type="text/javascript"></script>
        <script src="Scripts/js/main.js"></script>

        <%--    <script type="text/javascript">
            (function uploadFileClickHandle() {
                var uploadFileBtn = document.querySelector("#upload-file-btn");
                var uploadFileInput = document.querySelector("#FileUpload2");
                var fileName = document.querySelector("#file-name");
                var cardPDF = document.querySelector("#card-pdf");
                var dropArea = document.querySelector("#drop-area");
                var fileSize = document.querySelector("#file-size");
                function formatBytes(bytes, decimals = 2) {
                    if (bytes === 0) return '0 Bytes';
                    const k = 1024;
                    const dm = decimals < 0 ? 0 : decimals;
                    const sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

                    const i = Math.floor(Math.log(bytes) / Math.log(k));

                    return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
                }

                function setText(v) {
                    fileSize.innerHTML = formatBytes(v);
                }

                uploadFileBtn.addEventListener("click", function () {
                    uploadFileInput.click();
                });

                uploadFileInput.addEventListener("change", function () {
                    dropArea.style.display = "none";
                    cardPDF.style.display = "block";
                    fileName.textContent = this.files[0].name;
                    setText(this.files[0].size);
                });
            })();
            (function dragAndDropUploadHandle() {
                var dropArea = document.getElementById("drop-area");

                // dropArea.addEventListener("dragenter", handlerFunction);
                // dropArea.addEventListener("dragleave", handlerFunction);
                dropArea.addEventListener("dragover", handlerFunction);
                dropArea.addEventListener("drop", handlerFunction);

                function handlerFunction(e) {
                    e.preventDefault(); // khong chay event mac dinh khi keo tha (mo file)
                    e.stopPropagation(); // len google doc
                    console.log(e, this);

                    if (!e.dataTransfer || e.dataTransfer.files.length < 1) return;

                    // var files = e.dataTransfer.files;

                    // files.forEach(function(file) {

                    // })
                }
            })();
            //      $("#btnDangxuat").click(function () {
            //    localStorage.clear();
            //    sessionStorage.clear();
            //});
        </script>--%>
        <%--      <script>
            function EndUpload(s, e) {
                if (e.result != null) {
                    localStorage.setItem("urlfile", e.result);
                }
            };
        </script>--%>


        <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
    </form>
    <%--  <dx:ASPxCallback ID="cpupload" runat="server" OnCallback="cpupload_Callback" >
      <ClientSideEvents CallbackComplete="EndUpload" />
    </dx:ASPxCallback>--%>
</body>

</html>
