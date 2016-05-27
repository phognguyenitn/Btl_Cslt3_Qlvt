<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="Danhmuckho.aspx.cs" Inherits="Content_Danhmuc_Danhmuckho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            text-align: center;
        }
    </style>
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    
     <script>
         $(document).ready(function() {
             $("#open_kho").click(function () {
                 $("#block_insertkho").show("Slow");
             });
             $("#close_kho").click(function () {
                 $("#block_insertkho").hide("Slow");
             });
         });     
     </script>
    <script>
        $(document).ready(function() {
            $("#cancel_btn").click(function () {
                $('#txtId_Insert').val('');
                $("#cancel_btn").click(function () {
                $('#txtName_insert').val('');
            });
            });
        });      
    </script>   
</asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<%--Tittle--%>
     <div class="danhmuckho_tittle">
            <div>Danh mục kho</div>
              <div style="font-size: 12px;">Cập nhập, sửa, xóa danh mục kho</div>
        </div>   
<%--Content--%>      
    <div id="danhmuckho_content">             
         <div id="open_kho" style="cursor: pointer"  >                      
             <img src="../../Image/create_icon.gif" />            
         </div>          
        <div id="block_insertkho">           
            <div  id="close_kho" class="title_themkho" style="cursor: pointer">
                <div style="float: left;margin-left: 5px;">
                    <img src="../../Image/data_icon_tittle.gif" />  </div>             
                <div style="float: left;margin-left: 5px;" >Thêm kho</div>
                <div style="float: right;margin-left: 5px;cursor: pointer">
                    <img src="../../Image/Close_icon.png" />
                </div>
            </div>
            <div class="content_themkho">
                <div class="content_themkho_item1" style="margin-top: 5px">Mã kho</div>
                <div class="content_themkho_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtId_Insert"></asp:TextBox></div>
              <div class="content_themkho_item1" style="margin-top: 5px">Tên kho</div>
                 <div class="content_themkho_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtName_insert"></asp:TextBox></div>
              
             
            </div>
            <div class="button_themkho" style="padding-bottom: 3px;" >
                <div class="button_themkho_item" style="margin-left: 155px;cursor: pointer"><asp:Button runat="server" Text="Save" ID="BtnSave" OnClick="BtnSave_Click" Width="60px"/></div>              
               <div class="button_themkho_item"  style="margin-left: 15px;cursor: pointer" id="cancel_btn">Clear</div>
            </div>
        </div>
            

     
        <div id="dgv_danhmuckho" class="auto-style2" >
          
            <asp:GridView ID="dgvDmk" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="7" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnPageIndexChanging="dgvDmk_PageIndexChanging" OnRowCancelingEdit="dgvDmk_RowCancelingEdit" OnRowDataBound="dgvDmk_RowDataBound" OnRowDeleting="dgvDmk_RowDeleting" OnRowEditing="dgvDmk_RowEditing" OnRowUpdating="dgvDmk_RowUpdating">
                <Columns>
                    <asp:TemplateField HeaderText="Mã Kho">
                        <ItemTemplate>
                            <asp:Label ID="lblStoreId" runat="server"  Text='<%# Eval("Ma_Kho") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tên Kho">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTenkho" runat="server" Text='<%# Bind("Ten_Kho") %>' Width="100px"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStoreName" runat="server"  Text='<%# Eval("Ten_Kho") %>' Width="100px"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  <%--  Fix chieu dai cua Field--%>
                    <asp:TemplateField HeaderText="Operate">
                        <HeaderStyle Width="120" />
                        <ItemStyle Width="120" />
                        <EditItemTemplate>
                            <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" Width="50px" />
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="50px" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" Width="50px" />
                            <asp:Button ID="btnDelete" runat="server"  Text="Delete" CommandName="Delete" Width="50px"  />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    Data Empty
                </EmptyDataTemplate>
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
              <div><asp:Label runat="server" ID="lblError"></asp:Label></div>
        </div>
 
    </div>
    <asp:Repeater runat="server"></asp:Repeater>
</asp:Content>

