<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencySelling.aspx.cs" Inherits="webMoneyExchange.CurrencySelling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Selling of Currency</title>
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
        .auto-style1 {
            height: 49px;
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
        }
        .auto-style1 {
            height: 49px;
        }

        .heading{
            text-align:center;
            font-style:oblique;
            color:blue;
        }

        .p{
            text-align:center;
            color:blue;
        }
 
         .auto-style2 {
             height: 33px;
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
                                
                <li class="button">
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout" OnClick="btnLogout_Click" /></li>
            </ul>
         </div>
        
           <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label>
        <h1 class="heading"> Selling Of Currency </h1>

        <table class="view">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Account Id"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="txtAccountId" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="AccountId" DataValueField="Balance" OnSelectedIndexChanged="txtAccountId_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1 %>" SelectCommand="SELECT [AccountId], [Balance] FROM [tblAccounts]"></asp:SqlDataSource>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Balance"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblBalance" runat="server"></asp:Label>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>Currency</td>
                <td>
                    <asp:DropDownList ID="txtCurrency" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Currency" DataValueField="ExchangeRateBuy" OnSelectedIndexChanged="txtCurrency_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1 %>" SelectCommand="SELECT [Currency], [ExchangeRateBuy] FROM [tblCurrency]"></asp:SqlDataSource>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">Exchange Rate</td>
                <td class="auto-style2">
                    <asp:Label ID="lblER" runat="server"></asp:Label>
                </td>
                <td class="auto-style2"></td>
            </tr>
            <tr>
                <td>Unit</td>
                <td>
                    <asp:TextBox ID="txtUnit" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnMultiple" runat="server" OnClick="btnMultiple_Click" Text="Total Amount" />
                </td>
                <td>
                    <asp:Label ID="lblTA" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblText" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSuccess" runat="server" Text="Transaction Successful"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" />
                </td>
                <td></td>
            </tr>
        </table>
        
    </form>
</body>
</html>
