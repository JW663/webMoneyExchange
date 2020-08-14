using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace webMoneyExchange
{
    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lb1.Text = "<b><font color=Brown>" + "WELCOME USER:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";

            string username = Session["UserName"].ToString();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\18009054\Documents\dbMoneyExchange.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                SqlDataAdapter sqlData = new SqlDataAdapter("SELECT tblAccounts.AccountId,tblAccounts.UserName, tblAccounts.Balance FROM   tblAccounts WHERE tblAccounts.UserName = '" + username.ToString() + "'", sqlCon);
                DataTable dtbl = new DataTable();

                sqlData.Fill(dtbl);
                accounts.DataSource = dtbl;
                accounts.DataBind();

                SqlDataAdapter data = new SqlDataAdapter("SELECT tblTransactions.Id FROM tblTransactions RIGHT JOIN tblAccounts ON tblTransactions.AccountId = tblAccounts.AccountId WHERE tblAccounts.UserName = '" + username.ToString() + "'", sqlCon);
                DataTable data1 = new DataTable();

                data.Fill(data1);
                transaction.DataSource = data1;
                transaction.DataBind();

            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
}