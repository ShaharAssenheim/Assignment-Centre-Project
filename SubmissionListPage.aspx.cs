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
public partial class SubmissionListPage : System.Web.UI.Page
{
    protected string user;
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["user"] == "")
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "alert", "alert('Please log in first');window.location='LoginPage.aspx';", true);
        }
        user = "Hey! : " + (string)(Session["user"]);
        if (!this.IsPostBack)
        {
            int i = 1;
            DataTable dt = new DataTable();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            dt.Columns.AddRange(new DataColumn[8] { new DataColumn("ID"), new DataColumn("Student ID"), new DataColumn("Submission Name"), new DataColumn("Homework Name"), new DataColumn("Submission Date"), new DataColumn("Course"), new DataColumn("Grade"), new DataColumn("Submission ID") });
            conn.Open();

            string hws = "SELECT * FROM submissions";
            SqlCommand com2 = new SqlCommand(hws, conn);
            SqlDataReader oReader = com2.ExecuteReader();
            while (oReader.Read())
            {
                if ((string)(Session["hwid"]) == oReader["hwid"].ToString().Trim())
                {
                    string sid = oReader["sid"].ToString();
                    string uid = oReader["uid"].ToString();
                    string sname = oReader["name"].ToString();
                    string hwname = oReader["hwname"].ToString();
                    string sdate = oReader["submissiondate"].ToString();
                    string coursename = oReader["coursename"].ToString();
                    string grade = oReader["grade"].ToString();
                    dt.Rows.Add(i, uid, sname, hwname, sdate, coursename, grade, sid);
                    i++;
                }
               
            }
            conn.Close();
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }


    protected void OnRowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
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
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                GridViewRow row2 = this.GridView1.Rows[row.RowIndex];
                conn.Open();
                string attach = "SELECT attachments from homeworks WHERE hwid='" + (string)Session["hwid"] + "'";
                SqlCommand com2 = new SqlCommand(attach, conn);
                Session["dpath"] = com2.ExecuteScalar().ToString().Trim();

                string sid = GridView1.DataKeys[row.RowIndex].Values[0].ToString();
                string attach2 = "SELECT attachments from submissions WHERE sid='" + sid + "'";
                SqlCommand com3 = new SqlCommand(attach2, conn);
                Session["spath"] = com3.ExecuteScalar().ToString().Trim();
                Session["sid"] = sid;
                conn.Close();
                Session["hwname"] = row2.Cells[2].Text;
                Session["sname"] = row2.Cells[1].Text;
                Session["sdate"] = row2.Cells[3].Text;
                Session["course"] = row2.Cells[4].Text;
                Session["grade"] = GridView1.DataKeys[row.RowIndex].Values[1].ToString();
                Response.Redirect("HomeWorkPage.aspx");
            }
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

}