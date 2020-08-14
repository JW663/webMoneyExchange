using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Web.Http.Routing.Constraints;
using System.Web.Http.Results;

namespace webMoneyExchange
{
    public partial class CurrencyBuying : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            
            lblSucessMessage.Visible = false;
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lb1.Text = "<b><font color=Brown>" + "WELCOME USER:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string TransactionType = "CurrencyBuying";


            

            float TotalAmount = float.Parse(lblTA.Text);
            float Balance = float.Parse(lblBalance.Text);
            float aBalance = Balance - TotalAmount;

            if (TotalAmount < Balance)
            {
                System.Data.SqlClient.SqlConnection sqlConnection1 =
   new System.Data.SqlClient.SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\18009054\Documents\dbMoneyExchange.mdf; Integrated Security = True; Connect Timeout = 30");

                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "INSERT tblTransactions (Currency, ExchangeRate, Unit, TransactionType, TransactionDate, AccountId) VALUES ('" + txtCurrency.SelectedItem.Text + "' ,'" + lblER.Text + "' , '" + txtUnit.Text + "', '" + TransactionType.ToString() + "', '" + DateTime.Today + "', '" + txtAccountId.SelectedItem.Text + "')";
                lblTxt.Text = cmd.CommandText;
                cmd.Connection = sqlConnection1;

                sqlConnection1.Open();
                cmd.ExecuteNonQuery();
                sqlConnection1.Close();

                //cmd.CommandText = "UPDATE dblAccounts Set Balance='" + txtBalance.Text + "  where UserId = " + txtUserId.Text;
                cmd.CommandText = "UPDATE tblAccounts Set Balance=" + aBalance + " where AccountId = " + txtAccountId.SelectedItem.Text;
                
                lblText.Text = cmd.CommandText;
                cmd.Connection = sqlConnection1;

                sqlConnection1.Open();
                cmd.ExecuteNonQuery();
                sqlConnection1.Close();

                lblSucessMessage.Visible = true;
            }

            else
                Label1.Visible = true;
            
                
           
        }



        protected void btnMulti_Click(object sender, EventArgs e)
        {
            float Multiple = float.Parse(lblER.Text) * Int32.Parse(txtUnit.Text);
            lblTA.Text = Convert.ToString(Multiple);
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        

        protected void txtAccountId_SelectedIndexChanged1(object sender, EventArgs e)
        {
            lblBalance.Text = txtAccountId.SelectedValue;
        }

        protected void txtCurrency_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblER.Text = txtCurrency.SelectedValue;
        }
    }
}