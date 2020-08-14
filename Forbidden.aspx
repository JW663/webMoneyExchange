<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Forbidden.aspx.cs" Inherits="webMoneyExchange.Forbidden" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forbidden</title>
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
            height: 48px;
        }

        
        .auto-style3 {
            color: #FF5050;
        }

        .red{
            text-align:center;
            font:bold;
            color:red;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <ul class="auto-style1">
               <li><a href="HomePage.aspx">Home</a></li>
                
               <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">User</a>
                    <div class="dropdown-content">
                        <a href="Account.aspx">Account</a>
                        <a href="Currency.aspx">Currency</a>
                        <a href="CurrencyBuying.aspx">Currency Buying</a>
                        <a href="CurrencySelling.aspx">Currency Selling</a>
                        <a href="Deposit.aspx">Deposit</a>
                        <a href="Withdrawal.aspx">Withdrawal</a>
                        <a href="TransactionHistory.aspx">Transaction History</a>
                    </div>
                </li>


                
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn">Admin</a>
                    <div class="dropdown-content">
                        <a href="ViewAccount.aspx">View Account</a>
                        <a href="ViewCurrency.aspx">View Currency</a>
                        <a href="AddAccount.aspx">Add Account</a>
                        <a href="UpdateAccount.aspx">Update Account</a>
                        <a href="AddCurrency.aspx">Add Currency</a>
                        <a href="TransactionSummary.aspx">Transaction Summary</a>
                        
                    </div>
                </li>
                                
                <li class="logout"><asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" /></li>

            </ul>
        </div>
        <br />
        <div class="red">
            Oh-uh!  Unathorized Access!
            It seems that you have tried to access the page that is being limited to you.
            
        </div>
    </form>
</body>
</html>
