using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddUserPage : System.Web.UI.Page
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

            string checkuserid = "SELECT count(*) from UserData WHERE username='" + TextBoxUN.Text + "'";
            SqlCommand com1 = new SqlCommand(checkuserid, conn);
            int temp = Convert.ToInt32(com1.ExecuteScalar().ToString());

            string checkusername = "SELECT count(*) from UserData WHERE id='" + TextBoxID.Text + "'";
            SqlCommand com2 = new SqlCommand(checkusername, conn);
            int temp2 = Convert.ToInt32(com2.ExecuteScalar().ToString());
            if (Request.Form["DropDownListRole"].Trim() == "Select Role") Label1.Visible = true;
            else if (temp == 1 && temp2 == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User id and user name already exist');", true);
            else if (temp == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('user name already exist');", true);
            else if (temp2 == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User id already exist');", true);

            else
            {
                Label1.Visible = false;
                string insertuser = "INSERT into UserData (id,username,password,role) values (@id,@username,@password,@role)";
                SqlCommand com = new SqlCommand(insertuser, conn);
                com.Parameters.AddWithValue("@id", TextBoxID.Text);
                com.Parameters.AddWithValue("@username", TextBoxUN.Text);
                com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                com.Parameters.AddWithValue("@role", Request.Form["DropDownListRole"]);
                com.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User added successfully!');window.location='ManagersUsersPage.aspx';", true);
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