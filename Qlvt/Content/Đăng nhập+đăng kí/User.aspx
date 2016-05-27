<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="Content_Đăng_nhập_đăng_kí_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--Tittle--%>
     <div class="danhmuckho_tittle">
            <div>User</div>
              <div style="font-size: 12px;"> Sửa, xóa danh mục User</div>
        </div> 
     <div id="danhmuckho_content">   








    <asp:GridView ID="grvUser" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnPageIndexChanging="grvUser_PageIndexChanging" OnRowCancelingEdit="grvUser_RowCancelingEdit" OnRowDataBound="grvUser_RowDataBound" OnRowDeleting="grvUser_RowDeleting" OnRowEditing="grvUser_RowEditing" OnRowUpdating="grvUser_RowUpdating" OnSelectedIndexChanged="grvUser_SelectedIndexChanged" Width="61%">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate>
                    <asp:Label ID="lblId" runat="server" Text='<%# Eval("UserId") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="3%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <asp:TextBox ID="txtPassword" runat="server" ReadOnly="True" Text='<%# Eval("UserPassword") %>' TextMode="Password"></asp:TextBox>
                </ItemTemplate>
                <ItemStyle Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <EditItemTemplate>
                    <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Role">
                <EditItemTemplate>
                    <asp:TextBox ID="txtRole" runat="server" Text='<%# Bind("UserRole") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("UserRole") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Các chức năng">
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" Width="60px" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="60px" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" Width="60px" />
                    <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" Width="60px" />
                </ItemTemplate>
                <ItemStyle Width="18%" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

         </div>
</asp:Content>

