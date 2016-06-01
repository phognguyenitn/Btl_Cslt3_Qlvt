<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dangki.aspx.cs" Inherits="Content_Dangnhap_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            height: 396px;
        }
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 65px;
        }
        .auto-style3 {
            height: 65px;
            font-size: x-large;
            text-align: center;
            background-color: #CCCCCC;
        }
        .auto-style4 {
            width: 176px;
            font-weight: bold;
            background-color: #CCCCCC;
        }
        .auto-style6 {
            width: 369px;
            background-color: #CCCCCC;
        }
        .auto-style7 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FFFFFF">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="2"><strong>TRANG ĐĂNG KÝ THÀNH VIÊN</strong></td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td class="auto-style4">Tên đăng nhập <span class="auto-style7">(*)</span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtName" runat="server" Height="22px" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvFullname" runat="server" ControlToValidate="txtName" ErrorMessage="Họ và tên không được để trống"></asp:RequiredFieldValidator>
               </td>
            </tr>
            <tr>
                <td class="auto-style4">Mật khẩu: <span class="auto-style7">(*)</span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPass" runat="server" Height="22px" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPass" ErrorMessage="Mật khẩu không được để trống"></asp:RequiredFieldValidator>
               </td>
            </tr>
            <tr>
                <td class="auto-style4">MK nhập lại: <span class="auto-style7">(*)</span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtPassConfirm" runat="server" Height="22px" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ControlToValidate="txtPass"  Display="Dynamic" ErrorMessage="Mật khẩu nhập lại không được để trống"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cpvPassword" runat="server" ControlToCompare="txtPass" ControlToValidate="txtPassConfirm" ErrorMessage="Mật khẩu nhập lại không đúng" ForeColor="#FF6600" Display="Dynamic"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Email: <span class="auto-style7">(*)</span></td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtMail" runat="server" Height="22px" Width="300px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtMail" ErrorMessage="Email không được để trống"></asp:RequiredFieldValidator>
                </td>
            </tr>
           
        </table>
        <br />
        <asp:Button ID="btn" runat="server" BackColor="Yellow" Height="32px" OnClick="btn_Click" Text="Đăng kí"  />&nbsp;
        <asp:Label ID="lbSuccess" runat="server" style="font-weight: 700; font-style: italic; font-size: large; color: #0000FF"></asp:Label>
    </form>
</body>
</html>
