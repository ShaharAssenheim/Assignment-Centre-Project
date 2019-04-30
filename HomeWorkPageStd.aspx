<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomeWorkPageStd.aspx.cs" Inherits="HomeWorkPageStd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE - Homework</title>
    <script src="inc/jquery-1.10.2.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link href="css/menubar.css" rel="stylesheet" />
    <style type="text/css">
        .TableStyle {
            font-weight: bold;
        }

        .LableStyle {
            font-weight: bold;
            text-align: right;
            width: 353px;
        }

        .TextBoxStyle {
            text-align: left;
        }

        #home_img:hover {
            transform: scale(1.5);
        }

        #home_img {
            transition: 1s all;
            display: none;
        }

        .main-menu {
            display: block;
        }

        #Button6 {
            display: none;
        }

        #headline {
            margin-left: 200px;
            margin-top: -83px;
            width: 70%;
        }

        #wrapper3 {
            position: absolute;
            margin-left: -149px;
            margin-top: -131px;
        }

        .all_site {
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
                width: 100%;
                margin-left: 11px;
                margin-top: 40px;
            }

            #wrapper3 {
                border: 0px ridge gray;
                position: absolute;
                width: 80%;
                height: 344px;
                margin-top: -26px;
                margin-left: -80px;
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
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>

    <script>
        var app = angular.module('myApp', []);
        app.controller('HWCtrl', function ($scope, $window) {
            $scope.hwname = '<%= hwname %>';
            $scope.dld = '<%= dld %>';
            $scope.class = '<%= Class %>';
            $scope.course = '<%= course %>';
            $scope.grade = '<%= grade %>';
            $scope.sname = '<%= sname %>';
            $scope.sdate = '<%= sdate %>';
            $scope.user = '<%= user %>';
        });
    </script>
</head>
<body style="background: url(img/2.png) no-repeat center center fixed; background-size: cover;">

    <div class="area"></div>
    <nav class="main-menu">
        <ul>
            <li>
                <a href="StudentPage.aspx">
                    <img src="img/home.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li>

                <a href="StudentHomeWorkPage.aspx">
                    <img src="img/hw.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li class="has-subnav">
                <a href="StudentHomeWorkSubmissionPage.aspx">
                    <img src="img/sub.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
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

        </ul>


    </nav>

    <div class="all_site">
        <form id="form1" runat="server" data-ng-app="myApp" data-ng-controller="HWCtrl">
            <div class="container" style="width: 100%;">
                <img src="img/logo.png" style="height: 100px; text-align: left">
                <asp:Button ID="Button5" runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
                <asp:Button ID="Button6" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="Button6_Click" CausesValidation="False" />
                <asp:ImageButton ID="home_img" runat="server" ImageUrl="img/home_btn.png" OnClick="check_Role" CausesValidation="False" />
            </div>
            <div style="text-align: center">
                <div id="headline">
                    <img src="img/homework2.png" style="width: 100%" />
                </div>
            </div>
            <div id="wrapper3">
                <br />
                <br />
                <table class="TableStyle">
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Homework Name: </td>
                        <td class="TextBoxStyle">
                            <asp:TextBox ID="TextBox3" ng-model="hwname" Style="background-color: Transparent; border: 0; font-size: 20px" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control" ReadOnly="True" Enabled="false"></asp:TextBox>

                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Submission Name: </td>
                        <td class="TextBoxStyle">
                            <asp:FileUpload ID="TextBoxHWF" onchange="test()" runat="server" Style="display: none" CausesValidation="false" />
                            <asp:TextBox ID="TextBox2" ng-model="sname" Style="background-color: Transparent; border: 0; font-size: 20px" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control" ReadOnly="True" Enabled="false"></asp:TextBox>

                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DeadLine Date: </td>
                        <td class="TextBoxStyle">

                            <asp:TextBox ID="TextBox4" ng-model="dld" Style="background-color: Transparent; border: 0; font-size: 20px" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control" ReadOnly="True" Enabled="false"></asp:TextBox>

                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Submission Date: </td>
                        <td class="TextBoxStyle">
                            <asp:TextBox ID="TextBox5" ng-model="sdate" Style="background-color: Transparent; border: 0; font-size: 20px" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control" ReadOnly="True" Enabled="false"></asp:TextBox>

                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Class Name: </td>
                        <td class="TextBoxStyle">
                            <asp:TextBox ID="TextBox6" ng-model="class" Style="background-color: Transparent; border: 0; font-size: 20px" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control" ReadOnly="True" Enabled="false"></asp:TextBox>
                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Course Name: </td>
                        <td class="TextBoxStyle">
                            <asp:TextBox ID="TextBox1" ng-model="course" Style="background-color: Transparent; border: 0; font-size: 20px" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control" ReadOnly="True" Enabled="false"></asp:TextBox>

                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Homework File: </td>
                        <td class="TextBoxStyle">
                            <asp:Button ID="Button7" CssClass="btn btn-primary" runat="server" Text="Download" OnClick="DownloadHWBtn" />

                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Submission File: </td>
                        <td class="TextBoxStyle">
                            <asp:Button ID="Button8" CssClass="btn btn-primary" runat="server" Text="Download" Enabled="False" OnClick="DownloadSubBtn" />

                        </td>
                        <td style="text-align: left">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Grade: </td>
                        <td class="TextBoxStyle">
                            <asp:TextBox ID="TextBox9" ng-model="grade" Style="border: 0; font-size: 20px" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control"></asp:TextBox>

                        </td>

                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                        <td style="text-align: left">
                            <br />
                            <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Edit Submission" OnClick="EditSubmissionBtn" Visible="False" />
                        </td>
                        <td class="TextBoxStyle">&nbsp;</td>
                    </tr>
                </table>
                <br />
                &nbsp;
            </div>
        </form>
    </div>
</body>
</html>
