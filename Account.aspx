<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="webMoneyExchange.Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account</title>
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

         .p{
             text-align:center;
         }

         .h1{
             text-align:center;
         }

           .view{
            text-align:center;
            color:darkslateblue;
            width:70%; 
            margin-left:15%; 
            margin-right:15%;
            }

           .auto-style2 {
               text-align: center;
               color: darkslateblue;
               margin-left: 15%;
               margin-right: 15%;
           }
         </style>
</head>
<body style="height: 47px">
    <form id="form1" runat="server">
        <ul class="auto-style1">
                 <li><a href="UserHomePage.aspx">Home</a></li>
                
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
         
                                
                <li class="logout"><asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" /></li>

            </ul>

        <br />
        
        <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label>
        

        <h1 class="heading">
            <asp:Label ID="Label1" runat="server" Text="Account"></asp:Label>
        </h1>
        
        <div>
            <asp:GridView ID="accounts" runat="server" AutoGenerateColumns="false" CssClass="view">
                <Columns>
                    <asp:BoundField DataField="AccountId" HeaderText="Account Id" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" />
                    <asp:BoundField DataField="Balance" HeaderText="Balance" />
                    
                </Columns>
            </asp:GridView>
            <br />
            <h3 class="heading">Transactions Made</h3>
            <asp:GridView ID="transaction" runat="server" AutoGenerateColumns="false" CssClass="auto-style2" Height="214px" Width="838px">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Transactions Id" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
