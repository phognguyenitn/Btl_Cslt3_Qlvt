using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Content_Danhmuc_Danhmuc_bophan : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {
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
    void FillGrid()
    {
        try
        {
            conn.Open();           
            string strSelect = "select * from tb_Bophan";
            SqlDataAdapter da  = new SqlDataAdapter(strSelect,conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grvdmbf.DataSource = dt;
            grvdmbf.DataBind();
        }
         catch (Exception)
        {
        }
    }


   

    //protected void grvdmbf_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    grvdmbf.PageIndex = e.NewPageIndex;
    //    FillGrid();
    //}
    protected void grvdmbf_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtReceive_TextChanged(object sender, EventArgs e)
    {

    }
    protected void hid_ValueChanged(object sender, EventArgs e)
    {

    }
    protected void grvdmbf_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvdmbf.EditIndex = e.NewEditIndex;
        FillGrid();
    }
    protected void grvdmbf_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        conn.Open();
        Label lblMa = (Label)grvdmbf.Rows[e.RowIndex].FindControl("lblMabf");
        string strDelete = "delete from tb_Bophan where Ma_Bophan = '" + lblMa.Text + "' ";
        SqlCommand cmd = new SqlCommand(strDelete, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        FillGrid();
    }

    protected void grvdmbf_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvdmbf.EditIndex = -1;
        FillGrid();
    }
    protected void grvdmbf_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblMa = (Label)grvdmbf.Rows[e.RowIndex].FindControl("lblMabf");
        TextBox tenbf = (TextBox)grvdmbf.Rows[e.RowIndex].FindControl("txtUpdate_tenbp");
        conn.Open();
        string strUpdate = "Update tb_Bophan SET Ten_Bophan = N'" + tenbf.Text + "' where Ma_Bophan = '" + lblMa.Text + "'";
        SqlCommand cmd = new SqlCommand(strUpdate, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        grvdmbf.EditIndex = -1;
        FillGrid();
    }
    protected void txtTenbf(object sender, EventArgs e)
    {

    }

}