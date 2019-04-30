using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class ManagerEditUserDetails : System.Web.UI.Page
{
    static int flag = 0;
    protected string user,id,un,pass,role;
    protected void Page_Load(object sender, EventArgs e)
    {
        user = "Hey! : " + (string)Session["user"];
        role = (string)Session["role"];
        id = (string)Session["uid"];
        un = (string)Session["uname"];
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        if (!this.IsPostBack)
        {
            pass = (string)Session["pass"];
            if("admin"==(string)Session["uname"])
            {
                TextBoxUN.ReadOnly = true;
            }
            if (String.Equals(un.Trim(), (string)Session["user"], StringComparison.OrdinalIgnoreCase))
                flag = 1;
        }
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
            conn.Close();
            string uname = TextBoxUN.Text;
            if (temp == 1 && (string)Session["uname"]!=uname) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('user name already exist');", true);
            else
            {
                conn.Open();
                string updateuser = "UPDATE UserData SET Username = @username, Password = @password WHERE id = '" + id.Trim() + "'";
                SqlCommand com = new SqlCommand(updateuser, conn);
                com.Parameters.AddWithValue("@username", TextBoxUN.Text);
                com.Parameters.AddWithValue("@password", TextBoxPass.Text);
                com.ExecuteNonQuery();
                conn.Close();
               
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('User updated successfully!');window.location='ManagersUsersPage.aspx';", true);
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
    protected void ClearBtn(object sender, EventArgs e)
    {
        if(TextBoxUN.ReadOnly == false )un = "";
        pass = "";
    }
}