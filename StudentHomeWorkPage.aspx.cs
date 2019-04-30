using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class StudentHomeWorkPage : System.Web.UI.Page
{
    protected string user;
    protected void Page_Load(object sender, EventArgs e)
    {
        string user2 = (string)Session["user"];
        if (user2 == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        if(!this.IsPostBack)
        {
            user = "Hey! : " + (string)(Session["user"]);
        }
        if (!this.IsPostBack)
        {
            int i = 1;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("ID"), new DataColumn("Homework ID"), new DataColumn("Homework Name"), new DataColumn("Deadline Date"), new DataColumn("Class"), new DataColumn("Course") });
            conn.Open();

            string cl = "SELECT class FROM student_in_class WHERE id = '"+ (string)Session["id"] +"'";
            SqlCommand com3 = new SqlCommand(cl, conn);
            string Class = com3.ExecuteScalar().ToString().Trim();

            string hws = "SELECT * FROM homeworks";
            SqlCommand com2 = new SqlCommand(hws, conn);
            SqlDataReader oReader = com2.ExecuteReader();
            while (oReader.Read())
            {
                if (Class == oReader["classname"].ToString().Trim())
                {
                    string id = oReader["hwid"].ToString();
                    string name = oReader["name"].ToString();
                    string deadlinedate = oReader["deadlinedate"].ToString();
                    string classname = oReader["classname"].ToString();
                    string coursename = oReader["coursename"].ToString();
                    dt.Rows.Add(i, id, name, deadlinedate, classname, coursename);
                    i++;
                }
            }
            conn.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }


    protected void OnRowHover(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowIndex == GridView1.SelectedIndex)
            {
                GridViewRow row2 = this.GridView1.Rows[row.RowIndex];
                Session["hwid"] = GridView1.DataKeys[row.RowIndex].Value.ToString().Trim();
                Session["dld"] = row2.Cells[2].Text.Trim();
                Session["class"] = row2.Cells[3].Text.Trim();
                Session["hwname"] = row2.Cells[1].Text;
                Session["course"] = row2.Cells[4].Text;
                Session["grade"] = "";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string attach = "SELECT attachments from homeworks WHERE hwid='" + (string)Session["hwid"] + "'";
                SqlCommand com5 = new SqlCommand(attach, conn);
                Session["dpath"] = com5.ExecuteScalar().ToString().Trim();

                string check = "SELECT count(*) from submissions WHERE uid='" + (string)Session["id"] + "' AND hwid='"+ (string)Session["hwid"] +"'";
                SqlCommand com = new SqlCommand(check, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                conn.Close();
                if (temp == 1)
                {
                    conn.Open();
                    string snamecheck = "SELECT name from submissions WHERE uid='" + (string)Session["id"] + "' AND hwid='" + (string)Session["hwid"] + "'";
                    string sdatecheck = "SELECT submissiondate from submissions WHERE uid='" + (string)Session["id"] + "' AND hwid='" + (string)Session["hwid"] + "'";
                    string gradecheck = "SELECT grade from submissions WHERE uid='" + (string)Session["id"] + "' AND hwid='" + (string)Session["hwid"] + "'";
                    string attachcheck = "SELECT attachments from submissions WHERE uid='" + (string)Session["id"] + "' AND hwid='" + (string)Session["hwid"] + "'";


                    SqlCommand com2 = new SqlCommand(snamecheck, conn);
                    Session["sname"] = com2.ExecuteScalar().ToString().Trim();
                    SqlCommand com3 = new SqlCommand(sdatecheck, conn);
                    Session["sdate"] = com3.ExecuteScalar().ToString().Trim();
                    SqlCommand com4 = new SqlCommand(gradecheck, conn);
                    Session["grade"] = com4.ExecuteScalar().ToString().Trim();
                    SqlCommand com6 = new SqlCommand(attachcheck, conn);
                    Session["spath"] = com6.ExecuteScalar().ToString().Trim();
                    conn.Close();
                }
                else
                {
                    Session["sname"] = "";
                    Session["sdate"] = "";
                    Session["grade"] = "";
                }


                Response.Redirect("HomeWorkPageStd.aspx");
            }
        }
    }

    protected void LogOutButton(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

}