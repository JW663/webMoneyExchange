using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webMoneyExchange
{
    public partial class UpdateCurrency : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lb1.Text = "<b><font color=Brown>" + "WELCOME ADMIN:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";
        }

       protected void txtSubmit_Click(object sender, EventArgs e)
        {
            using (System.Data.SqlClient.SqlConnection sqlConnection1 =
new System.Data.SqlClient.SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\18009054\Documents\dbMoneyExchange.mdf; Integrated Security = True; Connect Timeout = 30"))
           {
                sqlConnection1.Open();
               string query = "UPDATE dblCurrency WHERE Currency=@Currency AND Unit=@Unit AND ExchangeRateSell=@ExchangeRateSell AND ExchangeRateBuy=@ExchangeRateBuy";
               SqlCommand sqlCmd = new SqlCommand(query, sqlConnection1);
               sqlCmd.Parameters.AddWithValue("@Currency", txtCurrency.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@Unit", txtUnit.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@ExchangeRateSell", txtBankSelling.Text.Trim());
                sqlCmd.Parameters.AddWithValue("@ExchangeRateBuy", txtBankBuying.Text.Trim());
                sqlCmd.ExecuteNonQuery();
                sqlConnection1.Close();
                
            }
           
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }
    }
    
}