﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class Content_Đăng_nhập_đăng_kí_HomeAdmin : System.Web.UI.Page
{
    //long newCount;
    //System.IO.StreamReader sr;
    //sr =new System.IO.StreamReader(Server.MapPath("\\Đăng nhập+đăng kí\\SLTC.txt"));
    //string s=sr.ReadLine();
    //sr.Close();
    //newCount=long.Parse(S)+1;
    //Session.Add("LoginCount",newCount.ToString());
    //System.IO.StreamWriter sw;
    //sw =new System.IO.StreamReader(Server.MapPath("\\Đăng nhập+đăng kí\\SLTC.txt"));
    //sw.Write(newCount.ToString());
    //sw.Close();

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