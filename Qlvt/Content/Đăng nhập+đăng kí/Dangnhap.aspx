<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dangnhap.aspx.cs" Inherits="Content_Dangnhap_dangki_Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang đăng nhập</title>
    <style type="text/css">
        #form1 {
            height: 298px;
        }
        .auto-style1 {
            width: 100%;
            height: 167px;
        }
        .auto-style3 {
            height: 35px;
        }
        .auto-style4 {
            height: 35px;
            font-weight: bold;
            font-size: large;
            width: 178px;
            background-color: #CCFFFF;
        }
        .auto-style6 {
            height: 35px;
            width: 205px;
        }
        .auto-style8 {
            height: 35px;
            width: 213px;
            background-color: #CCFFFF;
        }
        .auto-style10 {
            height: 50px;
            width: 18%;
        }
        .auto-style11 {
            font-size: large;
        }
        .auto-style12 {
            height: 50px;
            width: 28%;
        }
        .auto-style13 {
            height: 50px;
            width: 213px;
        }
        .auto-style14 {
            height: 60px;
            width: 28%;
        }
        .auto-style15 {
            height: 60px;
            text-align: center;
            font-size: x-large;
            background-color: #CCFFFF;
        }
        .auto-style16 {
            color: #FF0000;
        }
        .auto-style17 {
            height: 60px;
            width: 28%;
            color: #FFFFFF;
        }
        .auto-style18 {
            height: 60px;
            text-align: center;
            font-size: x-large;
            color: #FFFFFF;
            background-color: #FFFFFF;
        }
        .auto-style19 {
            height: 60px;
            color: #FFFFFF;
            background-color: #FFFFFF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style19" colspan="4" style="height: 50px">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14" style="height: 80px"></td>
                <td class="auto-style15" colspan="2" style="height: 80px"><strong>ĐĂNG NHẬP HỆ THỐNG</strong></td>
                <td class="auto-style14" style="height: 80px"></td>
            </tr>
            <tr>
                <td class="auto-style6" style="height: 40px"></td>
                <td class="auto-style4">Tên đăng nhập: <span class="auto-style16">(*)</span></td>
                <td class="auto-style8" style="height: 40px">
                    <asp:TextBox id="t1" runat="server" BorderWidth="1px" CssClass="auto-style11" Height="30px" Width="200px"> </asp:TextBox>
                 </td>
                <td class="auto-style3" style="height: 40px"></td>
            </tr>
            <tr>
                <td class="auto-style6" style="height: 40px"></td>
                <td class="auto-style4">Mật khẩu: <span class="auto-style16">(*)</span></td>
                <td class="auto-style8" style="height: 40px">
                    <asp:TextBox id="t2" runat="server" BorderWidth="1px" CssClass="auto-style11" Height="30px" TextMode="Password" Width="200px"> </asp:TextBox>
                  </td>
                <td class="auto-style3" style="height: 40px"></td>
            </tr>
            <tr>
                <td class="auto-style12"></td>
                <td class="auto-style10"></td>
                <td class="auto-style13">
                <asp:Button ID="Button1" runat="server" Height="35px" OnClick="Button1_Click" style="background-color: #FFFF00" Text="Đăng nhập"  Width="80px"/>
               </td>
                <td class="auto-style12"></td>
            </tr>
        </table>
    
    </form>
</body>
</html>
