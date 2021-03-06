﻿using System;
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

public partial class ManagersUsersPage : System.Web.UI.Page
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
        if (e.CommandName == "DeleteU")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            string id = commandArgs[0].Trim();
            string user = commandArgs[1].Trim();
            if (user == "admin") ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('The user -admin- can not be deleted');", true);
            else if (String.Equals(user, (string)Session["user"], StringComparison.OrdinalIgnoreCase)) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('The logged in user can not be deleted');", true);
            else
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string delete = "DELETE FROM UserData WHERE id = '" + id + "'";
                SqlCommand com = new SqlCommand(delete, conn);
                com.ExecuteNonQuery();

                string deletes = "DELETE FROM student_in_class WHERE id = '" + id + "'";
                SqlCommand com2 = new SqlCommand(deletes, conn);
                com2.ExecuteNonQuery();

                string deletet = "DELETE FROM teacher_class_course WHERE tid = '" + id + "'";
                SqlCommand com3 = new SqlCommand(deletet, conn);
                com3.ExecuteNonQuery();

                string deleteh = "DELETE FROM homeworks WHERE tid = '" + id + "'";
                SqlCommand com4 = new SqlCommand(deleteh, conn);
                com4.ExecuteNonQuery();

                string deletesub = "DELETE FROM submissions WHERE uid = '" + id + "'";
                SqlCommand com5 = new SqlCommand(deletesub, conn);
                com5.ExecuteNonQuery();

                conn.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User deleted successfully!');window.location='ManagersUsersPage.aspx';", true);
            }
        }
        else if(e.CommandName == "Edit")
        {
            string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
            Session["uid"] = commandArgs[0].Trim();
            Session["uname"] = commandArgs[1].Trim();
            Session["pass"] = commandArgs[2].Trim();
            Session["role"] = commandArgs[3].Trim();
            Response.Redirect("ManagerEditUserDetails.aspx");
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

    protected void AddUserBtn(object sender, EventArgs e)
    {
        Response.Redirect("AddUserPage.aspx");
    }
   
}