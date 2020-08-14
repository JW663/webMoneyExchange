<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="webMoneyExchange.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
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
  input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
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
            margin: 20px;
            max-width: 300px;
            padding: 16px;
            background-color: white;
            top: 15px;
            width: 329px;
            height: 422px;
        }

       
       
    </style>
     <script type="text/javascript" language="javascript">

    function Validate()

    {

    var UName=document.getElementById('TextBox_user_name');

    var Password=document.getElementById('TextBox_password');

    if((UName.value=='') || (Password.value==''))

    {

     alert('UserName or Password should not be blank');

     return false;

    }

    else

    {

      return true;

    }

    }

    </script>
</head>
<body>
    <div class="bg-img">
        <form id="form1" class="auto-style1" runat="server">
            <h1>Login</h1>
            <br />
            <label for="id"><b>UserName</b></label>
            <asp:TextBox ID="TextBox_user_name" runat="server" required="required"></asp:TextBox><br />
            <label for="psw"><b>Password</b></label>
            <asp:TextBox ID="TextBox_password" runat="server" TextMode="Password" required="required"></asp:TextBox><br />
            <asp:Button ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" OnClientClick="Validate()" CssClass="btn" />
               
   
            <asp:Label ID="lb1" runat="server" Font-Bold="True" ForeColor="#FF3300"></asp:Label><br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/CreateAccount.aspx">Not a user?</asp:HyperLink>
   <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/forgotpassword.aspx" Visible="False">forget password?</asp:HyperLink>
   
  </form>
</div>

</body>
</html>
