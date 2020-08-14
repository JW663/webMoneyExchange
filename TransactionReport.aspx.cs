using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Web.Security;
using System.Data.SqlClient;

namespace webMoneyExchange
{
    public partial class TransactionSummary : System.Web.UI.Page
    {
    protected void Page_Load(object sender, EventArgs e)
        {
            lb1.Text = "<b><font color=Brown>" + "WELCOME ADMIN:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";

            string username = Session["UserName"].ToString();
           
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {


            Session.Clear();
            Response.Redirect("LoginPage.aspx");

        }
    }
}