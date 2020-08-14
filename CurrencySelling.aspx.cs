using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace webMoneyExchange
{
    public partial class CurrencySelling : System.Web.UI.Page
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

        protected void btnMultiple_Click(object sender, EventArgs e)
        {
            float Multiple = float.Parse(lblER.Text) * Int32.Parse(txtUnit.Text);
            lblTA.Text = Convert.ToString(Multiple);
        }

        protected void btnSubmit_Click1(object sender, EventArgs e)
        {
            float aBalance = float.Parse(lblTA.Text) + float.Parse(lblBalance.Text);

            string transactiontype = "CurrencySelling";
            System.Data.SqlClient.SqlConnection sqlConnection1 =
     new System.Data.SqlClient.SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\18009054\Documents\dbMoneyExchange.mdf; Integrated Security = True; Connect Timeout = 30");

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT tblTransactions (Currency, ExchangeRate, Unit, AccountId, TransactionDate, TransactionType) VALUES ('" + txtCurrency.SelectedItem.Text + "' ,'" + lblER.Text + "' , '" + txtUnit.Text + "'  , '" + txtAccountId.SelectedItem.Text + "' , '" + DateTime.Today + "', '" + transactiontype.ToString() + "')";
            lblText.Text = cmd.CommandText;
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
            lblSuccess.Visible = true;
        }

        protected void txtAccountId_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblBalance.Text = txtAccountId.SelectedValue;
        }

        protected void txtCurrency_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblER.Text = txtCurrency.SelectedValue;
        }
    }
}