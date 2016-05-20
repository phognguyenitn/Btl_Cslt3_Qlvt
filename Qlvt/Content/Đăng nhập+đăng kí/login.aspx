<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Content_Dangnhap_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: center;
            width: 227px;
        }
        .auto-style3 {
            color: #CC0000;
        }
        .auto-style4 {
            width: 248px;
        }
        .auto-style5 {
            text-align: center;
            font-size: x-large;
            color: #333300;
        }
        .auto-style6 {
            text-align: center;
            height: 23px;
            width: 227px;
        }
        .auto-style7 {
            width: 248px;
            height: 23px;
        }
        .auto-style8 {
            height: 23px;
        }
        .auto-style9 {
            text-align: center;
            width: 176px;
        }
        .auto-style10 {
            text-align: center;
            height: 23px;
            width: 176px;
        }
        .auto-style11 {
            text-align: center;
            width: 176px;
            height: 26px;
        }
        .auto-style12 {
            text-align: center;
            width: 227px;
            height: 26px;
        }
        .auto-style13 {
            width: 248px;
            height: 26px;
        }
        .auto-style14 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FFFFFF">
        <table>
         
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" colspan="4" style="background-color: #C0C0C0">TRANG ĐĂNG KÍ THÔNG TIN</td>
            </tr>
            <tr>
                <td class="auto-style9" style="background-color: #C0C0C0">Họ và tên <span class="auto-style3">(*)</span>:</td>
                <td class="auto-style2" style="background-color: #C0C0C0">
                    <asp:TextBox id="txtName" runat="server" Width="158px"></asp:TextBox>
                </td>
                <td class="auto-style4" style="background-color: #C0C0C0">
                    <asp:RequiredFieldValidator ID="rfvFullname" runat="server" ControlToValidate="txtName" ErrorMessage="Họ và tên không được để trống"></asp:RequiredFieldValidator>
                </td>
                <td style="background-color: #C0C0C0">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10" style="background-color: #C0C0C0">Mật khẩu <span class="auto-style3">(*)</span>:</td>
                <td class="auto-style6" style="background-color: #C0C0C0">
                    <asp:TextBox id="txtPass" runat="server" Width="155px"></asp:TextBox>
                </td>
                <td id="rfvPassword" class="auto-style7" style="background-color: #C0C0C0">
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPass" ErrorMessage="Mật khẩu không được để trống"></asp:RequiredFieldValidator>
                </td>
                <td style="background-color: #C0C0C0" class="auto-style8"></td>
            </tr>
            <tr>
                <td class="auto-style10" style="background-color: #C0C0C0">Nhập lại mật khẩu <span class="auto-style3">(*)</span>:</td>
                <td class="auto-style6" style="background-color: #C0C0C0">
                    <asp:TextBox id="txtPassConfirm" runat="server" Width="154px"></asp:TextBox>
                </td>
                <td class="auto-style7" style="background-color: #C0C0C0">
                    <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ControlToValidate="txtPass" Display="Dynamic" ErrorMessage="Mật khẩu nhập lại không được để trống"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style8" style="background-color: #C0C0C0">
                    <asp:CompareValidator ID="cpvPassword" runat="server" ControlToCompare="txtPass" ControlToValidate="txtPassConfirm" ErrorMessage="Mật khẩu nhập lại không đúng" ForeColor="#FF6600" Display="Dynamic"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style11" style="background-color: #C0C0C0">Email <span class="auto-style3">(*)</span>:</td>
                <td class="auto-style12" style="background-color: #C0C0C0">
                    <asp:TextBox id="txtMail" runat="server" Width="153px"></asp:TextBox>
                </td>
                <td class="auto-style13" style="background-color: #C0C0C0">
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtMail" ErrorMessage="Email không được để trống"></asp:RequiredFieldValidator>
                </td>
                <td style="background-color: #C0C0C0" class="auto-style14"></td>
            </tr>
            <tr>
                <td class="auto-style9" style="background-color: #C0C0C0">
                    <asp:Button ID="btn" runat="server" BackColor="Yellow" OnClick="btn_Click" Text="Đăng kí" Width="112px" />
                    <asp:Label ID="lbSuccess" runat="server" BackColor="#336600"></asp:Label>
                </td>
                <td class="auto-style2" style="background-color: #C0C0C0">
                    &nbsp;</td>
                <td class="auto-style4" style="background-color: #C0C0C0">&nbsp;</td>
                <td style="background-color: #C0C0C0">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
