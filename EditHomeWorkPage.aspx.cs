using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
public partial class EditHomeWorkPage : System.Web.UI.Page
{
    protected string hwname,dld,hwid,attach,user;
    //List<string> items = new List<string>();
    protected void Page_Load(object sender, EventArgs e)
    {
        hwname = (string)(Session["hwname"]);
        dld = (string)(Session["dld"]);
        user = "Hey! : " + (string)(Session["user"]);
        hwid = (string)Session["hwid"];
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        if (!this.IsPostBack)
        {
            //var items = new List<string>();
            //items.Add("aa");
            attach = TextBox2.Text;      
            DropDownClassN.Items.Clear();
            DropDownCourseN.Items.Clear();
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
            DropDownClassN.ClearSelection();
            DropDownClassN.Items.FindByValue((string)(Session["class"])).Selected = true;
            DropDownClassN_SelectedIndexChanged(null, null);
            DropDownCourseN.ClearSelection();
            DropDownCourseN.Items.FindByValue((string)(Session["course"])).Selected = true;            
            Button7.Attributes.Add("onclick", "jQuery('#" + TextBoxHWF.ClientID + "').click();return false;");
            //DropDownClassN.DataSource = Items;
            //DropDownClassN.DataBind();
        }
    }

    protected void SaveBtn(object sender, EventArgs e)
    {
        try
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string updatehw = null;
            SqlCommand com = null;

            if (TextBoxHWF.HasFile)
            {
                updatehw = "UPDATE homeworks SET DeadLineDate = @deadlinedate, Attachments = @attachments, Name = @name, ClassName = @classname, CourseName = @coursename WHERE hwid = '" + (string)Session["hwid"] + "'";
                com = new SqlCommand(updatehw, conn);

                string directory = "~/Homeworks/" + (string)Session["hwid"] + "/";
                bool exists = System.IO.Directory.Exists(Server.MapPath(directory));

                if (!exists)
                    System.IO.Directory.CreateDirectory(Server.MapPath(directory));

                string fileName = System.IO.Path.GetFileName(TextBoxHWF.PostedFile.FileName);
                TextBoxHWF.PostedFile.SaveAs(Server.MapPath(directory + fileName));
                string fileName2 = Server.MapPath(directory + fileName);

                com.Parameters.AddWithValue("@attachments", fileName2);
            }
            else
            {
                updatehw = "UPDATE homeworks SET DeadLineDate = @deadlinedate, Name = @name, ClassName = @classname, CourseName = @coursename WHERE hwid = '" + (string)Session["hwid"] + "'";
                com = new SqlCommand(updatehw, conn);
            }
            com.Parameters.AddWithValue("@deadlinedate", TextBox1.Text);
            com.Parameters.AddWithValue("@name", TextBoxHWN.Text);
            com.Parameters.AddWithValue("@classname", DropDownClassN.SelectedValue);
            com.Parameters.AddWithValue("@coursename", DropDownCourseN.SelectedValue);
            com.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Homework updated successfully!');window.location='TeacherHomeWorkListPage.aspx';", true);
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }
    }

    protected void ClearBtn(object sender, EventArgs e)
    {
        Session["hwname"] = "";
        hwname = "";
        DropDownClassN.SelectedIndex = 0;
        Session["dld"] = "";
        dld = "";
        DropDownCourseN.Items.Clear();
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
    protected void DropDownClassN_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            Session["hwname"] = TextBoxHWN.Text;
            Session["dld"] = TextBox1.Text;
            hwname = TextBoxHWN.Text;
            dld = TextBox1.Text;
        }
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
            if (Class == Class2 && tid == (string)Session["id"])
            {
                DropDownCourseN.Items.Add(new ListItem(course));
            }
        }
        conn.Close();
    }
    protected void DeleteBtn(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();

        string attach = "SELECT attachments FROM homeworks WHERE hwid = '" + (string)Session["hwid"] + "'";
        SqlCommand com3 = new SqlCommand(attach, conn);
        string path = com3.ExecuteScalar().ToString().Trim();
        string newpath = Path.GetDirectoryName(path);

        string deletehw = "DELETE FROM homeworks WHERE hwid = '" + (string)Session["hwid"] + "'";
        SqlCommand com = new SqlCommand(deletehw, conn);
        com.ExecuteNonQuery();

        Directory.Delete(@newpath, true);


        string deletesub = "SELECT * FROM submissions";
        SqlCommand com2 = new SqlCommand(deletesub, conn);
        SqlDataReader oReader = com2.ExecuteReader();
        while (oReader.Read())
        {
            if (oReader["hwid"].ToString().Trim() == (string)Session["hwid"])
            {
                string subpath = Path.GetDirectoryName((oReader["attachments"].ToString().Trim()));
                Directory.Delete(@subpath, true);
            }
        }
        oReader.Close();


        string deletes = "DELETE FROM submissions WHERE hwid = '" + (string)Session["hwid"] + "'";
        SqlCommand com4 = new SqlCommand(deletes, conn);
        com4.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Homework deleted successfully!');window.location='TeacherPage.aspx';", true);

        
    }
    protected void DownloadFileBtn(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string filePath = "SELECT attachments FROM homeworks WHERE hwid='" + (string)Session["hwid"] +"'";
        SqlCommand com = new SqlCommand(filePath, conn);
        string path = com.ExecuteScalar().ToString().Trim();
        conn.Close();

        FileInfo file = new FileInfo(path);
        Response.Clear();
        Response.ClearHeaders();
        Response.ClearContent();
        Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
        Response.AddHeader("Content-Length", file.Length.ToString());
        Response.ContentType = "text/plain";
        Response.Flush();
        Response.TransmitFile(file.FullName);
        Response.End();
    }
}