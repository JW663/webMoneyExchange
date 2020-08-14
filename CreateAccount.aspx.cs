using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

namespace webMoneyExchange
{
    public partial class CreateUser : System.Web.UI.Page
    {
        string strConnString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\18009054\Documents\dbMoneyExchange.mdf;Integrated Security=True;Connect Timeout=30";

        SqlCommand com;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            string role = "User";

            SqlConnection con = new SqlConnection(strConnString);

            com = new SqlCommand();

            com.Connection = con;

            com.CommandType = CommandType.Text;

            com.CommandText = "Insert into tblUser values(@UserName,@Password,@Role)";

            com.Parameters.Clear();

            com.Parameters.AddWithValue("@UserName", txtUsername.Text);

            com.Parameters.AddWithValue("@Password", txtPassword.Text);

            com.Parameters.AddWithValue("@Role", role);


            if (con.State == ConnectionState.Closed)

                con.Open();

            com.ExecuteNonQuery();

            con.Close();

            lblmsg.Text = "Successfully Created!!!";

            clear();


        }

        private void clear()
        {
            txtUsername.Text = "";
        }
    }
}