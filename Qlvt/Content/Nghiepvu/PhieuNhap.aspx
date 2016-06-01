<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="PhieuNhap.aspx.cs" Inherits="Content_Nghiepvu_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
    
     <script>
         $(document).ready(function () {
             $("#open_kho").click(function () {
                 $("#block_insertphieunhap").show("Slow");
             });
             $("#close_kho").click(function () {
                 $("#block_insertphieunhap").hide("Slow");
             });
         });
     </script>
    <script>
        $(document).ready(function () {
            $("#cancel_btn").click(function () {
                $('#txtId_Insert').val('');
                $("#cancel_btn").click(function () {
                    $('#txtName_insert').val('');
                });
            });
        });
    </script>
        <style type="text/css">
            .auto-style1 {
                float: left;
                cursor: pointer;
                width: 73px;
            }
            .auto-style2 {
                margin-left: 6px;
            }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--Tittle--%>
    <div class="danhmuckho_tittle">
        <div>Phiếu nhập kho</div>
            <div style="font-size: 12px;">Cập nhập, xem phiếu nhập kho</div>
    </div>   
<%--Content--%>      
<div id="danhmuckho_content">
    <div id="open_kho" style="cursor: pointer"  >                      
             <img src="../../Image/create_icon.gif" />            
         </div>          
        <div id="block_insertphieunhap" >           
            <div  id="close_kho" class="title_themkho" style="cursor: pointer;width:600px">
                <div style="float: left;margin-left: 5px;">
                    <img src="../../Image/data_icon_tittle.gif" /></div>             
                <div style="float: left;margin-left: 5px;" >Phiếu nhập kho</div>
                <div style="float: right;margin-left: 5px;cursor: pointer">
                    <img src="../../Image/Close_icon.png" />
                </div>
            </div>
            <div class="content_phieunhap">
                <div>
              <div class="content_phieunhap_item" style="margin-top: 5px;">Số phiếu</div>
                <div class="content_phieunhap_item" style="margin-left: 27px;"  class="auto-style15"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtSo_insert"></asp:TextBox></div>
              <div class="content_phieunhap_item" style="margin-top: 5px">Ngày</div>
               <div class="content_phieunhap_item" > <asp:TextBox ID="txtDate" runat="server" OnTextChanged="txtDate_TextChanged"></asp:TextBox></div> 
              <div class="content_phieunhap_item"><asp:ImageButton ID="ImageButton1" runat="server" Height="23px" ImageUrl="~/Image/calendar-128.png" Width="26px" OnClick="ImageButton1_Click" /></div>      
                </div>
              <div style="position: absolute; margin-left: 328px;margin-top: 25px" > <asp:Calendar ID="cldDate" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="cldDate_SelectionChanged" ShowGridLines="True" Width="220px">
                  <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                  <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                  <OtherMonthDayStyle ForeColor="#CC9966" />
                  <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                  <SelectorStyle BackColor="#FFCC66" />
                  <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                  <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                  </asp:Calendar></div> 
                
                <div style="clear: both;margin-top:35px;">
                 <div  class="content_phieunhap_item1"><asp:Label ID="Label1" runat="server" Text="Khách hàng"></asp:Label></div> 
                   <div class="content_phieunhap_item1"> <asp:DropDownList ID="ddlKhachhang" runat="server"> </asp:DropDownList></div>
                   <div class="content_phieunhap_item1" style="margin-left: 54px;"> <asp:Label ID="Label2" runat="server" Text="Tk nợ"></asp:Label></div>
                  <div class="content_phieunhap_item1">  <asp:DropDownList ID="ddlTkno" runat="server"></asp:DropDownList></div>
                </div>
                <div style="clear: both;margin-top: 69px">             
                  <div  class="content_phieunhap_item2"> <asp:Label ID="Label3" runat="server" Text="Diển giải"></asp:Label></div> 
                 <div  class="content_phieunhap_item2" style="margin-left: 26px;"><asp:TextBox ID="txtDiengiai" runat="server"></asp:TextBox></div>
                <div  class="content_phieunhap_item2"><asp:Label ID="Label4" runat="server" Text="Tk có"></asp:Label></div>
                <div  class="content_phieunhap_item2"><asp:DropDownList ID="ddlTkco" runat="server"></asp:DropDownList></div>        
                </div>
                <div style="clear: both;margin-top: 103px">
                    <div class="content_phieunhap_item3"><asp:Label ID="Label5" runat="server" Text="Kho"></asp:Label></div>
                   <div class="content_phieunhap_item3" style="    margin-left: 56px;"> <asp:DropDownList ID="ddlMakho" runat="server" ></asp:DropDownList></div> 
                     </div>
                <div style="clear: both;    margin-top: 137px;">
                
              
                    <div class="content_phieunhap_item4">Insert Detail</div>
                    <div class="content_phieunhap_item4"><asp:TextBox runat="server" ID="txtNoOfRecord"></asp:TextBox></div>
                     <div class="content_phieunhap_item4"><asp:Button runat="server" Text="Addrow" ID="btnAdd" OnClick="btnAdd_Click"></asp:Button></div>
                </div>
                <div><asp:GridView ID="dgv_phieunhap" runat="server" AutoGenerateColumns="False" ShowFooter="True" CellPadding="5" OnRowDataBound="dgv_phieunhap_RowDataBound" CssClass="auto-style2" Width="410px" AllowPaging="True" PageSize="2" OnPageIndexChanging="dgv_phieunhap_PageIndexChanging1" OnSelectedIndexChanged="dgv_phieunhap_SelectedIndexChanged" >
                    <Columns>
                          <asp:TemplateField HeaderText="Số tt">
                              <ItemTemplate>
                                  <%#Container.DataItemIndex+1 %>
                              </ItemTemplate>
                          </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tên Hàng">
                            <ItemTemplate >                               
                                <asp:DropDownList ID="ddlMahang" runat="server" >
                                </asp:DropDownList>                               
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                        <asp:TemplateField HeaderText="Số lượng">
                            <ItemTemplate>
                                <asp:TextBox runat="server" Width="80px" ID="txtSoluong"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Đơn giá">
                                 <ItemTemplate>
                                <asp:TextBox ID="txtDongia" runat="server" Width="80px"></asp:TextBox>
                            </ItemTemplate>                         
                        </asp:TemplateField>
                   
                        
                    </Columns>
                 
                    </asp:GridView></div>                
                
           
            <div class="button_themkho" style="padding-bottom: 3px; width: 600px;" >
                <div class="auto-style1" style="margin-left: 155px;"><asp:Button runat="server" Text="Save" ID="BtnSave"  Width="60px" OnClick="BtnSave_Click"/></div>              
               <div class="button_themkho_item"  style="margin-left: 15px;cursor: pointer" id="cancel_btn">Clear</div>
            </div>
        </div>        

    </div>

    <asp:GridView ID="grvPnk" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="grvPnk_SelectedIndexChanged" Width="40%" PageSize="5" OnPageIndexChanging="grvPnk_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="Số">
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("So") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="5%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngày">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Eval("Ngay") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="20%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã khách hàng">
                <ItemTemplate>
                    <asp:Label ID="Label10" runat="server" Text='<%# Eval("Ma_Kh") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="13%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã kho">
                <ItemTemplate>
                    <asp:Label ID="Label11" runat="server" Text='<%# Eval("Ma_Kho") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="13%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Mã hàng">
                <ItemTemplate>
                    <asp:Label ID="Label12" runat="server" Text='<%# Eval("Ma_Hang") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle Width="13%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thành tiền">
                <ItemTemplate>
                    <asp:Label ID="Label13" runat="server" Text='<%# Eval("Thanh_Tien") %>'></asp:Label>
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



    <div><asp:Label runat="server" ID="lblError"></asp:Label></div>


  </div>
</asp:Content>

