<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_Home.master" AutoEventWireup="true" CodeFile="PhieuNhap.aspx.cs" Inherits="Content_Nghiepvu_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
            <div style="font-size: 12px;">Cập nhập, sửa, xóa Phiếu nhập</div>
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
                <div class="content_themkho_item" style="margin-top: 5px">Mã kho</div>
                <div class="content_themkho_item"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtId_Insert"></asp:TextBox></div>
              <div class="content_themkho_item" style="margin-top: 5px">Tên kho</div>
                 <div class="content_themkho_item"><asp:TextBox ClientIDMode="Static" runat="server" ID="txtName_insert"></asp:TextBox></div>
              
             
            </div>
            <div class="button_themkho" style="padding-bottom: 3px;" >
                <div class="button_themkho_item" style="margin-left: 155px;cursor: pointer"><asp:Button runat="server" Text="Save" ID="BtnSave" OnClick="BtnSave_Click" Width="60px"/></div>              
               <div class="button_themkho_item"  style="margin-left: 15px;cursor: pointer" id="cancel_btn">Clear</div>
            </div>
        </div>    
</div>

</asp:Content>

