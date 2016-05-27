<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="Nhapxuatton.aspx.cs" Inherits="Content_Baocao_Nhapxuatton" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../Style/Main_css.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <%-- <div><asp:TextBox ID="fromDate" runat="server"></asp:TextBox></div>
    <div><asp:TextBox ID="toDate" runat="server"></asp:TextBox></div>--%>
    <%--Tittle--%>
     <div class="danhmuckho_tittle">
            <div>Nhập xuất tồn</div>
              <div style="font-size: 12px;">
                  
              </div>
        </div>   
    <div id="danhmuckho_content" style="text-align: right"  >
        <asp:GridView ID="dgvNXT" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="495px">
            <Columns>
                <asp:TemplateField HeaderText="Mã kho">
                    <ItemTemplate>
                        <asp:Label ID="lblMakho" runat="server" Text='<%# Eval("Ma_Kho") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên hàng">
                    <ItemTemplate>
                        <asp:Label ID="lblTenhang" runat="server" Text='<%# Eval("Ma_Hang") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tồn đầu">
                    <ItemTemplate>
                        <asp:Label ID="lblTondau" runat="server" Text='<%# Eval("Tondau") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Nhập">
                    <ItemTemplate>
                        <asp:Label ID="lblNhap" runat="server" Text='<%# Eval("Nhap") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xuất">
                    <ItemTemplate>
                        <asp:Label ID="lblXuat" runat="server" Text='<%# Eval("Xuat") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tồn cuối">
                    <ItemTemplate>
                        <asp:Label ID="lblTon" runat="server" Text='<%# Eval("TonCuoi") %>'></asp:Label>
                    </ItemTemplate>
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

