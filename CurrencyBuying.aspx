<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CurrencyBuying.aspx.cs" Inherits="webMoneyExchange.CurrencyBuying" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> Currency Buying</title>
    
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
        
        <h1 class="heading">Buying of Currency</h1>
        
        <div>
            
            <table class="view">
                <tr>
                    <td>
            <asp:Label ID="Label2" runat="server" Text="Account Id"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="txtAccountId" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="AccountId" DataValueField="Balance" OnSelectedIndexChanged="txtAccountId_SelectedIndexChanged1">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1 %>" SelectCommand="SELECT [AccountId], [Balance] FROM [tblAccounts]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="Label3" runat="server" Text="Balance : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblBalance" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="Label4" runat="server" Text="Currency : "></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="txtCurrency" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="Currency" DataValueField="ExchangeRateSell" OnSelectedIndexChanged="txtCurrency_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1 %>" SelectCommand="SELECT [Currency], [ExchangeRateSell] FROM [tblCurrency]"></asp:SqlDataSource>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="Label5" runat="server" Text="Exchange Rate : "></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="lblER" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="Label6" runat="server" Text="Unit : "></asp:Label>
                    </td>
                    <td>
            <asp:TextBox ID="txtUnit" runat="server" ></asp:TextBox>
                    </td>
                    <td>
            <asp:RequiredFieldValidator ID="rfvUnit" runat="server" ErrorMessage="Unit cannot be empty!" ControlToValidate="txtUnit" Font-Bold="True" ForeColor="#FF0066"></asp:RequiredFieldValidator><br />
            <asp:RegularExpressionValidator ID="rfvUnitInt" runat="server" ErrorMessage="Unit can only be integer!" ControlToValidate="txtUnit" Font-Bold="True" ForeColor="#FF0066" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:Button ID="btnMulti" runat="server" Text="Total Amount : " OnClick="btnMulti_Click" />
                    </td>
                    <td>
                        <asp:Label ID="lblTA" runat="server"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="Transaction Unsuccesful - Insufficient Balance!" Font-Bold="True" ForeColor="Red"></asp:Label>
                    </td>
                    <td>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                    <td>
            <asp:Label ID="lblText" runat="server"></asp:Label>
                        <br />
            <asp:Label ID="lblTxt" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblSucessMessage" runat="server" Font-Bold="True" ForeColor="Blue" Text="Transaction Success!"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

            <br />

        </div>
        
    </form>
</body>
</html>
