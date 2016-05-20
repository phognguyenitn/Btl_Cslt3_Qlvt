using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Content_Danhmuc_Danhmuckho : System.Web.UI.Page
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

    //Hàm Load data
    void FillGrid()
    {
        try
        {
            conn.Open();           
            string strSelect = "select * from tb_Ma_Kho";
            SqlDataAdapter da  = new SqlDataAdapter(strSelect,conn);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(ds);
            conn.Close();
            dgvDmk.DataSource = ds.Tables[0];
            dgvDmk.DataBind(); 
            
        }
        catch (Exception)
        {
           
        }
    }

    //Đổi màu khi hover
    protected void dgvDmk_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='pink';";
            e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
            e.Row.ToolTip = "Click last column for selecting this row.";
        }
    }
 
    //Phân trang
    protected void dgvDmk_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        
        dgvDmk.PageIndex = e.NewPageIndex;
        FillGrid();
    }





    //Xóa 
    protected void dgvDmk_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        conn.Open();
        Label lblId = (Label) dgvDmk.Rows[e.RowIndex].FindControl("lblStoreId");
        string strDelete = "delete from tb_Ma_Kho where Ma_Kho = '" + lblId.Text + "' ";
        SqlCommand cmd = new SqlCommand(strDelete,conn);
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        FillGrid();
    }

  
    //Edit
    protected void dgvDmk_RowEditing(object sender, GridViewEditEventArgs e)
    {
        dgvDmk.EditIndex = e.NewEditIndex;
       FillGrid();
    }
    protected void dgvDmk_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Label lblId = (Label)dgvDmk.Rows[e.RowIndex].FindControl("lblStoreId");
        TextBox tenkho = (TextBox) dgvDmk.Rows[e.RowIndex].FindControl("txtTenkho");
        conn.Open();
        string strUpdate = "Update tb_Ma_Kho SET Ten_Kho = '" + tenkho.Text + "' where Ma_Kho = '" + lblId.Text + "'";
        SqlCommand cmd = new SqlCommand(strUpdate,conn);    
        cmd.CommandType = CommandType.Text;
        cmd.ExecuteNonQuery();
        conn.Close();
        dgvDmk.EditIndex = -1;
        FillGrid();
    }
    protected void dgvDmk_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        dgvDmk.EditIndex = -1;
        FillGrid();
    }


    protected void BtnSave_Click(object sender, EventArgs e)
    {

        conn.Open();
        string selectstr = "select * from tb_Ma_Kho where Ma_kho = '"+txtId_Insert.Text+"'";       
        SqlDataAdapter da = new SqlDataAdapter(selectstr,conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        int dem = dt.Rows.Count;
        if (dem < 1)
        {
            string strUpdate = "Insert into  tb_Ma_Kho values (  '" + txtId_Insert.Text + "'  , '" + txtName_insert.Text + "')";
            SqlCommand cmd = new SqlCommand(strUpdate, conn);
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            conn.Close();
            FillGrid();
        }
        else
        {
            lblError.Text = "Đã tồn tại Mã kho";
        }
       
    }
    protected void btnXoa_Click(object sender, EventArgs e)
    {
        txtId_Insert.Text = string.Empty;
        txtName_insert.Text = string.Empty;
        txtId_Insert.Focus();
    }
}