using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Content_Dangnhap_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType =CommandType.Text;
        cmd.CommandText = "insert into tb_User values(N'" + t1.Text + "','" + t2.Text + "','" + t3.Text + "','" + t4.Text + "')";
        cmd.ExecuteNonQuery();


        con.Close();
    }
}