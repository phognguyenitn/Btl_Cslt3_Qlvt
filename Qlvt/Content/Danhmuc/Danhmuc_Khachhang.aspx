<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="Danhmuc_Khachhang.aspx.cs" Inherits="Content_Danhmuc_Danhmuc_Khachhang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <%--Tittle--%>
     <div class="danhmuckho_tittle">
            <div>Danh mục khách hàng</div>
              <div style="font-size: 12px;">Cập nhập, sửa, xóa danh mục khách hàng</div>
        </div>   


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    
     <script>
         $(document).ready(function () {
             $("#open_kho").click(function () {
                 $("#block_insertkhachhang").show("Slow");
             });
             $("#close_kho").click(function () {
                 $("#block_insertkhachhang").hide("Slow");
             });
         });
     </script>
    <script>
        $(document).ready(function () {
            $("#cancel_btn").click(function () {
                $('#txtMa_Kh_Insert').val('');
            });
            $("#cancel_btn").click(function () {
                $('#txtTen_Kh_Insert').val('');
            });

            $("#cancel_btn").click(function () {
                $('#txtDia_chi_Insert').val('');

            });
            $("#cancel_btn").click(function () {
                $('#txtMa_So_Thue_Insert').val('');
            });
            $("#cancel_btn").click(function () {
                $('#txtTiem_Nang_Insert').val('');
            });
        });
    </script>  
  <%--Content--%>      
   
    <div id="danhmuckho_content"> 
          <div id="open_kho" style="cursor: pointer"  >                      
             <img src="../../Image/create_icon.gif" />
                 </div>   
        <div id="block_insertkhachhang">           
            <div  id="close_kho" class="title_themkho" style="cursor: pointer;width:594px">
                <div style="float: left;margin-left: 5px;">
                    <img src="../../Image/data_icon_tittle.gif" />  </div>             
                <div style="float: left;margin-left: 5px;" >Thêm khách hàng</div>
                <div style="float: right;margin-left: 5px;cursor: pointer">
                    <img src="../../Image/Close_icon.png" />
                </div>
            </div>
            <div class="content_themkhachhang">
             
                <div class="content_themkhachhang_item1" style="margin-top: 5px">Mã khách hàng</div>
                <div class="content_themkhachhang_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtMa_kh_Insert"></asp:TextBox></div>
              <div class="content_themkhachhang_item1" style="margin-top: 5px">Tên khách hàng</div>
                 <div class="content_themkhachhang_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtTen_Kh_Insert"></asp:TextBox></div>
                 <div class="content_themkhachhang_item2" style="clear :both;margin-left:8px;margin-right: 12px;float: left;">Địa chỉ</div>
                 <div class="content_themkhachhang_item2" style="margin-left:47px; width: 455px"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtDia_chi_Insert" Width="455px"></asp:TextBox></div>
              <div class="content_themkhachhang_item3" style="margin-top: 13px;clear:both">Mã số thuế</div>
                <div class="content_themkhachhang_item3" style="margin-top: 6px;margin-left: 36px;"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtMa_So_Thue"></asp:TextBox></div>
                <div class="content_themkhachhang_item3" style="margin-top: 13px">Tiềm năng</div>
                <div class="content_themkhachhang_item3" style="margin-top: 6px;margin-left: 40px;"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtTiem_Nang"></asp:TextBox></div>

             
            </div>
            <div class="button_themkho" style="padding-bottom: 3px;width:594px" >
                <div class="button_themkho_item" style="margin-left: 225px;cursor: pointer"><asp:Button runat="server" Text="Save" ID="Button1"  Width="60px" OnClick="BtnSave_Click"/></div>              
               <div class="button_themkho_item"  style="margin-left: 15px;cursor: pointer" id="cancel_btn">Clear</div>
            </div>
        </div>







        


              <asp:GridView ID="grvDmkh" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="grvDmkh_PageIndexChanging" OnRowCancelingEdit="grvDmkh_RowCancelingEdit" OnRowDataBound="grvDmkh_RowDataBound" OnRowDeleting="grvDmkh_RowDeleting" OnRowUpdating="grvDmkh_RowUpdating" OnSelectedIndexChanged="grvDmkh_SelectedIndexChanged" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="120px" Width="575px" OnRowEditing="grvDmkh_RowEditing">
   
                  <Columns>
                      <asp:TemplateField HeaderText="Mã khách hàng">
                          <ItemTemplate>
                              <asp:Label ID="lblMaKh" runat="server" Text='<%# Eval("Ma_kh") %>'></asp:Label>
                          </ItemTemplate>
                          <ItemStyle Width="10%" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Tên khách hàng">
                          <EditItemTemplate>
                              <asp:TextBox ID="txtTenkh" runat="server" Text='<%# Bind("Ten_kh") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ten_kh") %>'></asp:Label>
                          </ItemTemplate>
                          <ItemStyle Width="15%" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Địa chỉ">
                          <EditItemTemplate>
                              <asp:TextBox ID="txtDiachi" runat="server" Text='<%# Bind("Dia_chi") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label2" runat="server" Text='<%# Eval("Dia_chi") %>'></asp:Label>
                          </ItemTemplate>
                          <ItemStyle Width="25%" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Mã số thuế">
                          <EditItemTemplate>
                              <asp:TextBox ID="txtMaSoThue" runat="server" Text='<%# Bind("Ma_So_Thue") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label3" runat="server" Text='<%# Eval("Ma_So_Thue") %>'></asp:Label>
                          </ItemTemplate>
                          <ItemStyle Width="10%" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Tiềm năng">
                          <EditItemTemplate>
                              <asp:TextBox ID="txtTiemNang" runat="server" Text='<%# Bind("Tiem_Nang") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label4" runat="server" Text='<%# Eval("Tiem_Nang") %>'></asp:Label>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="Các chức năng">
                          <EditItemTemplate>
                              <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" Width="60px" />
                              <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="60px" />
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Button ID="btnEdit" runat="server" Text="Edit" Width="60px" />
                              <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Delete" Width="60px" />
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

