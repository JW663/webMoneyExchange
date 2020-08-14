<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="webMoneyExchange.CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create User</title>
    <style>
       body, html {
          height: 100%;
       }

    * {
        box-sizing: border-box;
    }

.bg-img {
  /* The image used */
  background-image: url("logo.jpg");

   /* Full height */
  height: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
}


/* Add styles to the form container */
.container {
  position: absolute;
  right: 0;
  margin: 20px;
  max-width: 300px;
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
  input[type=text], input[type=password], input[type=email] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus, input[type=email] {
  background-color: #ddd;
  outline: none;
}

/* Set a style for the submit button */
.btn {
  background-color: wheat;
  color: midnightblue;
  padding: 16px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.btn:hover {
  opacity: 1;
}

       
        .auto-style1 {
            position: absolute;
            right: 0;
            max-width: 300px;
            padding: 16px;
            background-color: white;
            top: 15px;
            width: 329px;
            height: 484px;
            margin-left: 20px;
            margin-right: 20px;
            margin-top: 20px;
        }

       
        
    </style>
</head>
<body>
    <div class="bg-img">
        <form id="form1" runat="server" class="auto-style1">
            <h1>Create Account</h1>
            <asp:Label ID="Label1" Text="Username" runat="server"></asp:Label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                        
                    
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                        
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                       

            <asp:Button ID="btnCreate" runat="server" Text="Create" OnClick="btnCreate_Click" CssClass="btn" />                        
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginPage.aspx" CssClass="text">Go back to Login Page</asp:HyperLink>
                    
          
       </form>
   </div>
    
    <p>
        &nbsp;</p>
    
</body>
</html>
