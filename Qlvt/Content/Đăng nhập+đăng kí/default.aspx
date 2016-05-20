<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Content_Dangnhap_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
         
                <td>  Họ và tên </td>
                <td>
                    <asp:TextBox id="t1" runat="server"> </asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>  Mật khẩu </td>
                <td>
                    <asp:TextBox id="t2" runat="server"> </asp:TextBox>
                </td>
            </tr>
             <tr>
                <td> Nhập lại mật khẩu  </td>
                <td>
                    <asp:TextBox id="t3" runat="server"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>  Email </td>
                <td>
                    <asp:TextBox id="t4" runat="server"> </asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>

                </td>
            </tr>
           
        </table>
    
    </div>
    </form>
</body>
</html>
