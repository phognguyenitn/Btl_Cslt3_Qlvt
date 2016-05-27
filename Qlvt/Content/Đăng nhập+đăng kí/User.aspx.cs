using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class Content_Đăng_nhập_đăng_kí_User : System.Web.UI.Page
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
            string strSelect = "select * from tb_User";
            SqlDataAdapter da = new SqlDataAdapter(strSelect, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            conn.Close();
            grvUser.DataSource = dt;
            grvUser.DataBind();

        }
        catch (Exception)
        {

        }

    }
    protected void grvUser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='pink';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            e.Row.ToolTip = "Click last column for selecting this row.";
        }
    }
    protected void grvUser_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        conn.Open();
        Label lblId = (Label)grvUser.Rows[e.RowIndex].FindControl("lblId");
        string strDelete = "delete from tb_User where UserId = '" + lblId.Text + "' ";
        SqlCommand cmd = new SqlCommand(strDelete, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        FillGrid();
    }
    protected void grvUser_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grvUser.EditIndex = -1;
        FillGrid();
    }
    protected void grvUser_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblId = (Label)grvUser.Rows[e.RowIndex].FindControl("lblId");
        TextBox ten = (TextBox)grvUser.Rows[e.RowIndex].FindControl("txtName");
       
        TextBox email = (TextBox)grvUser.Rows[e.RowIndex].FindControl("txtEmail");
        TextBox role = (TextBox)grvUser.Rows[e.RowIndex].FindControl("txtRole");
        conn.Open();
        string strUpdate = "update tb_User set UserName=N' " + ten.Text + "' ,Email='" + email.Text + "',UserRole='" + role.Text + "' where UserId = '" + lblId.Text + "'";
        SqlCommand cmd = new SqlCommand(strUpdate, conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        grvUser.EditIndex = -1;
        FillGrid();
    }
    protected void grvUser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grvUser.PageIndex = e.NewPageIndex;
        FillGrid();
    }
    protected void grvUser_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void grvUser_RowEditing(object sender, GridViewEditEventArgs e)
    {
        grvUser.EditIndex = e.NewEditIndex;
        
        FillGrid();
    }
}