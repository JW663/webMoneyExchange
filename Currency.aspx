<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Currency.aspx.cs" Inherits="webMoneyExchange.Currency" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Currency</title>
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
            
        }

         .table{
             text-align:center;
             margin-left:auto;
             margin-right:auto;
         }

         .p{
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
        <h1 class="heading">Currency</h1>
        <br />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="view" DataKeyNames="Currency" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
                <Columns>
                    <asp:BoundField DataField="Currency" HeaderText="Currency" ReadOnly="True" SortExpression="Currency" />
                    <asp:BoundField DataField="ExchangeRateBuy" HeaderText="ExchangeRateBuy" SortExpression="ExchangeRateBuy" />
                    <asp:BoundField DataField="ExchangeRateSell" HeaderText="ExchangeRateSell" SortExpression="ExchangeRateSell" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1 %>" DeleteCommand="DELETE FROM [tblCurrency] WHERE [Currency] = @Currency" InsertCommand="INSERT INTO [tblCurrency] ([Currency], [ExchangeRateBuy], [ExchangeRateSell]) VALUES (@Currency, @ExchangeRateBuy, @ExchangeRateSell)" ProviderName="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1.ProviderName %>" SelectCommand="SELECT [Currency], [ExchangeRateBuy], [ExchangeRateSell] FROM [tblCurrency]" UpdateCommand="UPDATE [tblCurrency] SET [ExchangeRateBuy] = @ExchangeRateBuy, [ExchangeRateSell] = @ExchangeRateSell WHERE [Currency] = @Currency">
                <DeleteParameters>
                    <asp:Parameter Name="Currency" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Currency" Type="String" />
                    <asp:Parameter Name="ExchangeRateBuy" Type="Double" />
                    <asp:Parameter Name="ExchangeRateSell" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ExchangeRateBuy" Type="Double" />
                    <asp:Parameter Name="ExchangeRateSell" Type="Double" />
                    <asp:Parameter Name="Currency" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
