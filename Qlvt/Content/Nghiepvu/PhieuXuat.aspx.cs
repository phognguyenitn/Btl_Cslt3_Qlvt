using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Content_Nghiepvu_PhieuXuat : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True;MultipleActiveResultSets=True");

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            conn.Open();
            //Load ddl Bo phan        
            SqlCommand cmdBophan = new SqlCommand("select  * from tb_Bophan", conn);
            SqlDataReader dr1 =cmdBophan.ExecuteReader();
            ddlBophan.DataSource = dr1;
            ddlBophan.DataTextField = "Ten_Bophan";
            ddlBophan.DataValueField = "Ma_Bophan";
            ddlBophan.DataBind();

            //Load ddl Kho
            SqlCommand cmdKho = new SqlCommand("select  * from tb_Ma_Kho", conn);
            SqlDataReader dr2 = cmdKho.ExecuteReader();
            ddlMakho.DataSource = dr2;
            ddlMakho.DataTextField = "Ten_Kho";
            ddlMakho.DataValueField = "Ma_Kho";
            ddlMakho.DataBind();

            ////Load ddl KhachHang
            SqlCommand cmdKhachhang = new SqlCommand("select * from tb_Khach_Hang ", conn);
            ddlKhachhang.DataSource = cmdKhachhang.ExecuteReader();
            ddlKhachhang.DataTextField = "Ten_Kh";
            ddlKhachhang.DataValueField = "Ma_Kh";
            ddlKhachhang.DataBind();

            ////Load ddl danhmuctk co
            SqlCommand cmdtkco = new SqlCommand("select * from tb_Tai_Khoan ", conn);
            ddlTkco.DataSource = cmdtkco.ExecuteReader();
            ddlTkco.DataTextField = "Ma_Tk";
            ddlTkco.DataValueField = "Ma_Tk";
            ddlTkco.DataBind();

            ////Load ddl danhmuctk no
            SqlCommand cmdtkno = new SqlCommand("select * from tb_Tai_Khoan ", conn);
            ddlTkno.DataSource = cmdtkno.ExecuteReader();
            ddlTkno.DataTextField = "Ma_Tk";
            ddlTkno.DataValueField = "Ma_Tk";
            ddlTkno.DataBind();


            cldDate.Visible = false;
            conn.Close();
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        addRowsToGrid();
    }
    private void addRowsToGrid()
    {
        List<int> noofRows = new List<int>();
        int rows = 0;
        int.TryParse(txtNoOfRecord.Text.Trim(), out rows);
        for (int i = 0; i < rows; i++)
        {
            noofRows.Add(i);
        }
        dgv_phieuxuat.DataSource = noofRows;
        dgv_phieuxuat.DataBind();
    }

  
    protected void dgv_phieuxuat_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select * from tb_Hang_Hoa ", conn);
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("ddlMahang");
                ddl.DataSource = cmd.ExecuteReader();
                ddl.DataTextField = "Ten_Hang";
                ddl.DataValueField = "Ma_Hang";
                ddl.DataBind();
            }
        }
        catch (Exception)
        {

            throw;
        }

        finally
        {
            conn.Close();
        }

    }
    //Calender
    protected void cldDate_SelectionChanged(object sender, EventArgs e)
    {
        txtDate.Text = cldDate.SelectedDate.ToString("d");
        cldDate.Visible = false;
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (cldDate.Visible)
        {
            cldDate.Visible = false;
        }
        else
        {
            cldDate.Visible = true;
        }
    }
    //Save

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        conn.Open();
        DropDownList ddlMaHang = null;
        TextBox txtSoLuong = null;
        TextBox txtDonGia = null;
        int thanhtien = 0;

        string insertStrpn = "insert into tb_Phieu_Xuat(So,ngay,Tk_no,Tk_Co,Ma_Kh,Ma_Bophan,Ma_Kho,Dien_Giai) values ('" + txtSo_insert.Text + "','" + txtDate.Text + "','" + ddlTkno.SelectedItem.Value + "','" + ddlTkco.SelectedItem.Value + "','" + ddlKhachhang.SelectedItem.Value.Trim() + "','" + ddlBophan.SelectedItem.Value.Trim() + "','" + ddlMakho.SelectedItem.Value.Trim() + "','" + txtDiengiai.Text + "')";
        foreach (GridViewRow row in dgv_phieuxuat.Rows)
        {

            ddlMaHang = (DropDownList)row.FindControl("ddlMahang");
            txtSoLuong = (TextBox)row.FindControl("txtSoluong");
            txtDonGia = (TextBox)row.FindControl("txtDongia");
            thanhtien = int.Parse(txtSoLuong.Text) * int.Parse(txtDonGia.Text);
            SqlCommand cmdinsert1 = new SqlCommand();
            cmdinsert1.Connection = conn;
            cmdinsert1.CommandText = "insert_ctpn";
            cmdinsert1.CommandType = CommandType.StoredProcedure;
            cmdinsert1.Parameters.AddWithValue("@so", txtSo_insert.Text);
            cmdinsert1.Parameters.AddWithValue("@ma_hang", ddlMaHang.SelectedItem.Value);
            cmdinsert1.Parameters.AddWithValue("@soluong", int.Parse(txtSoLuong.Text));
            cmdinsert1.Parameters.AddWithValue("@dongia", int.Parse(txtDonGia.Text));
            cmdinsert1.Parameters.AddWithValue("@thanh_tien", thanhtien);
            cmdinsert1.ExecuteNonQuery();
        }
        SqlCommand cmdinsert0 = new SqlCommand(insertStrpn, conn);
        cmdinsert0.CommandType = CommandType.Text;
        cmdinsert0.ExecuteNonQuery();    

    }
 
    protected void dgv_phieuxuat_PageIndexChanging1(object sender, GridViewPageEventArgs e)
    {
        dgv_phieuxuat.PageIndex = e.NewPageIndex;
    }
    protected void dgv_phieuxuat_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {

    }
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {

    }
}