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
        Fill();
    }

    void Fill()
    {
        try
        {
            string datestr = "6/6/2017";
            string datestr1 = "9/9/2017";
          
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
}