<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE- Login Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

    <style type="text/css">
        .TableStyle {
            width: 100%;
            height: 96px;
        }

        .PassImg {
            height: 20px;
            width: 321px;
            text-align: right;
        }

        .PassTextBox {
            height: 20px;
            width: 7px;
            text-align: left;
        }

        .PassError {
            height: 20px;
            text-align: left;
        }

        .UserNameImg {
            height: 55px;
            width: 321px;
            text-align: right;
        }

        .UserNameTextBox {
            height: 55px;
            width: 7px;
            text-align: left;
        }

        .UserNameError {
            height: 55px;
            text-align: left;
        }

        .all_site {
            position: relative;
            width: 100%;
            height: 100%;
        }

        #logo {
            height: 300px;
            text-align: center;
        }

        body {
            background: url(img/1.jpg) no-repeat center center fixed;
            background-size: cover;
        }

        #wrapper {
            text-align: center;
            margin-bottom: 0px;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {

            #logo {
                height: 100px;
                text-align: center;
            }

            #wrapper {
                border: 0px ridge gray;
                position: absolute;
                width: 300px;
                height: 150px;
                margin: 0 auto;
                text-align: center;
                top: 80%;
                left: 20%;
                margin-left: auto;
            }
        }
    </style>


</head>
<body>
    <div class="all_site">

        <div id="logo">
            <img src="img/logo.png" style="height: 100%; text-align: center">
        </div>
        <div id="wrapper">

            <br />
            <form id="form1" runat="server">
                <div>
                    <table class="TableStyle">
                        <tr>
                            <td class="UserNameImg" style="color: #FFFFFF; font-weight: bold;">
                                <asp:Image ID="Image2" runat="server" src="img/Username.png" Height="40px" Style="text-align: left" margin="0 auto" />
                                &nbsp;
                            </td>
                            <td class="UserNameTextBox">
                                <asp:TextBox ID="UserName" Placeholder="Enter User Name" runat="server" CssClass="form-control" Height="30px" Width="159px" Style="text-align: center"></asp:TextBox>
                            </td>
                            <td class="UserNameError">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="UserName" ErrorMessage="Please Enter User Name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr>
                            <td class="PassImg" style="color: #FFFFFF; font-weight: 700;">
                                <asp:Image ID="Image1" runat="server" src="img/Password.jpg" Height="50px" />
                                &nbsp;
                            </td>
                            <td class="PassTextBox">
                                <asp:TextBox ID="PassTB" Placeholder="Enter Password" runat="server" CssClass="form-control" TextMode="Password" Height="30px" Width="159px" Style="text-align: center"></asp:TextBox>
                            </td>
                            <td class="PassError">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="PassTB" ErrorMessage="Please Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                    </table>
                    <br />
                    <asp:Button ID="Login" runat="server" CssClass="btn btn-primary" OnClick="LogInButton" Text="Login" Height="40px" Width="105px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <p>
                        Shahar & Yevgeni Software™
                        <br />
                        Copyright &copy;2019<br />
                        All rights reserved.
                    </p>
                    &nbsp;<br />
                </div>
            </form>
        </div>
    </div>
</body>


</html>
