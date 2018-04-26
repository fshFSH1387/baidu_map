using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GROUP.Manage;
using System.Data.SqlClient;

public partial class UserLogin : System.Web.UI.Page
{
    BaseClass BaseClass1 = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }
    protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
    {
        string strsql = "select * from [user] where 用户名 = '" + Login1.UserName.ToString() + "' and 密码 = '" + Login1.Password.ToString() + "' ";
        DataTable dt = new DataTable();
        dt = BaseClass1.ReadTable(strsql);
        if (dt.Rows.Count > 0)
        {
            Session["name"] = Login1.UserName.ToString();
            Response.Redirect("index.aspx");
        }
        else
        {
            Response.Write("<script>alert(\"用户名不存在或密码错误，请确认后再登录！\");</script>");
        }
    }
}