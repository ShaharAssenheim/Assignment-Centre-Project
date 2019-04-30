using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StudentPage : System.Web.UI.Page
{
    protected string user;
    protected void LogOutButton(object sender, EventArgs e)
    {

        Response.Redirect("LoginPage.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if((string)Session["user"]=="")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        else user = "Hey!  "+(string)(Session["user"]);
    }
   
}