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
 


    <div id="danhmuckho_content" style="text-align: right"  >



        <div id="open_kho" style="cursor: pointer"  >                      
                        
         </div>   
         <div id="block_insertkho">           
            <div  id="close_kho" class="title_themkho" style="cursor: pointer">
                <div style="float: left;margin-left: 5px;">
                    <img src="../../Image/data_icon_tittle.gif" />  </div>             
                <div style="float: left;margin-left: 5px;" >Tìm kiếm</div>
                <div style="float: right;margin-left: 5px;cursor: pointer">
                    <img src="../../Image/Close_icon.png" />
                </div>
            </div>
            <div class="content_themkho">
                <div class="content_themkho_item1" style="margin-top: 5px">Từ ngày</div>
                <div class="content_themkho_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtTuNgay" Width="100px"></asp:TextBox></div>
                <div class="content_phieunhap_item" > </div> 
              <div class="content_phieunhap_item"><asp:ImageButton ID="ImageButton1" runat="server" Height="23px" ImageUrl="~/Image/calendar-128.png" Width="26px" OnClick="ImageButton1_Click" /></div>      

              <div class="content_themkho_item1" style="margin-top: 5px">Đến ngày</div>
                 <div class="content_themkho_item1"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtDenNgay" Width="100px"></asp:TextBox></div>
              
             <div class="content_phieunhap_item" > </div> 
              <div class="content_phieunhap_item"><asp:ImageButton ID="ImageButton2" runat="server" Height="23px" ImageUrl="~/Image/calendar-128.png" Width="26px" OnClick="ImageButton2_Click" /></div>      
                 <div style="position: absolute; margin-left: 2px;margin-top: 25px" > <asp:Calendar ID="cldTuNgay" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="cldTuNgay_SelectionChanged" ShowGridLines="True" Width="220px">
                  <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                  <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                  <OtherMonthDayStyle ForeColor="#CC9966" />
                  <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                  <SelectorStyle BackColor="#FFCC66" />
                  <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                  <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                  </asp:Calendar></div> 

                <div style="position: absolute; margin-left: 278px;margin-top: 25px" > <asp:Calendar ID="cldDenNgay" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" OnSelectionChanged="cldDenNgay_SelectionChanged" ShowGridLines="True" Width="220px">
                  <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                  <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                  <OtherMonthDayStyle ForeColor="#CC9966" />
                  <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                  <SelectorStyle BackColor="#FFCC66" />
                  <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                  <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                  </asp:Calendar></div> 

                    <div class="button_themkho" style="padding-bottom: 3px; left: -2px;" >
                <div class="button_themkho_item" style="margin-left: 155px;cursor: pointer"></div>              
               
            </div>
                <asp:Button runat="server" Text="Xem" ID="BtnXem" OnClick="BtnXem_Click" Width="60px" style="margin-left: 0px"/>
                </div>

       
              
            </div>
        
           

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

