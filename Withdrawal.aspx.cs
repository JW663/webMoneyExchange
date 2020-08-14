using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webMoneyExchange
{
    public partial class Withdrawal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lblErrorMssg.Visible = false;
            lblSuccess.Visible = false;
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lb1.Text = "<b><font color=Brown>" + "WELCOME USER:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

        
        protected void btnWithdraw_Click(object sender, EventArgs e)
        {
            

            float aBalance = float.Parse(lblOldBalance.Text) - float.Parse(txtWithdrawAmt.Text);
            string TransactionType = "Withdrawal";
            float oldBalance = float.Parse(lblOldBalance.Text);
            float wthAmount = float.Parse(txtWithdrawAmt.Text);

            

            if (wthAmount < oldBalance)
            {
                System.Data.SqlClient.SqlConnection sqlConnection1 =
   new System.Data.SqlClient.SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\18009054\Documents\dbMoneyExchange.mdf; Integrated Security = True; Connect Timeout = 30");

                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "INSERT tblTransactions (TransactionType, TransactionDate, MoneyAmount, AccountId) VALUES ('" + TransactionType.ToString() + "', '" + DateTime.Today + "', '" + txtWithdrawAmt.Text + "', '" + txtAccountId.SelectedItem.Text + "')";
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

                lblNewBalance.Text = aBalance.ToString();
                lblSuccess.Visible = true;
            }

            else
                
                lblErrorMssg.Visible = true;
            
            
            
            
        }



        protected void txtAccountId_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblOldBalance.Text = txtAccountId.SelectedValue;
        }
    }
}