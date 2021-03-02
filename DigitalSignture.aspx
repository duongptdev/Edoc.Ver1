<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="DigitalSignture.aspx.vb" Inherits="DigitalSignture" %>
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
      <a href="DigitalSignature.aspx" class="menu-item-link w-inline-block">
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
      <div class="title-body">Chữ ký số</div>
      <div class="subtitle-body">Kết nối tài khoản Mobile Sign với thiết bị, đảm bảo quy trình ký tài liệu diễn ra<br>nhanh chóng và tiện lợi</div>
      <div class="add-signature-button">
        <div class="button-text">Vui lòng quét mã QR Code để kết nối với tài khoản Mobile Sign</div><img src="Content/images/QR Code.png" loading="lazy" alt="" class="image-14">
      </div>
      <div class="digital-certificate">
        <div class="cert-text">Thông tin chứng thư số</div>
        <div class="cert-info">
          <div class="info-field">
            <div class="cert-label">Tên chứng thư:</div>
            <div class="cert-input">Trần Văn Khanh</div>
          </div>
          <div class="info-field">
            <div class="cert-label">Số Serial:</div>
            <div class="cert-input">5402BC5ACE669C20150000000379</div>
          </div>
          <div class="info-field">
            <div class="cert-label">Thiết bị:</div>
            <div class="cert-input">PC-DE5Z 009</div>
          </div>
          <div class="info-field">
            <div class="cert-label">Device ID:</div>
            <div class="cert-input">HFNS-JSHEFHU-ZJSD-BHD</div>
          </div>
          <div class="info-field">
            <div class="cert-label">Ngày cấp:</div>
            <div class="cert-input">15:23 15/05/2019</div>
          </div>
          <div class="info-field">
            <div class="cert-label">Ngày hết hạn:</div>
            <div class="cert-input">15/05/2021</div>
          </div>
          <div class="info-field">
            <div class="cert-label">Đơn vị cấp:</div>
            <div class="cert-input">Công ty Cổ phần Công nghệ thẻ NACENCOMM</div>
          </div>
        </div>
        <a href="#" class="disable-cert w-inline-block"><img src="../images/Disable-Icon.png" loading="lazy" alt="">
          <div class="text-block-17">Ngắt kết nối</div>
        </a>
      </div>
    </div>
  </div>
    </asp:Content>