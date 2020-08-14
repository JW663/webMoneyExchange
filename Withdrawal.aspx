<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Withdrawal.aspx.cs" Inherits="webMoneyExchange.Withdrawal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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

        .h1{
            text-align:center;
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
        </div>
       <asp:Label ID="lb1" runat="server" Text="Label"></asp:Label> 
        <h1 class="heading">Withdrawal</h1>
        <br />
        <table class="view">
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Account Id"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="txtAccountId" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="AccountId" DataValueField="Balance" OnSelectedIndexChanged="txtAccountId_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1 %>" SelectCommand="SELECT [AccountId], [Balance] FROM [tblAccounts]"></asp:SqlDataSource>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Old Balance"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblOldBalance" runat="server"></asp:Label>
                </td>
                <td>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Withdrawal Amount"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtWithdrawAmt" runat="server"></asp:TextBox>
                </td>
                <td>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Amount cannot be empty!" ForeColor="Red" ControlToValidate="txtWithdrawAmt"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Amount in integer only!" ForeColor="Red" ControlToValidate="txtWithdrawAmt" ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>

                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="New Balance"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblNewBalance" runat="server"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <br />
                    <asp:Label ID="lblErrorMssg" runat="server" Font-Bold="True" ForeColor="Red" Text="Transaction Unsuccessful - Insufficient Balance!"></asp:Label><br />
                    <asp:Label ID="lblSuccess" runat="server" Font-Bold="True" ForeColor="Blue" Text="Transaction Successful"></asp:Label><br />
                    
                </td>
                <td>

                    <asp:Button ID="btnWithdraw" runat="server" Text="Withdraw" OnClick="btnWithdraw_Click" />

                </td>
                <td>
                    <asp:Label ID="lblText" runat="server"></asp:Label><br />
                    <asp:Label ID="lblTxt" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
