using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Content_Dangnhap_login : System.Web.UI.Page
{

     SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True");
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_Click(object sender, EventArgs e)
    {


        if (CheckLogin(txtName.Text.Trim()))
        {
            
            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandText = ("insert into tb_User(UserName,UserPassword,Email,UserRole)  values(N'" + txtName.Text + "','" + txtPass.Text + "','" + txtMail.Text + "',0)");
            cmd.CommandType = CommandType.Text;
            cmd.ExecuteNonQuery();
            con.Close();
            lbSuccess.Text = "Bạn đã đăng kí thành công " + txtName.Text;
        }
        else
        {
            lbSuccess.Text = "Không thành công";



        }
    }

    private bool CheckLogin(string txtName)
    {

        String connStr;
        String strSQL;
        SqlConnection myConnection;
        SqlDataAdapter myAdapter;

        DataTable myTable = new DataTable();

        //Mở kết nối
        connStr = "Data Source=(local);Initial Catalog=VATTU_DB;Integrated Security=True";
        myConnection = new SqlConnection(connStr);
        myConnection.Open();

        //Câu lệnh SQL
        strSQL = "select * from tb_User where UserName='"+txtName+"'";

        //Lấy Dữ liệu         
        myAdapter = new SqlDataAdapter(strSQL, connStr);
        myAdapter.Fill(myTable);
        myConnection.Close();

        if (myTable.Rows.Count > 0) 
            return false;
        else return true;
    
    
    }
}