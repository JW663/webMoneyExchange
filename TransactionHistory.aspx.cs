using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace webMoneyExchange
{
    public partial class TransactionHistory : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            lb1.Text = "<b><font color=Brown>" + "WELCOME USER:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";
            string username = Session["UserName"].ToString();

            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\18009054\Documents\dbMoneyExchange.mdf;Integrated Security=True;Connect Timeout=30";

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();

                
                SqlDataAdapter sqlData = new SqlDataAdapter("SELECT tblTransactions.Id, tblTransactions.TransactionType, tblTransactions.TransactionDate, tblTransactions.Currency, tblTransactions.ExchangeRate, tblTransactions.Unit, tblTransactions.MoneyAmount, tblTransactions.AccountId FROM((tblTransactions INNER JOIN tblAccounts ON tblAccounts.AccountId = tblTransactions.AccountId) INNER JOIN tblUser ON tblUser.UserName = tblAccounts.UserName) WHERE tblAccounts.UserName='" + username.ToString() + "'", sqlCon);
                DataTable dtbl = new DataTable();

                sqlData.Fill(dtbl);
                history.DataSource = dtbl;
                history.DataBind();


            }
            
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
}