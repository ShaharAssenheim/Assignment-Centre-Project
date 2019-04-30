using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class LoginPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["user"] = "";
    }
    protected void LogInButton(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string checkuser = "SELECT count(*) from UserData WHERE username='" + UserName.Text + "'";
        SqlCommand com = new SqlCommand(checkuser, conn);
        int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
        conn.Close();
        if (temp == 1)
        {
            conn.Open();
            string checkpass = "SELECT password from UserData WHERE username='" + UserName.Text + "'";
            string checkrole = "SELECT role from UserData WHERE username='" + UserName.Text + "'";
            SqlCommand com2 = new SqlCommand(checkpass, conn);
            string password = com2.ExecuteScalar().ToString().Trim();
            SqlCommand com3 = new SqlCommand(checkrole, conn);
            string role = com3.ExecuteScalar().ToString().Trim();
            conn.Close();
            if (password == PassTB.Text)
            {
                conn.Open();
                string id = "SELECT id from UserData WHERE username='" + UserName.Text + "'";
                SqlCommand com4 = new SqlCommand(id, conn);
                Session["id"] = com4.ExecuteScalar().ToString().Replace(" ", "");
                conn.Close();
                Session["user"] = UserName.Text;
                Session["role"] = role;
                if (role == "Student") Response.Redirect("StudentPage.aspx");
                else if (role == "Teacher") Response.Redirect("TeacherPage.aspx");
                else Response.Redirect("ManagerPage.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Password Incorrect');", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User Name does not exist');", true);
        }
    }
}
