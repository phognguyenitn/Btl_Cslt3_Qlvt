<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="HomeAd.aspx.cs" Inherits="Content_Đăng_nhập_đăng_kí_HomeAd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="content">

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
        <div class="auto-style1">
            <strong><span class="auto-style2">ĐÂY LÀ TRANG RẤT QUAN TRỌNG, BẠN CHỈ CÓ THỂ NHÌN THẤY NỘI DUNG NÀY SAU KHI ĐÃ ĐĂNG NHẬP THÀNH CÔNG</span></strong><br />
            <br />

         <strong><span class="auto-style3">Đang Online:
            <asp:Label ID="lblDangOnline" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red">DangOnline</asp:Label>
            </span></strong>
        </br>

            <strong><span class="auto-style3">Số lượt truy cập trang:
            <asp:Label ID="lblTongTruyCap" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Red">LuotTruyCap</asp:Label>
            </span></strong>
        </div>
          

    </div>
</asp:Content>
