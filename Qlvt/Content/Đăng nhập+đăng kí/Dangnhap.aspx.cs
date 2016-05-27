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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    private bool CheckLogin(string sUsername, string sPassword)
        {
            
            String connStr;
            String strSQL;
            SqlConnection myConnection;
            SqlDataAdapter myAdapter;

            DataTable myTable = new DataTable();

            //Mở kết nối
            connStr="Data Source=ANDONGNHI;Initial Catalog=VATTU_DB;Integrated Security=True";
            myConnection = new SqlConnection(connStr);
            myConnection.Open();

            //Câu lệnh SQL
            strSQL = "Select * From tb_User Where Username = '" + sUsername + "' And UserPassword = '" + sPassword + "'";

            //Lấy Dữ liệu         
            myAdapter = new SqlDataAdapter(strSQL, connStr);
            myAdapter.Fill(myTable);
            myConnection.Close();

            if (myTable.Rows.Count > 0) return true;
            else return false;
        }
    protected void Button1_Click(object sender, EventArgs e)
    {
       if (CheckLogin(t1.Text.Trim(), t2.Text.Trim()))
            {
                Session.Contents["TrangThai"] = "IsLogin";
                Response.Redirect("http://localhost:2051/Content/Home/Home.aspx");
            }
            else
            {
                Response.Write("<SCRIPT LANGUAGE=\"JavaScript\">alert(\"Tên đăng nhập hoặc mật khẩu không đúng\")</SCRIPT>");
                t1.Text = string.Empty;
                t2.Text = string.Empty;
                t1.Focus();
       
             }
    }
}
        
