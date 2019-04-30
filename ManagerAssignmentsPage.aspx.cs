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

public partial class ManagerAssignmentsPage : System.Web.UI.Page
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
        if (e.CommandName == "DeleteT")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string tid = commandArgs[0].Trim();
            string Class = commandArgs[1].Trim();
            string course = commandArgs[2].Trim();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string delete = "DELETE FROM teacher_class_course WHERE tid = '" + tid + "' AND class='" + Class + "' AND course='" + course + "'";
            SqlCommand com = new SqlCommand(delete, conn);
            com.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Assignment deleted successfully!');window.location='ManagerAssignmentsPage.aspx';", true);
        }
        else if (e.CommandName == "DeleteS")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0].Trim();
            string Class = commandArgs[1].Trim();

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string delete = "DELETE FROM student_in_class WHERE id = '" + id + "' AND class='" + Class +"'";
            SqlCommand com = new SqlCommand(delete, conn);
            com.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Assignment deleted successfully!');window.location='ManagerAssignmentsPage.aspx';", true);
        }
        else return;
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

    protected void NewAssignBtn(object sender, EventArgs e)
    {
        Response.Redirect("AddNewAssignmentPage.aspx");
    }

    
    
}