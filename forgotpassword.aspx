<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="webMoneyExchange.forgotpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
    <style>
        .title{
            text-align:center;
        }
        .view{
            text-align:center;
            color:white;
            width:70%; 
            margin-left:15%; 
            margin-right:15%;
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
        .txt{
            color:white;
        }
    </style>
    
</head>
<body>
    <div class="bg-img">
    <form id="form1" runat="server" class="txt">
        <h3 class="title"> Forget Password</h3>

        <table class="view">
            <tr>
                <td>
                    <asp:Label ID="Label1" Text="Username" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="txtUsername" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="New Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Cannot be empty!" ControlToValidate="txtNewPassword" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </td>
                <td>
                    <asp:Label ID="lblErrorMessage" runat="server" Font-Bold="True" ForeColor="Red" Text="Incorrect details !"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
   </div>
</body>
</html>
