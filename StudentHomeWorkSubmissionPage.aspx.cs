using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class StudentHomeWorkSubmissionPage : System.Web.UI.Page
{
    protected string dld, user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        user = "Hey! : " + (string)(Session["user"]);
        dld = TextBox3.Text;

        if (IsPostBack && TextBoxHWF.HasFile)
        {
            RequiredFieldValidator5.Enabled = false;
        }
        else RequiredFieldValidator5.Enabled = true;

        if(!this.IsPostBack)
        {
            Button7.Attributes.Add("onclick", "jQuery('#" + TextBoxHWF.ClientID + "').click();return false;");
            DropDownCourseN.Items.Clear();
            DropDownCourseN.Items.Add(new ListItem("Select Course"));
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string classtest = "SELECT class FROM student_in_class WHERE id='" + (string)Session["id"] +"'";
            SqlCommand com = new SqlCommand(classtest, conn);
            string Class = com.ExecuteScalar().ToString().Trim();
            string cic = "SELECT * FROM teacher_class_course";
            SqlCommand com2 = new SqlCommand(cic, conn);
            SqlDataReader oReader = com2.ExecuteReader();
            while (oReader.Read())
            {
                if (Class == oReader["class"].ToString().Trim())
                {
                    string course = oReader["course"].ToString().Trim();
                    DropDownCourseN.Items.Add(new ListItem(course));
                }
            }
            conn.Close();
        }
    }



    protected void SaveBtn(object sender, EventArgs e)
    {

        try
        {
            Guid NewGuid = Guid.NewGuid();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string hw = DropDownHWN.SelectedValue;
            string course = DropDownCourseN.SelectedValue;
            string checkhw = "SELECT hwid FROM homeworks WHERE name = '" + hw + "' AND coursename='" + course + "'";
            SqlCommand com3 = new SqlCommand(checkhw, conn);
            string hwid = com3.ExecuteScalar().ToString().Trim();

            string checksub = "SELECT count(*) from submissions WHERE hwid='" + hwid + "' AND hwname='" + hw + "' AND coursename='"+course+"'";
            SqlCommand com2 = new SqlCommand(checksub, conn);
            int temp = Convert.ToInt32(com2.ExecuteScalar().ToString());
            if (temp == 1) ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('You already submitted file to this homework');", true);
            else
            {
            string insertuser = "INSERT into submissions (sid,uid,hwid,name,submissiondate,attachments,hwname,coursename) values (@sid,@uid,@hwid,@name,@submissiondate,@attachments,@hwname,@coursename)";
            SqlCommand com = new SqlCommand(insertuser, conn);
            com.Parameters.AddWithValue("@sid", NewGuid.ToString());
            com.Parameters.AddWithValue("@uid", (string)(Session["id"]));

            
            string checkclass = "SELECT classname FROM homeworks WHERE name = '" + hw + "' AND coursename='" + course + "'";
            SqlCommand com4 = new SqlCommand(checkclass, conn);
            string Class = com4.ExecuteScalar().ToString().Trim();

            com.Parameters.AddWithValue("@hwid", hwid);
            com.Parameters.AddWithValue("@name", TextBoxHWN.Text);
            DateTime today = DateTime.Today;
            string date = today.ToString("dd/MM/yyyy");
            com.Parameters.AddWithValue("@submissiondate", date);
            com.Parameters.AddWithValue("@hwname", hw);
            com.Parameters.AddWithValue("@coursename", course);

            string directory = "~/Submissions/" + NewGuid.ToString() + "/";
            bool exists = System.IO.Directory.Exists(Server.MapPath(directory));

            if (!exists)
                System.IO.Directory.CreateDirectory(Server.MapPath(directory));

            string fileName = System.IO.Path.GetFileName(TextBoxHWF.PostedFile.FileName);
            TextBoxHWF.PostedFile.SaveAs(Server.MapPath(directory + fileName));
            string fileName2 = Server.MapPath(directory + fileName);

            com.Parameters.AddWithValue("@attachments", fileName2);
            com.ExecuteNonQuery();

            conn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('File submitted successfully!');window.location='StudentPage.aspx';", true);
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
    protected void DropDownCourseN_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownHWN.Items.Clear();
        dld = "";
        DropDownHWN.Items.Add(new ListItem("Select Homework"));
        string course = DropDownCourseN.SelectedValue.Trim();
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string cic = "SELECT * FROM homeworks";
        SqlCommand com2 = new SqlCommand(cic, conn);
        SqlDataReader oReader = com2.ExecuteReader();
        while (oReader.Read())
        {
            if (course == oReader["coursename"].ToString().Trim())
            {
                string hwname = oReader["name"].ToString().Trim();
                DropDownHWN.Items.Add(new ListItem(hwname));
            }
        }
        conn.Close();
    }
    protected void DropDownHWN_SelectedIndexChanged(object sender, EventArgs e)
    {
        string hw = DropDownHWN.SelectedValue;
        string course = DropDownCourseN.SelectedValue;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string cl = "SELECT deadlinedate FROM homeworks WHERE name = '" + hw + "' AND coursename='"+ course +"'";
        SqlCommand com3 = new SqlCommand(cl, conn);
        dld = com3.ExecuteScalar().ToString().Trim();
        conn.Close();
    }
}