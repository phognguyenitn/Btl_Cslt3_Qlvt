<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dangnhap.aspx.cs" Inherits="Content_Dangnhap_dangki_Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Enter Username
                </td>
                <td>
                    <asp:TextBox id="t1" runat="server"> </asp:TextBox>
                 </td>
            </tr>

             <tr>
                <td>
                    Enter Password
                </td>
                <td>
                    <asp:TextBox id="t2" runat="server"> </asp:TextBox>
                 </td>
            </tr>
           
             <tr>
  
                <td colspan="2" align="center" class="auto-style1">
                <asp:Button ID="Button1" runat="server" Text="Đăng nhập" OnClick="Button1_Click" />
                </td>
            </tr>

        </table>
    
    </div>
        <p>
            <asp:Label ID="Label1" runat="server" Text="lblError"></asp:Label>
        </p>
    </form>
</body>
</html>
