<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="HangHoa.aspx.cs" Inherits="Content_Danhmuc_HangHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../../Style/Main_css.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="search_Hang">
        
    </div>
    <div id="content_main_hang">
        <asp:Repeater runat="server" ID="rpt_Hanghoa">
          
            <ItemTemplate>
            <div class="content_hanghoa">   
            
                <div class="content_hanghoa_img"> 
                  <asp:Image runat="server" ImageUrl='<%#Eval("anh_hang") %>' Width="407px" Height="200px"/>
                </div>
                <div class="ten_price_hanghoa">
                    <div class="content_hanghoa_ten">
                        <asp:Label runat="server" Text='<%#Eval("Ten_Hang") %>' ></asp:Label>
                    </div >
                    <div class="content_hanghoa_gia" >
                        <asp:Label runat="server" Text='<%#Eval("dongia_hang","{0:N0}") %>'></asp:Label>
                    </div>
                </div>
            </div>    
    </ItemTemplate>
          
</asp:Repeater>
        </div>
       <div class="link_page">
            <asp:Repeater ID="rptPager" runat="server">
            <ItemTemplate>
                
                <asp:LinkButton ID="lnkPage" runat="server" Text='<%#Eval("Text") %>' CommandArgument='<%# Eval("Value") %>'
                    CssClass='<%# Convert.ToBoolean(Eval("Enabled")) ? "page_enabled" : "page_disabled" %>'
                    OnClick="Page_Changed" OnClientClick='<%# !Convert.ToBoolean(Eval("Enabled")) ? "return false;" : "" %>'></asp:LinkButton>
                
           </ItemTemplate>
        </asp:Repeater>
       </div>
    
</asp:Content>

