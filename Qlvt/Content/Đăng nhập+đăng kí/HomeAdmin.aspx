<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomeAdmin.aspx.cs" Inherits="Content_Đăng_nhập_đăng_kí_HomeAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style type="text/css">
        #form1 {
            height: 280px;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            font-size: large;
            color: #FF0000;
        }
        .auto-style3 {
            font-size: large;
            color: #3333CC;
        }
    </style>


</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
            <strong><span class="auto-style2">ĐÂY LÀ TRANG RẤT QUAN TRỌNG, BẠN CHỈ CÓ THỂ NHÌN THẤY NỘI DUNG NÀY SAU KHI ĐÃ ĐĂNG NHẬP THÀNH CÔNG</span></strong><br />
            <br />
            <strong><span class="auto-style3">Số lượt truy cập trang:
            <asp:Label ID="lbLoginCount" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red"></asp:Label>
            </span></strong>
        </div>
    </form>
</body>
</html>
