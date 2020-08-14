<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TransactionReport.aspx.cs" Inherits="webMoneyExchange.TransactionSummary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transaction Summary</title>
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
        <h1 class="heading">Transaction Report</h1>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="view" DataKeyNames="Id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="TransactionType" HeaderText="TransactionType" SortExpression="TransactionType" />
                <asp:BoundField DataField="Currency" HeaderText="Currency" SortExpression="Currency" />
                <asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
                <asp:BoundField DataField="ExchangeRate" HeaderText="ExchangeRate" SortExpression="ExchangeRate" />
                <asp:BoundField DataField="MoneyAmount" HeaderText="MoneyAmount" SortExpression="MoneyAmount" />
                <asp:BoundField DataField="TransactionDate" HeaderText="TransactionDate" SortExpression="TransactionDate" />
                <asp:BoundField DataField="AccountId" HeaderText="AccountId" SortExpression="AccountId" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1 %>" DeleteCommand="DELETE FROM [tblTransactions] WHERE [Id] = @Id" InsertCommand="INSERT INTO [tblTransactions] ([TransactionType], [Currency], [Unit], [ExchangeRate], [MoneyAmount], [TransactionDate], [AccountId]) VALUES (@TransactionType, @Currency, @Unit, @ExchangeRate, @MoneyAmount, @TransactionDate, @AccountId)" ProviderName="<%$ ConnectionStrings:dbMoneyExchangeConnectionString1.ProviderName %>" SelectCommand="SELECT [Id], [TransactionType], [Currency], [Unit], [ExchangeRate], [MoneyAmount], [TransactionDate], [AccountId] FROM [tblTransactions]" UpdateCommand="UPDATE [tblTransactions] SET [TransactionType] = @TransactionType, [Currency] = @Currency, [Unit] = @Unit, [ExchangeRate] = @ExchangeRate, [MoneyAmount] = @MoneyAmount, [TransactionDate] = @TransactionDate, [AccountId] = @AccountId WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TransactionType" Type="String" />
                <asp:Parameter Name="Currency" Type="String" />
                <asp:Parameter Name="Unit" Type="Int32" />
                <asp:Parameter Name="ExchangeRate" Type="Double" />
                <asp:Parameter Name="MoneyAmount" Type="Double" />
                <asp:Parameter DbType="Date" Name="TransactionDate" />
                <asp:Parameter Name="AccountId" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TransactionType" Type="String" />
                <asp:Parameter Name="Currency" Type="String" />
                <asp:Parameter Name="Unit" Type="Int32" />
                <asp:Parameter Name="ExchangeRate" Type="Double" />
                <asp:Parameter Name="MoneyAmount" Type="Double" />
                <asp:Parameter DbType="Date" Name="TransactionDate" />
                <asp:Parameter Name="AccountId" Type="Int32" />
                <asp:Parameter Name="Id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />

    </form>
</body>
</html>
