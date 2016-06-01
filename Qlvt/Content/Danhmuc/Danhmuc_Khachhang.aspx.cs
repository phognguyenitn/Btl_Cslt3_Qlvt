using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;


public partial class Content_Danhmuc_Danhmuc_Khachhang : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True");
        try
        {
            if (!IsPostBack)
            {
                FillGrid();
            }
        }
        catch (Exception)
        {


        }

    }

    //Hàm Load data
    void FillGrid()
    {
        try
        {
            conn.Open();
            string strSelect = "select * from tb_Khach_Hang";
            SqlDataAdapter da = new SqlDataAdapter(strSelect, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            grvDmkh.DataSource = dt;
            grvDmkh.DataBind();

        }
        catch (Exception)
        {

        }

    }

    protected void grvDmkh_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='pink';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            e.Row.ToolTip = "Click last column for selecting this row.";
        }
    }
    protected void grvDmkh_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        conn.Open();
        Label lblMa = (Label)grvDmkh.Rows[e.RowIndex].FindControl("lblMaKh");
        string strDelete = "delete from tb_Khach_Hang where Ma_Kh = '" + lblMa.Text + "' ";
        SqlCommand cmd = new SqlCommand(strDelete, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        FillGrid();
    }
    protected void grvDmkh_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvDmkh.EditIndex = -1;
        FillGrid();
    }
    protected void grvDmkh_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblMa = (Label)grvDmkh.Rows[e.RowIndex].FindControl("lblMaKh");
        TextBox tenkh = (TextBox)grvDmkh.Rows[e.RowIndex].FindControl("txtTenkh");
        TextBox diachi = (TextBox)grvDmkh.Rows[e.RowIndex].FindControl("txtDiachi");
        TextBox masothue = (TextBox)grvDmkh.Rows[e.RowIndex].FindControl("txtMaSoThue");
        TextBox tiemnang = (TextBox)grvDmkh.Rows[e.RowIndex].FindControl("txtTiemNang");
        conn.Open();
        string strUpdate = "update tb_Khach_Hang set Ten_Kh=N' " + tenkh.Text + "' , Dia_chi=N' " + diachi.Text + "',Ma_So_Thue='" + masothue.Text + "',Tiem_Nang='" + tiemnang.Text + "' where Ma_Kh = '" + lblMa.Text + "'";
        SqlCommand cmd = new SqlCommand(strUpdate, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        grvDmkh.EditIndex = -1;
        FillGrid();
    }

    protected void grvDmkh_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvDmkh.PageIndex = e.NewPageIndex;
        FillGrid();
    }
    protected void grvDmkh_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
         conn.Open();
        string strSelect = "select * from tb_Khach_Hang where Ma_kh='" + txtMa_kh_Insert.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(strSelect, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 0)
        {
            string strSave = "insert into  tb_Khach_Hang values('" + txtMa_kh_Insert.Text + "','" + txtTen_Kh_Insert.Text + "','" + txtDia_chi_Insert.Text + "','"+txtMa_So_Thue.Text+"','"+txtTiem_Nang.Text+"')";
            SqlCommand cmd = new SqlCommand(strSave, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            conn.Close();
            grvDmkh.EditIndex = -1;
            FillGrid();
            lblError.Text = "";
        }
        else
            lblError.Text = "Đã tồn tại Mã khách hàng";
    }
   
    protected void grvDmkh_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvDmkh.EditIndex = e.NewEditIndex;
        txtMa_kh_Insert.Focus();
        FillGrid();
    }
}
