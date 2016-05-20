using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Content_Dangnhap_dangki_Dangnhap : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = con.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "select*from tb_User where UserName='" + t1.Text + "' and UserPassword='" + t2.Text + "' ";
        cmd.ExecuteNonQuery();
        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach(DataRow dr in dt.Rows)
        {
            Session["UserName"] = dr[0].ToString();
            Session["UserPassword"] = dr[1].ToString();
           
                Response.Redirect("http://localhost:1616/Content/Home/Home.aspx");
         
                
        }
        



        con.Close();
    }
}