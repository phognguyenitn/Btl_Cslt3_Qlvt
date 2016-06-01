using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Content_Đăng_nhập_đăng_kí_HomeAd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lblDangOnline.Text = Application["KhachTruyCap"].ToString();
        double Khach = 0;
        TextReader Tr = new StreamReader(Server.MapPath("Khach_Online.txt"));
        Khach = Convert.ToDouble(Tr.ReadLine());
        Tr.Close();
        Tr.Dispose();
        try
        {
            Khach++;
            TextWriter tw = new StreamWriter(Server.MapPath("Khach_Online.txt"));

            tw.Write(Khach);
            tw.Close();
            tw.Dispose();

        }
        catch
        {
            throw;
        }
        lblTongTruyCap.Text = Khach.ToString();

    }
}