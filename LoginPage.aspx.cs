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
    public partial class LoginPage : System.Web.UI.Page
    {

        string strConnString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\18009054\Documents\dbMoneyExchange.mdf;Integrated Security=True;Connect Timeout=30";

        string str, UserName, Password;

        SqlCommand com;

        SqlDataAdapter sqlda;

        DataTable dt;

        int RowCount;

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strConnString);

            con.Open();

            str = "Select * from tblUser";

            com = new SqlCommand(str);

            sqlda = new SqlDataAdapter(com.CommandText, con);

            dt = new DataTable();

            sqlda.Fill(dt);

            RowCount = dt.Rows.Count;

            for (int i = 0; i < RowCount; i++)

            {

                UserName = dt.Rows[i]["UserName"].ToString();

                Password = dt.Rows[i]["Password"].ToString();

                if (UserName == TextBox_user_name.Text && Password == TextBox_password.Text)

                {

                    Session["UserName"] = UserName;

                    if (dt.Rows[i]["Role"].ToString() == "Admin")

                        Response.Redirect("AdminHomePage.aspx");

                    else if (dt.Rows[i]["Role"].ToString() == "User")

                        Response.Redirect("UserHomePage.aspx");



                }

                else

                {

                    lb1.Text = "Invalid User Name or Password! Please try again!";

                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       
    }
}