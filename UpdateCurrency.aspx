<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateCurrency.aspx.cs" Inherits="webMoneyExchange.UpdateCurrency" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Currency</title>
      <style>
        ul {
          list-style-type: none;
          margin: 0;
          padding: 0;
          overflow: hidden;
          background-color: blue;
        }

        li {
          float: left;
        }

        li a, .dropbtn {
          display: inline-block;
          color: white;
          text-align: center;
          padding: 14px 16px;
          text-decoration: none;
        }

        li a:hover, .dropdown:hover .dropbtn {
          background-color: lightblue;
        }

        li.dropdown {
          display: inline-block;
        }

        .dropdown-content {
              display: none;
              position: absolute;
              background-color: #f9f9f9;
              min-width: 160px;
              box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
              z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {background-color: #f1f1f1;}

        .dropdown:hover .dropdown-content {
            display: block;
        }
        .button{
            float:right;
  
        }

        .logout{
            background-color:blue;
            color:white;
            height: 55px;
            width: 145px;
            font-family: Arial;
            font:bold;
            float:right;
        }
        .auto-style1 {
            height: 49px;
        }

        .heading{
            text-align:center;
            font-style:oblique;
            color:blue;
        }

         .table{
             text-align:center;
             margin-left:auto;
             margin-right:auto;
         }
         .view{
            text-align:center;
            color:darkslateblue;
            width:70%; 
            margin-left:15%; 
            margin-right:15%;
        }
         </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="auto-style1">
              <li><a href="AdminHomePage.aspx">Home</a></li>
                
                
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">Admin</a>
                    <div class="dropdown-content">
                        <a href="ViewAccount.aspx">View Account</a>
                        <a href="ViewCurrency.aspx">View Currency</a>
                        <a href="AddAccount.aspx">Add Account</a>
                        <a href="UpdateAccount.aspx">Update Account</a>
                        <a href="AddCurrency.aspx">Add Currency</a>
                        <a href="TransactionReport.aspx">Transaction Report</a>
                        
                    </div>
                </li>
                                
                <li class="logout"><asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" /></li>
                


            </ul>
         </div>
         <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label>
        <h1 class="heading">Update Currency </h1>
        <div>
            
            <br />
            <table class="view">
                <tr>
                    <td>Currency</td>
                    <td>
            <asp:TextBox ID="txtCurrency" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>Unit</td>
                    <td> <asp:TextBox ID="txtUnit" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>ExchangeRateSell</td>
                    <td>
            <asp:TextBox ID="txtBankSelling" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>ExchangeRateBuy</td>
                    <td>
            <asp:TextBox ID="txtBankBuying" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblText" runat="server"></asp:Label>
                    </td>
                    <td>
            <asp:Button ID="txtSubmit" runat="server" Text="Update" OnClick="txtSubmit_Click" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
