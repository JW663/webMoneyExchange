﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webMoneyExchange
{
    public partial class AddCurrency : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            lb1.Text = "<b><font color=Brown>" + "WELCOME ADMIN:: " + "</font>" + "<b><font color=red>" + Session["UserName"] + "</font>";
            string username = Session["UserName"].ToString();

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblText.Text = txtCurrency.Text + txtERS.Text + txtERB.Text;

            System.Data.SqlClient.SqlConnection sqlConnection1 =
    new System.Data.SqlClient.SqlConnection(@"Data Source = (LocalDB)\MSSQLLocalDB; AttachDbFilename = C:\Users\18009054\Documents\dbMoneyExchange.mdf; Integrated Security = True; Connect Timeout = 30");

            System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT tblCurrency (Currency, ExchangeRateSell, ExchangeRateBuy) VALUES ('" + txtCurrency.Text + "' , '" + txtERS.Text + "' , '" + txtERB.Text + "')";
            lblText.Text = cmd.CommandText;
            cmd.Connection = sqlConnection1;

            sqlConnection1.Open();
            cmd.ExecuteNonQuery();
            sqlConnection1.Close();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("LoginPage.aspx");
        }

      
    }
}