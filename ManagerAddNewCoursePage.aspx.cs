using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class ManagerAddNewCoursePage : System.Web.UI.Page
{
    protected string user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        user = "Hey! : " + (string)(Session["user"]);
    }

    protected void SaveBtn(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string checkcourse = "SELECT count(*) from courses WHERE name='" + TextBoxCourse.Text + "'";
            SqlCommand com1 = new SqlCommand(checkcourse, conn);
            int temp = Convert.ToInt32(com1.ExecuteScalar().ToString());

            if (temp == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Course name already exist');", true);

            else
            {
                string insertuser = "INSERT into courses (name) values (@name)";
                SqlCommand com = new SqlCommand(insertuser, conn);
                com.Parameters.AddWithValue("@name", TextBoxCourse.Text);
                com.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Course added successfully!');window.location='ManagerCoursesPage.aspx';", true);
            }
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }
    }
    
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

}