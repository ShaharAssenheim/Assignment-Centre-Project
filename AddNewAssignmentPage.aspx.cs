using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class AddNewAssignmentPage : System.Web.UI.Page
{
    protected string user,role;
    protected void Page_Load(object sender, EventArgs e)
    {
        role = (string)Session["role"];
        if (!this.IsPostBack)
        {
            role = "";
            DropDownListID.DataSource = SqlDataSource1;
            DropDownListID.DataBind();
            DropDownListID.Items.Add(new ListItem("Select ID"));
            DropDownListID.ClearSelection();
            DropDownListID.Items.FindByValue("Select ID").Selected = true;

            DropDownListClass.DataSource = SqlDataSource2;
            DropDownListClass.DataBind();
            DropDownListClass.Items.Add(new ListItem("Select Class"));
            DropDownListClass.ClearSelection();
            DropDownListClass.Items.FindByValue("Select Class").Selected = true;

            DropDownListCourse.DataSource = SqlDataSource3;
            DropDownListCourse.DataBind();
            DropDownListCourse.Items.Add(new ListItem("Select Course"));
            DropDownListCourse.ClearSelection();
            DropDownListCourse.Items.FindByValue("Select Course").Selected = true;
        }
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        user = "Hey! : " + (string)(Session["user"]);
    }
    protected void DropDownListID_SelectedIndexChanged(object sender, EventArgs e)
    {
        string id = DropDownListID.SelectedValue;
        string role2;
        if (id == "Select ID")
        {
            role = "";
            DropDownListCourse.Visible = false;
            course.Visible = false;
            DropDownListClass.ClearSelection();
            DropDownListClass.Items.FindByValue("Select Class").Selected = true;
            DropDownListCourse.ClearSelection();
            DropDownListCourse.Items.FindByValue("Select Course").Selected = true;
        }
        else
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string uname = "SELECT role FROM UserData WHERE id = '" + id + "'";
            SqlCommand com = new SqlCommand(uname, conn);
            role2 = com.ExecuteScalar().ToString().Trim();
            role = role2;
            Session["role"] = role2;
            conn.Close();
            if (role2 == "Teacher")
            {
                DropDownListCourse.Visible = true;
                RequiredFieldValidator4.Enabled = true;
                course.Visible = true;
            }
            else
            {
                DropDownListCourse.Visible = false;
                RequiredFieldValidator4.Enabled = false;
                course.Visible = false;
            }
        }
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

    protected void SaveBtn(object sender, EventArgs e)
    {
        string role2 = (string)Session["role"];
        if(role2=="Student")
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkuserid = "SELECT count(*) from student_in_class WHERE id='" + DropDownListID.SelectedValue.Trim() + "'";
            SqlCommand com1 = new SqlCommand(checkuserid, conn);
            int temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
            if (temp == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Student already in class');", true);
            else
            {
                string insertuser = "INSERT into student_in_class (id,class) values (@id,@class)";
                SqlCommand com = new SqlCommand(insertuser, conn);
                com.Parameters.AddWithValue("@id", DropDownListID.SelectedValue.Trim());
                com.Parameters.AddWithValue("@class", DropDownListClass.SelectedValue.Trim());
                com.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Student assigned to class successfully!');window.location='ManagerAssignmentsPage.aspx';", true);
            }
        }
        else if(role2=="Teacher")
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkuserid = "SELECT count(*) from teacher_class_course WHERE tid='" + DropDownListID.SelectedValue.Trim() + "' AND class='" + DropDownListClass.SelectedValue.Trim() + "' AND course='" + DropDownListCourse.SelectedValue.Trim() + "'";
            SqlCommand com1 = new SqlCommand(checkuserid, conn);
            int temp = Convert.ToInt32(com1.ExecuteScalar().ToString());
            if (temp == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Assignment already exist');", true);
            else
            {
                string insertuser = "INSERT into teacher_class_course (tid,class,course) values (@tid,@class,@course)";
                SqlCommand com = new SqlCommand(insertuser, conn);
                com.Parameters.AddWithValue("@tid", DropDownListID.SelectedValue.Trim());
                com.Parameters.AddWithValue("@class", DropDownListClass.SelectedValue.Trim());
                com.Parameters.AddWithValue("@course", DropDownListCourse.SelectedValue.Trim());
                com.ExecuteNonQuery();
                conn.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Teacher assigned to class and course successfully!');window.location='ManagerAssignmentsPage.aspx';", true);
            }
        }
    }
}