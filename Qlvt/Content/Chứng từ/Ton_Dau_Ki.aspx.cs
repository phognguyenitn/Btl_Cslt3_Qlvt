using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Content_Chứng_từ_Ton_Dau_Ki : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True;MultipleActiveResultSets=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            FillGrid();
        }
       

    }
    void FillGrid()
    { 
                conn.Open();
                string strSelect = "select * from tb_Ton_Dau_Ki";
                SqlDataAdapter da = new SqlDataAdapter(strSelect, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                grvTonDauKi.DataSource = dt;
                grvTonDauKi.DataBind();

                SqlCommand cmdKho = new SqlCommand("select  * from tb_Ma_Kho", conn);
                SqlDataReader dr3 = cmdKho.ExecuteReader();
                ddlMaKho.DataSource = dr3;
                ddlMaKho.DataTextField = "Ten_Kho";
                ddlMaKho.DataValueField = "Ma_Kho";
                ddlMaKho.DataBind();

                SqlCommand cmdhang = new SqlCommand("select  * from tb_Hang_Hoa", conn);
                SqlDataReader dr2 = cmdhang.ExecuteReader();
                ddlMaHang.DataSource = dr2;
                ddlMaHang.DataTextField = "Ten_Hang";
                ddlMaHang.DataValueField = "Ma_Hang";
                ddlMaHang.DataBind();
                conn.Close();


        


    }

    protected void grvTonDauKi_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='pink';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            e.Row.ToolTip = "Click last column for selecting this row.";
        }
    }

  
   protected void grvTonDauKi_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvTonDauKi.EditIndex = -1;
        FillGrid();
    }

    protected void grvTonDauKi_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblNgay = (Label)grvTonDauKi.Rows[e.RowIndex].FindControl("lblNgay");
        TextBox mahang = (TextBox)grvTonDauKi.Rows[e.RowIndex].FindControl("txtMaHang");
        TextBox makho = (TextBox)grvTonDauKi.Rows[e.RowIndex].FindControl("txtMaKho");
        TextBox soluong = (TextBox)grvTonDauKi.Rows[e.RowIndex].FindControl("txtSoLuong");
        TextBox thanhtien = (TextBox)grvTonDauKi.Rows[e.RowIndex].FindControl("txtThanhTien");
        conn.Open();
        string strUpdate = "update tb_Ton_Dau_Ki set Ma_Hang=N' " + mahang.Text + "' , Ma_Kho=N' " + makho.Text + "',So_Luong='" + soluong.Text + "',Thanh_Tien='" + thanhtien.Text + "' where Ngay = '" + lblNgay.Text + "'";
        SqlCommand cmd = new SqlCommand(strUpdate, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        grvTonDauKi.EditIndex = -1;
        FillGrid();
    }
    protected void grvTonDauKi_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvTonDauKi.PageIndex = e.NewPageIndex;
        FillGrid();
    }
    protected void grvTonDauKi_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void grvTonDauKi_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        conn.Open();
        Label lblNgay = (Label)grvTonDauKi.Rows[e.RowIndex].FindControl("lblNgay");
        string strDelete = "delete from tb_Ton_Dau_Ki where Ma_Kh = '" + lblNgay.Text + "' ";
        SqlCommand cmd = new SqlCommand(strDelete, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        FillGrid();
    }
    protected void grvTonDauKi_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvTonDauKi.EditIndex = e.NewEditIndex;
        
        FillGrid();
    }


  

    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
       
        string strSave = "insert into  tb_Ton_Dau_Ki values('" + txtNgay.Text + "','" + ddlMaHang.SelectedItem.Value + "','" + ddlMaKho.SelectedItem.Value + "','"+txtSo_Luong.Text+"','"+txtThanh_Tien.Text+"')";
        SqlCommand cmd = new SqlCommand(strSave, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        grvTonDauKi.EditIndex = -1;
        FillGrid();
    

    }
    
    protected void ddl2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void ddl3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}