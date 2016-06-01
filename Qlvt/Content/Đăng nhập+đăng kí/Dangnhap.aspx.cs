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

    SqlConnection myConnection = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True;MultipleActiveResultSets=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private int CheckLogin(string sUsername, string sPassword)
    {

        //Mở kết nối
        string strSqlAdmin;
        string strSqlUser;
        SqlDataAdapter myAdapter1;
        SqlDataAdapter myAdapter2;
        DataTable myTable1 = new DataTable();
        DataTable myTable2 = new DataTable();


        //Câu lệnh SQL
        strSqlAdmin = "Select * From tb_User Where Username = '" + sUsername + "' And UserPassword = '" + sPassword + "' and  UserRole = 1";
        strSqlUser = "Select * From tb_User Where Username = '" + sUsername + "' And UserPassword = '" + sPassword + "' and  UserRole = 0";
        //Lấy Dữ liệu         
        myAdapter1 = new SqlDataAdapter(strSqlAdmin, myConnection);
        myAdapter1.Fill(myTable1);
        myAdapter2 = new SqlDataAdapter(strSqlUser, myConnection);
        myAdapter2.Fill(myTable2);

        if (myTable1.Rows.Count > 0) return 1;
        if (myTable2.Rows.Count > 0) return 2;
        else return 0;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckLogin(t1.Text.Trim(), t2.Text.Trim()) == 1)
        {

            Response.Redirect("http://localhost:2051/Content/%C4%90%C4%83ng%20nh%E1%BA%ADp+%C4%91%C4%83ng%20k%C3%AD/HomeAd.aspx");
        }
        if (CheckLogin(t1.Text.Trim(), t2.Text.Trim()) == 2)
        {
            Response.Redirect("http://localhost:2051/Content/%C4%90%C4%83ng%20nh%E1%BA%ADp+%C4%91%C4%83ng%20k%C3%AD/HomeUser.aspx");
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
        
