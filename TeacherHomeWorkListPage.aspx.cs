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

public partial class TeacherHomeWorkListPage : System.Web.UI.Page
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
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("ID"),new DataColumn("Homework ID"), new DataColumn("Homework Name"), new DataColumn("Deadline Date"), new DataColumn("Class"), new DataColumn("Course") });
            conn.Open();

            string hws = "SELECT * FROM homeworks";
            SqlCommand com2 = new SqlCommand(hws, conn);
            SqlDataReader oReader = com2.ExecuteReader();
            while (oReader.Read())
            {
                if ((string)(Session["id"]) == oReader["tid"].ToString().Trim())
                {
                    string id = oReader["hwid"].ToString();
                    string name = oReader["name"].ToString();
                    string deadlinedate = oReader["deadlinedate"].ToString();
                    string classname = oReader["classname"].ToString();
                    string coursename = oReader["coursename"].ToString();
                    dt.Rows.Add(i, id,name, deadlinedate, classname, coursename);
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
                GridViewRow row2 = this.GridView1.Rows[row.RowIndex];
                Session["hwid"] = GridView1.DataKeys[row.RowIndex].Value.ToString().Trim();
                Session["dld"] = row2.Cells[2].Text.Trim();
                Session["class"] = row2.Cells[3].Text.Trim();
                Response.Redirect("SubmissionListPage.aspx");
            }
        }
    }

    protected void GridView1_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName != "Edit") return;
        string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
        Session["hwid"] = commandArgs[0].Trim();
        Session["hwname"] = commandArgs[1].Trim();
        Session["dld"] = commandArgs[2].Trim();
        Session["class"] = commandArgs[3].Trim();
        Session["course"] = commandArgs[4].Trim();

        Response.Redirect("EditHomeWorkPage.aspx");

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("LoginPage.aspx");
    }

}