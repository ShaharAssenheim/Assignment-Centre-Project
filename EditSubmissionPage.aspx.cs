using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class EditSubmissionPage : System.Web.UI.Page
{
    protected string hwname,user,subname,course,dld,attach;
    protected void Page_Load(object sender, EventArgs e)
    {
        hwname = (string)Session["hwname"];
        course = (string)Session["course"];
        dld = (string)Session["dld"];
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        if (!this.IsPostBack)
        {
            user = "Hey! : " + (string)(Session["user"]);
            subname = (string)Session["sname"];
            
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string checkid = "SELECT sid from submissions WHERE hwid='"+Session["hwid"] +"' AND uid='" + (string)(Session["id"]) + "' AND name='"+(string)Session["sname"]+"' AND coursename='"+(string)Session["course"]+"'";
            SqlCommand com = new SqlCommand(checkid, conn);
            Session["sid"] = com.ExecuteScalar().ToString().Trim();
            conn.Close();
            Button7.Attributes.Add("onclick", "jQuery('#" + TextBoxHWF.ClientID + "').click();return false;");

        }
    }
    protected void DownloadBtn(object sender, EventArgs e)
    {
        string filePath = (string)Session["spath"];
        FileInfo file = new FileInfo(filePath);
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

    protected void SaveBtn(object sender, EventArgs e)
    {
        try{
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();
            string updatehw = null;
            SqlCommand com = null;

            if (TextBoxHWF.HasFile)
            {
                updatehw = "UPDATE submissions SET Submissiondate = @submissiondate, Attachments = @attachments, Name = @name WHERE sid = '" + (string)Session["sid"] + "'";
                com = new SqlCommand(updatehw, conn);

                string directory = "~/Submissions/" + (string)Session["sid"] + "/";
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
                updatehw = "UPDATE submissions SET Submissiondate = @submissiondate, Name = @name WHERE sid = '" + (string)Session["sid"] + "'";
                com = new SqlCommand(updatehw, conn);
            }
            com.Parameters.AddWithValue("@name", TextBoxSN.Text);
            DateTime today = DateTime.Today;
            string date = today.ToString("dd/MM/yyyy");
            com.Parameters.AddWithValue("@submissiondate", date);
            com.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Submission updated successfully!');window.location='StudentPage.aspx';", true);
        }
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }
    }
    protected void DeleteSubBtn(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();

        string attach = "SELECT attachments FROM submissions WHERE sid = '" + (string)Session["sid"] + "'";
        SqlCommand com3 = new SqlCommand(attach, conn);
        string path = com3.ExecuteScalar().ToString().Trim();
        string newpath = Path.GetDirectoryName(path);

        string deletehw = "DELETE FROM submissions WHERE sid = '" + (string)Session["sid"] + "'";
        SqlCommand com = new SqlCommand(deletehw, conn);
        com.ExecuteNonQuery();

        Directory.Delete(@newpath, true);

        conn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Submission deleted successfully!');window.location='StudentPage.aspx';", true);


    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("StudentPage.aspx");
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
    
}