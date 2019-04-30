using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class HomeWorkPageStd : System.Web.UI.Page
{
    protected string hwname, dld, Class, course, grade,sname,sdate,user;
    protected void Page_Load(object sender, EventArgs e)
    {
        int flag = 0;
        user = "Hey! : " + (string)(Session["user"]);
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        if(!this.IsPostBack)
        {
            hwname = (string)Session["hwname"];
            dld = (string)Session["dld"];
            Class = (string)Session["class"];
            course = (string)Session["course"];
            grade = (string)Session["grade"].ToString().Trim();
            if((string)Session["sdate"]!="")
            {
                sname = (string)Session["sname"];
                sdate = (string)Session["sdate"];
                Button8.Enabled = true;
                flag++;
            }
            if ((string)Session["role"] == "Student")
            {
                TextBox9.ReadOnly = true;
              
                TextBox9.BackColor=System.Drawing.Color.Transparent;
                flag++;
            }
            else 
            { 
                TextBox9.BackColor = System.Drawing.Color.Silver; 
            }
           
            if (flag == 2)   Button1.Visible = true;
            
        }
        else
        {
            grade = TextBox9.Text;
            
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }
    protected void DownloadHWBtn(object sender, EventArgs e)
    {
        string filePath = (string)Session["dpath"];
        FileInfo file = new FileInfo(filePath);
        Response.Clear();
        Response.ClearHeaders();
        Response.ClearContent();
        Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
        double x = file.Length;
        Response.AddHeader("Content-Length", file.Length.ToString());
        Response.ContentType = "text/plain";
        Response.Flush();
        Response.TransmitFile(file.FullName);
        Response.End();
    }
    protected void DownloadSubBtn(object sender, EventArgs e)
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
   
    protected void EditSubmissionBtn(object sender, EventArgs e)
    {
        Response.Redirect("EditSubmissionPage.aspx");
    }
   protected void check_Role(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string checkrole = "SELECT role from UserData WHERE username='" + (string)Session["user"] + "'";
        SqlCommand com2 = new SqlCommand(checkrole, conn);
       string role = com2.ExecuteScalar().ToString().Trim();
       conn.Close();
       if (role == "Teacher") Response.Redirect("StudentPage.aspx");
      else
          Response.Redirect("StudentPage.aspx");
       
       
    }
    
}