using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace webMoneyExchange
{
    public partial class Deposit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lb1.Text = "<b><font color=Brown>" + "WELCOME USER:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //float depositamt = float.Parse(txtDepositAmt.Text);
            //float Balance = float.Parse(OldBalance.Text);
            //NewBalance.Text = float.Parse(Balance) + depositamt;

            float aBalance = float.Parse(txtDepositAmt.Text) + float.Parse(OldBalance.Text);
            string TransactionType = "Deposit";

            


            System.Data.SqlClient.SqlConnection sqlConnection1 =
    new System.Data.SqlClient.SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\18009054\Documents\dbMoneyExchange.mdf; Integrated Security = True; Connect Timeout = 30");

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT tblTransactions (TransactionType, TransactionDate, MoneyAmount, AccountId) VALUES ('" + TransactionType.ToString() + "', '" + DateTime.Today + "', '" + txtDepositAmt.Text + "', '" + txtAccountId.SelectedItem.Text + "')";
            lblTxt.Text = cmd.CommandText;
            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();
            cmd.ExecuteNonQuery();
            sqlConnection1.Close();

            cmd.CommandText = "UPDATE tblAccounts Set Balance=" + aBalance + " where AccountId = " + txtAccountId.SelectedItem.Text;
           
            lblText.Text = cmd.CommandText;
            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();
            cmd.ExecuteNonQuery();
            sqlConnection1.Close();

            NewBalance.Text = aBalance.ToString();

            lblSuccess.Visible = true;
        }



        protected void txtAccountId_SelectedIndexChanged(object sender, EventArgs e)
        {
            OldBalance.Text = txtAccountId.SelectedValue;
        }
    }
}