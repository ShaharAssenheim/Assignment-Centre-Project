<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerEditUserDetails.aspx.cs" Inherits="ManagerEditUserDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE - User Details</title>
    <script src="inc/jquery-1.10.2.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link href="css/menubarmanager.css" rel="stylesheet" />
    <style type="text/css">
        .TableStyle {
            width: 100%;
        }

        .LableStyle {
            color: #000000;
            font-weight: bold;
            width: 319px;
            text-align: right;
        }

        .ErrMsgStyle {
            text-align: left;
        }

        .TextBoxStyle {
            width: 153px;
            text-align: left;
        }

        #home_img:hover {
            transform: scale(1.5);
        }

        #home_img {
            transition: 1s all;
            display: none;
        }

        #Button6 {
            display: none;
        }

        .main-menu {
            display: block;
        }

        #headline {
            margin-left: 236px;
            margin-top: -14px;
            width: 73%;
        }

        #wrapper3 {
            position: absolute;
            margin-left: -169px;
            margin-top: -93px;
        }

        #form1 {
            position: relative;
            width: 100%;
            height: 100%;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {
            #home_img {
                width: 40px;
                margin-top: 28px;
                float: left;
                margin-left: 150px;
                transition: 1s all;
                display: block;
            }

            #headline {
                text-align: center;
                width: 90%;
                margin-left: 20px;
                margin-top: 40px;
            }

            #wrapper3 {
                border: 0px ridge gray;
                position: absolute;
                width: 80%;
                height: 344px;
                margin-top: -46px;
                margin-left: -100px;
                text-align: center;
            }

            .main-menu {
                display: none;
            }

            #Button6 {
                display: block;
            }
        }
    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script>
        var app = angular.module('myApp', []);
        app.controller('HWCtrl', function ($scope) {
            $scope.user = '<%= user %>';
            $scope.id = '<%= id %>';
            $scope.un = '<%= un %>';
            $scope.pass = '<%= pass %>';
            $scope.role = '<%= role %>';
        });
    </script>

</head>
<body style="background: url(img/2.png) no-repeat center center fixed; background-size: cover;">
    <nav class="main-menu">
        <ul>
            <li>

                <a href="ManagerPage.aspx">
                    <img src="img/home.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li>

                <a href="ManagersUsersPage.aspx">
                    <img src="img/users_bar.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li class="has-subnav">
                <a href="ManagerClassesPage.aspx">
                    <img src="img/classes_bar.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-laptop fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li class="has-subnav">
                <a href="ManagerCoursesPage.aspx">
                    <img src="img/courses_bar.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-laptop fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li class="has-subnav">
                <a href="ManagerAssignmentsPage.aspx">
                    <img src="img/assign_bar.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-laptop fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li>
                <a href="LoginPage.aspx">
                    <img src="img/logout.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-power-off fa-2x"></i>
                    <span class="nav-text"></span>
                </a>
            </li>
    </nav>
    <form id="form1" runat="server" data-ng-app="myApp" data-ng-controller="HWCtrl">
        <div class="container" style="width: 100%">
            <img src="img/logo.png" style="height: 100px; text-align: left">
            <asp:Button ID="Button5" runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
            <asp:Button ID="Button6" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="Button6_Click" CausesValidation="False" />
            <a href="ManagerPage.aspx">
                <img src="img/home_btn.png" id="home_img" style="width: 38px; margin-top: 28px;">
            </a>
        </div>
        <div id="headline" style="text-align: center">
            <img src="img/edit_user.png" style="width: 100%" />
        </div>
        <div id="wrapper3">
            <br />
            <br />
            <table class="TableStyle">
                <tr>
                    <td class="LableStyle">User ID</td>
                    <td class="TextBoxStyle">
                        <asp:TextBox ID="TextBoxID" ng-model="id" runat="server" CssClass="form-control" Height="30px" Width="150px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td class="ErrMsgStyle">&nbsp;</td>
                </tr>
                <tr>
                    <td class="LableStyle">User Name</td>
                    <td class="TextBoxStyle">
                        <asp:TextBox ID="TextBoxUN" ng-model="un" runat="server" CssClass="form-control" Height="30px" Width="150px"></asp:TextBox>
                    </td>
                    <td class="ErrMsgStyle">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter user name" ControlToValidate="TextBoxUN" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="LableStyle">Password</td>
                    <td class="TextBoxStyle">
                        <asp:TextBox ID="TextBoxPass" ng-model="pass" runat="server" CssClass="form-control" Height="30px" Width="150px"></asp:TextBox>
                    </td>
                    <td style="text-align: left">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select password" ControlToValidate="TextBoxPass" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="LableStyle">Role</td>
                    <td class="TextBoxStyle">
                        <asp:TextBox ID="TextBoxRole" ng-model="role" runat="server" CssClass="form-control" Height="30px" Width="150px" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td style="text-align: left">&nbsp;</td>
                </tr>

            </table>
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" OnClick="SaveBtn" Style="text-align: left" Text="Save" />
            &nbsp;<asp:Button ID="Button7" runat="server" CssClass="btn btn-primary" CausesValidation="False" OnClick="ClearBtn" Text="Clear" />
        </div>
    </form>
</body>
</html>

