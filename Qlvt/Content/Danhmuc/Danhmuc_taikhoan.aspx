<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="Danhmuc_taikhoan.aspx.cs" Inherits="Content_Danhmuc_Danhmuc_taikhoan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--Tittle--%>
     <div class="danhmuckho_tittle">
            <div>Danh mục tài khoản</div>
              <div style="font-size: 12px;">Cập nhập, sửa, xóa danh mục tài khoản</div>
        </div>   

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    
     <script>
         $(document).ready(function () {
             $("#open_kho").click(function () {
                 $("#block_insertkho").show("Slow");
             });
             $("#close_kho").click(function () {
                 $("#block_insertkho").hide("Slow");
             });
         });
     </script>
    <script>
        $(document).ready(function () {
            $("#cancel_btn").click(function () {
                $('#txtMa_Tk_Insert').val('');
            });
            $("#cancel_btn").click(function () {
                $('#txtTen_Tk_Insert').val('');
            });

            $("#cancel_btn").click(function () {
                $('#txtTk_Me_Insert').val('');

            });
        });
    </script>  
  <%--Content--%>      
   
    <div id="danhmuckho_content"> 
          <div id="open_kho" style="cursor: pointer"  >                      
             <img src="../../Image/create_icon.gif" />

                 </div>   
        <div id="block_insertkho">           
            <div  id="close_kho" class="title_themkho" style="cursor: pointer">
                <div style="float: left;margin-left: 5px;">
                    <img src="../../Image/data_icon_tittle.gif" />  </div>             
                <div style="float: left;margin-left: 5px;" >Thêm tài khoản</div>
                <div style="float: right;margin-left: 5px;cursor: pointer">
                    <img src="../../Image/Close_icon.png" />
                </div>
            </div>
            <div class="content_thembophan">
             
                <div class="content_thembophan_item1" style="margin-top: 5px">Mã tài khoản</div>
                <div class="content_thembophan_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtMa_Tk_Insert"></asp:TextBox></div>
              <div class="content_thembophan_item1" style="margin-top: 5px">Tên tài khoản</div>
                 <div class="content_thembophan_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtTen_Tk_Insert"></asp:TextBox></div>
                 <div class="content_thembophan_item2" style="clear :both;margin-left:6px;">Tài khoản mẹ</div>
                 <div class="content_thembophan_item2" style="margin-left:40px; width: 363px;"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtTk_Me_Insert" Width="346px"></asp:TextBox></div>
              
             
            </div>
            <div class="button_themkho" style="padding-bottom: 3px;" >
                <div class="button_themkho_item" style="margin-left: 155px;cursor: pointer"><asp:Button runat="server" Text="Save" ID="Button1"  Width="60px" OnClick="BtnSave_Click"/></div>              
               <div class="button_themkho_item"  style="margin-left: 15px;cursor: pointer" id="cancel_btn">Clear</div>
            </div>
        </div>







    <asp:GridView ID="grvDmtk" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="grvDmtk_PageIndexChanging" OnRowCancelingEdit="grvDmtk_RowCancelingEdit" OnRowDataBound="grvDmtk_RowDataBound" OnRowDeleting="grvDmtk_RowDeleting" OnRowUpdating="grvDmtk_RowUpdating" OnSelectedIndexChanged="grvDmtk_SelectedIndexChanged" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="143px" Width="575px" OnRowEditing="grvDmtk_RowEditing1">
        <Columns>
            <asp:TemplateField HeaderText="Mã tài khoản">
                <ItemTemplate>
                    <asp:Label ID="lblMatk" runat="server" Text='<%# Eval("Ma_Tk") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="15%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên tài khoản">
                <EditItemTemplate>
                    <asp:TextBox ID="txtUpdate_tentk" runat="server" Text='<%# Bind("Ten_Tk") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ten_Tk") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="40%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tài khoản Mẹ">
                <EditItemTemplate>
                    <asp:TextBox ID="txtTkMe" runat="server" Text='<%# Bind("Tk_Me") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblTkMe" runat="server" Text='<%# Eval("Tk_Me") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Các chức năng">
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" Width="60px" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" Width="60px" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="60px" CommandName="Edit" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" Width="60px" CommandName="Delete" />
                </ItemTemplate>
                <ItemStyle Width="25%" />
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
         





    <asp:Label ID="lblError" runat="server"></asp:Label>
        </div>
</asp:Content>

