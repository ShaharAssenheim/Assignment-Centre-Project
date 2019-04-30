using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Collections;

public partial class UploadNewHomeWorkPage : System.Web.UI.Page
{
    protected string user,attach;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        if (IsPostBack && TextBoxHWF.HasFile)
        {
            RequiredFieldValidator5.Enabled = false;
        }
        else RequiredFieldValidator5.Enabled = true;
        Button7.Attributes.Add("onclick", "jQuery('#" + TextBoxHWF.ClientID + "').click();return false;");

        user = "Hey! : " + (string)(Session["user"]);

        if(!this.IsPostBack)
        {
            DropDownClassN.Items.Clear();
            DropDownClassN.Items.Add(new ListItem("Select Class"));
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string Class = "SELECT * FROM teacher_class_course";
            SqlCommand com2 = new SqlCommand(Class, conn);
            SqlDataReader oReader = com2.ExecuteReader();
            while (oReader.Read())
            {
                if ((string)Session["id"] == oReader["tid"].ToString().Trim())
                {
                    string Class2 = oReader["class"].ToString().Trim();
                    if (!DropDownClassN.Items.Contains(new ListItem(Class2)))
                        DropDownClassN.Items.Add(new ListItem(Class2));
                }
            }
            

            conn.Close();
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("MainTeacher.aspx");
    }

    protected void SaveBtn(object sender, EventArgs e)
    {

        try
        {
            Guid NewGuid = Guid.NewGuid();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkhw = "SELECT count(*) from homeworks WHERE name='" + TextBoxHWN.Text + "' AND classname='" + DropDownClassN.SelectedValue.Trim() + "' AND coursename='" + DropDownCourseN.SelectedValue.Trim()+ "'";
            SqlCommand com2 = new SqlCommand(checkhw, conn);
            int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
            if (temp == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Homework already exist for these class and course');", true);
            else
            {
            string insertuser = "INSERT into homeworks (hwid,tid,name,deadlinedate,attachments,classname,coursename) values (@hwid,@tid,@name,@deadlinedate,@attachments,@classname,@coursename)";
            SqlCommand com = new SqlCommand(insertuser, conn);
            com.Parameters.AddWithValue("@hwid", NewGuid.ToString());
            com.Parameters.AddWithValue("@tid", (string)(Session["id"]));
            com.Parameters.AddWithValue("@name", TextBoxHWN.Text);
            com.Parameters.AddWithValue("@deadlinedate", TextBox1.Text);

            string directory = "~/Homeworks/" + NewGuid.ToString() + "/";
            bool exists = System.IO.Directory.Exists(Server.MapPath(directory));

            if (!exists)
                System.IO.Directory.CreateDirectory(Server.MapPath(directory));

            string fileName = System.IO.Path.GetFileName(TextBoxHWF.PostedFile.FileName);
            TextBoxHWF.PostedFile.SaveAs(Server.MapPath(directory + fileName));
            string fileName2 = Server.MapPath(directory + fileName);

            com.Parameters.AddWithValue("@attachments", fileName2);
            com.Parameters.AddWithValue("@classname", DropDownClassN.SelectedValue);
            com.Parameters.AddWithValue("@coursename", DropDownCourseN.SelectedValue);
            com.ExecuteNonQuery();

            conn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Homework uploaded successfully!');window.location='TeacherPage.aspx';", true);
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
    protected void DropDownClassN_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownCourseN.Items.Clear();
        DropDownCourseN.Items.Add(new ListItem("Select Course"));
        string Class = DropDownClassN.SelectedValue.Trim();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string cic = "SELECT * FROM teacher_class_course";
        SqlCommand com2 = new SqlCommand(cic, conn);
        SqlDataReader oReader = com2.ExecuteReader();
        while (oReader.Read())
        {
            string Class2 = oReader["class"].ToString().Trim();
            string course = oReader["course"].ToString().Trim();
            string tid = oReader["tid"].ToString().Trim();
            if (Class == Class2 && tid==(string)Session["id"])
            {
                DropDownCourseN.Items.Add(new ListItem(course));
            }
        }
        conn.Close();
    }
}