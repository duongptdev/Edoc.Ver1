<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Electronic-Signature.aspx.vb" MasterPageFile="~/MasterPage.master" Inherits="Electronic_Signature" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="Server">
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" />
    <link href="Content/css/normalize.css" rel="stylesheet" />
    <link href="Content/css/webflow.css" rel="stylesheet" />
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
            <div class="title-body">Chữ ký điện tử</div>
            <div class="subtitle-body">Quản lí chữ ký điện tử dễ dàng. Thiết lập nhanh chóng bằng nhiều cách khác nhau</div>
            <div class="add-signature-button">
                <div class="button-text">Bạn chưa thiết lập chữ ký điện tử. Vui lòng thiết lập để bắt đầu.</div>
                <a href="#" class="setting-button w-button">Thêm chữ ký</a>
            </div>
            <div class="signature-block">
                <div class="signature-text">Chữ ký điện tử:</div>
                <div class="added-signature">
                    <div class="electronic-signature">
                        <div class="signature">Tran Van Khanh</div>
                    </div>
                    <div class="signature-function">
                        <a href="#" class="edit-signature w-inline-block">
                            <img src="Content/images/Edit Icon.png" loading="lazy" alt="">
                            <div class="text-block-15">Chỉnh sửa</div>
                        </a>
                        <a href="#" class="replace-signature w-inline-block">
                            <img src="Content/images/Trash Icon.png" loading="lazy" alt="">
                            <div class="text-block-16">Xóa chữ ký</div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
