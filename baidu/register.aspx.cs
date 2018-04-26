using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using GROUP.Manage;

public partial class register : System.Web.UI.Page
{
    BaseClass BaseClass1 = new BaseClass();
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string strsql = "select * from [user] where 用户名 ='" + args.Value.ToString() + "'";
        DataSet ds = new DataSet();
        ds = BaseClass1.GetDataSet(strsql, "username");
        if (ds.Tables["username"].Rows.Count > 0)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CustomValidator1.IsValid == true)
        {
            string strsql;
            strsql = "insert into [user] (用户名,密码) values ('" + TextBox1.Text + "','" + TextBox2.Text + "')";
            BaseClass1.execsql(strsql);
            Response.Write("<script>alert(\"注册成功！\");</script>");
            Session["name"] = TextBox1.Text;
            Response.Redirect("index.aspx");
        }

    }
}