<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="Danhmuc_bophan.aspx.cs" Inherits="Content_Danhmuc_Danhmuc_bophan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="grvdmbf" runat="server" AutoGenerateColumns="False" Height="143px" Width="575px" AllowPaging="True" OnRowCancelingEdit="grvdmbf_RowCancelingEdit" OnRowDeleting="grvdmbf_RowDeleting" OnRowUpdating="grvdmbf_RowUpdating" OnSelectedIndexChanged="grvdmbf_SelectedIndexChanged" OnRowEditing="grvdmbf_RowEditing">
        <Columns>
            <asp:TemplateField HeaderText="Mã bộ phận">
                <ItemTemplate>
                    <asp:Label ID="lblMabf" runat="server" Text='<%# Eval("Ma_Bophan") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="5%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên bộ phận">
                <EditItemTemplate>
                    <asp:TextBox ID="txtUpdate_tenbp" runat="server" Text='<%# Bind("Ten_Bophan") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ten_Bophan") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ">
                <ItemTemplate>
                    <asp:Label ID="lblCaccn" runat="server" Text='<%# Eval("Dia_chi") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
          
            <asp:TemplateField HeaderText="Các chức năng">
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="44px" CommandName="Edit" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="51px" CommandName="Delete" />
                </ItemTemplate>
                <ItemStyle Width="20%" />
            </asp:TemplateField>
          
        </Columns>
    </asp:GridView>
  
   
</asp:Content>

