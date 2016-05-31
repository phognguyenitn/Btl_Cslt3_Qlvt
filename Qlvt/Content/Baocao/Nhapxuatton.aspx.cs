using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class Content_Baocao_Nhapxuatton : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True;MultipleActiveResultSets=True");
    protected void Page_Load(object sender, EventArgs e)
    {
        cldTuNgay.Visible = false;
        cldDenNgay.Visible = false;
    }

    void Fill()
    {
        try
        {
            string datestr = txtTuNgay.Text;
            string datestr1 = txtDenNgay.Text;
          
            conn.Open();
            SqlCommand cmdSelect = new SqlCommand();
            cmdSelect.Connection = conn;
            cmdSelect.CommandText = "Nhapxuatton";
            cmdSelect.CommandType = CommandType.StoredProcedure;
            cmdSelect.Parameters.AddWithValue("@makho", "");
            cmdSelect.Parameters.AddWithValue("@ngay1",datestr);
            cmdSelect.Parameters.AddWithValue("@ngay2",datestr1);
            cmdSelect.ExecuteNonQuery();

            SqlCommand cmdSelecttb = new SqlCommand("select * from resultTondau4");
            cmdSelecttb.Connection = conn;
            DataTable dt = new DataTable();
            SqlDataReader dr = cmdSelecttb.ExecuteReader();
            dt.Load(dr);
            dgvNXT.DataSource = dt;
            dgvNXT.DataBind();




        }
        catch (Exception)
        {

        }
    }
    //Calender
    
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (cldTuNgay.Visible)
        {
            cldTuNgay.Visible = false;
        }
        else
        {
            cldTuNgay.Visible = true;
        }
    }
    protected void BtnXem_Click(object sender, EventArgs e)
    {
        Fill();
    }
    protected void cldTuNgay_SelectionChanged(object sender, EventArgs e)
    {
        txtTuNgay.Text = cldTuNgay.SelectedDate.ToString("d");
        cldTuNgay.Visible = false;

    }
    protected void cldDenNgay_SelectionChanged(object sender, EventArgs e)
    {
        txtDenNgay.Text = cldDenNgay.SelectedDate.ToString("d");
        cldDenNgay.Visible = false;
      
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        if (cldDenNgay.Visible)
        {
            cldDenNgay.Visible = false;
        }
        else
        {
            cldDenNgay.Visible = true;
        }
    }
}