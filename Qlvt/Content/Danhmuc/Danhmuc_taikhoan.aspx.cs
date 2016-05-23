using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Content_Danhmuc_Danhmuc_taikhoan : System.Web.UI.Page
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
            string strSelect = "select * from tb_Tai_Khoan";
            SqlDataAdapter da = new SqlDataAdapter(strSelect, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            grvDmtk.DataSource = dt;
            grvDmtk.DataBind();

        }
        catch (Exception)
        {

        }
    }
 
    protected void grvDmtk_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='pink';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            e.Row.ToolTip = "Click last column for selecting this row.";
        }
    }
    protected void grvDmtk_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        conn.Open();
        Label lblMa = (Label)grvDmtk.Rows[e.RowIndex].FindControl("lblMatk");
        string strDelete = "delete from tb_Tai_Khoan where Ma_Tk = '" + lblMa.Text + "' ";
        SqlCommand cmd = new SqlCommand(strDelete, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        FillGrid();
    }
    protected void grvDmtk_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvDmtk.EditIndex = -1;
        FillGrid();
    }
    protected void grvDmtk_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblMa = (Label)grvDmtk.Rows[e.RowIndex].FindControl("lblMatk");
        TextBox tentk = (TextBox)grvDmtk.Rows[e.RowIndex].FindControl("txtUpdate_tentk");
        TextBox tkMe = (TextBox)grvDmtk.Rows[e.RowIndex].FindControl("txtTkMe");
        conn.Open();
        string strUpdate = "update tb_Tai_Khoan set Ten_Tk=N' " + tentk.Text + "' , Dia_chi=N' " + tkMe.Text + "' where Ma_Tk = '" + lblMa.Text + "'";
        SqlCommand cmd = new SqlCommand(strUpdate, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        grvDmtk.EditIndex = -1;
        FillGrid();
    }
    protected void grvDmtk_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvDmtk.PageIndex = e.NewPageIndex;
        FillGrid();
    }
    protected void grvDmtk_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
  
    protected void BtnSave_Click(object sender, EventArgs e)
        
    {
        conn.Open();
        string strSelect = "select * from tb_Tai_Khoan where Ma_Tk='" + txtMa_Tk_Insert.Text + "'";
        SqlDataAdapter da = new SqlDataAdapter(strSelect, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count == 0)
        {
            string strSave = "insert into  tb_Tai_Khoan values('" + txtMa_Tk_Insert.Text + "','" + txtTen_Tk_Insert.Text + "','" + txtTk_Me_Insert.Text + "')";
            SqlCommand cmd = new SqlCommand(strSave, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            conn.Close();
            grvDmtk.EditIndex = -1;
            FillGrid();
        }
        else
            lblError.Text = "Đã tồn tại ID";
    }
    protected void grvDmtk_RowEditing1(object sender, GridViewEditEventArgs e)
    {
        grvDmtk.EditIndex = e.NewEditIndex;
        txtTen_Tk_Insert.Focus();
        FillGrid();
    }
}
