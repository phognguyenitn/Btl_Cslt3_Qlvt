<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="Ton_Dau_Ki.aspx.cs" Inherits="Content_Chứng_từ_Ton_Dau_Ki" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <%--Tittle--%>
     <div class="danhmuckho_tittle">
            <div>Danh mục tồn đầu kì</div>
              <div style="font-size: 12px;">Cập nhập, sửa, xóa danh mục tồn đầu kì</div>
        </div>   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    
     <script>
         $(document).ready(function () {
             $("#open_kho").click(function () {
                 $("#block_inserttondauki").show("Slow");
             });
             $("#close_kho").click(function () {
                 $("#block_inserttondauki").hide("Slow");
             });
         });
     </script>
    <script>
        $(document).ready(function () {
            $("#cancel_btn").click(function () {
                $('#txtNgay').val('');
            });
          
            $("#cancel_btn").click(function () {
                $('#txtSo_Luong').val('');
            });
            $("#cancel_btn").click(function () {
                $('#txtThanh_Tien').val('');
            });
        });
    </script>  


   


     <div id="danhmuckho_content"> 
         <div id="open_kho" style="cursor: pointer"  >                      
             <img src="../../Image/create_icon.gif" />
                 </div>   
        <div id="block_inserttondauki">           
            <div  id="close_kho" class="title_themkho" style="cursor: pointer;width:700px">
                <div style="float: left;margin-left: 5px;">
                    <img src="../../Image/data_icon_tittle.gif" />  </div>             
                <div style="float: left;margin-left: 5px;" >Thêm </div>
                <div style="float: right;margin-left: 5px;cursor: pointer">
                    <img src="../../Image/Close_icon.png" />
                </div>
            </div>
            <div class="content_themtondauki">
             
                <div class="content_themtondauki_item1" >Ngày</div>
                <div class="content_themtondauki_item1" ><asp:TextBox runat="server" ID="txtNgay"></asp:TextBox></div>
                <div class="content_themtondauki_item1"> 
                    


                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Image/Drop_icon.gif" OnClick="ImageButton1_Click" style="width: 15px" />
                    


                </div>
              <div class="content_themtondauki_item1"  >Mã hàng</div>
                 <div class="content_themtondauki_item1"style="width:150px">
                     <asp:DropDownList ID="ddlMaHang" style="width:150px" runat="server" OnSelectedIndexChanged="ddl2_SelectedIndexChanged">
                     </asp:DropDownList>
                </div>
                 <div class="content_themtondauki_item1" >Mã kho</div>
                 <div class="content_themtondauki_item1"style="width:150px">
                     <asp:DropDownList ID="ddlMaKho" style="width:150px" runat="server" OnSelectedIndexChanged="ddl3_SelectedIndexChanged">
                     </asp:DropDownList>
                </div>
                <div style="position:absolute;top: 80px;z-index: 1;">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>

                 </div>
               


              <div class="content_themtondauki_item3" style="margin-top: 20px;clear:both">Số lượng</div>
                <div class="content_themtondauki_item3" style="margin-top: 20px;margin-left: 36px;"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtSo_Luong"></asp:TextBox></div>
                <div class="content_themtondauki_item3" style="margin-top: 20px">Thành tiền</div>
                <div class="content_themtondauki_item3" style="margin-top: 20px;margin-left: 40px;"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtThanh_Tien"></asp:TextBox></div>
        
            
        </div>
            <div class="button_themkho" style="padding-bottom: 3px;width:700px;margin-top:0px" >
                <div class="button_themkho_item" style="margin-left: 280px;cursor: pointer"><asp:Button runat="server" Text="Save" ID="Button1"  Width="60px" OnClick="Button1_Click" /></div>              
               <div class="button_themkho_item"  style="margin-left: 15px;cursor: pointer" id="cancel_btn">Clear</div>
            </div>

    </div>

 <asp:GridView ID="grvTonDauKi" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowCancelingEdit="grvTonDauKi_RowCancelingEdit" OnRowDataBound="grvTonDauKi_RowDataBound" OnRowDeleting="grvTonDauKi_RowDeleting" OnRowEditing="grvTonDauKi_RowEditing" Width="48%" OnPageIndexChanging="grvTonDauKi_PageIndexChanging" OnSelectedIndexChanged="grvTonDauKi_SelectedIndexChanged" PageSize="6">
        <Columns>
            <asp:TemplateField HeaderText="Ngày">
                <ItemTemplate>
                    <asp:Label ID="lblNgay" runat="server" Text='<%# Eval("Ngay") %>' Width="60px"></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã hàng">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMaHang" runat="server" Text='<%# Bind("Ma_Hang") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Ma_Hang") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="13%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã kho">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMaKho" runat="server" Text='<%# Bind("Ma_Kho") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Ma_Kho") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="13%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Số lượng">
                <EditItemTemplate>
                    <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Bind("So_Luong") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("So_Luong") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="13%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thành Tiền">
                <EditItemTemplate>
                    <asp:TextBox ID="txtThanhTien" runat="server" Text='<%# Bind("Thanh_Tien") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Thanh_Tien") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Các chức năng">
                <EditItemTemplate>
                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Update" Width="60px" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Cancel" Width="60px" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Edit" Width="60px" />
                    <asp:Button ID="Update" runat="server" CommandName="Update" Text="Update" Width="60px" />
                </ItemTemplate>
                <ItemStyle Width="20%" />
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

