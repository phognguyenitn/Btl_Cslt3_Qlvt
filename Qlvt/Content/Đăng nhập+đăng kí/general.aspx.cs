using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_Dangnhap_dangki_general : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"]==null)
        {
            Response.Redirect("login.aspx");
        }
        Response.Write("Welcome");
    }
}