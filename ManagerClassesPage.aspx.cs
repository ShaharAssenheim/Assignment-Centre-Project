using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ManagerClassesPage : System.Web.UI.Page
{
    protected string user;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = "Hey! : " + (string)(Session["user"]);
        string user2 = (string)Session["user"];
        if (user2 == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }

    }

    protected void GridView_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "DeleteC") return;
        string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
        string name = commandArgs[0].Trim();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string delete = "DELETE FROM classes WHERE name = '" + name + "'";
        SqlCommand com = new SqlCommand(delete, conn);
        com.ExecuteNonQuery();

        string deletes = "DELETE FROM student_in_class WHERE class = '" + name + "'";
        SqlCommand com2 = new SqlCommand(deletes, conn);
        com2.ExecuteNonQuery();

        string deletet = "DELETE FROM teacher_class_course WHERE class = '" + name + "'";
        SqlCommand com3 = new SqlCommand(deletet, conn);
        com3.ExecuteNonQuery();

        string deleteh = "DELETE FROM homeworks WHERE classname = '" + name + "'";
        SqlCommand com4 = new SqlCommand(deleteh, conn);
        com4.ExecuteNonQuery();

        conn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Class deleted successfully!');window.location='ManagerClassesPage.aspx';", true);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

    protected void AddClassBtn(object sender, EventArgs e)
    {
        Response.Redirect("AddNewClassPage.aspx");
    }

   
    
}