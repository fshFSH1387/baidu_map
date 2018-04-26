using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 初始化页面
        Panel1.Visible = false;
        Panel2.Visible = false;
        if (Session["name"] != null)
        {
            Panel2.Visible = true;
            UserName.Text = "<b>" + Session["name"].ToString() + "</b>";
        }
        else
        {
            Panel1.Visible = true;
        }
    }
}