<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="StudentHomeWorkPage.aspx.cs" Inherits="StudentHomeWorkPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE- HW Page</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <link href="css/menubar.css" rel="stylesheet" />
    <script>
        var app = angular.module('myApp', []);
        app.controller('HWCtrl', function ($scope) {
            $scope.user = '<%= user %>';
        });
    </script>
    <style>
        #form1 {
            position: relative;
            width: 100%;
        }

        #GridView1 tr:hover {
            background-color: #D3D3D3;
        }

        #home_img:hover {
            transform: scale(1.5);
        }

        #home_img {
            width: 38px;
            margin-top: 28px;
            float: right;
            transition: 1s all;
            display: none;
        }

        #headLine {
            margin-left: 200px;
            width: 70%;
        }

        .main-menu {
            display: block;
        }

        #logoutbtn {
            display: none;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {
            #headLine {
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

            #home_img {
                width: 40px;
                margin-top: 28px;
                float: left;
                margin-left: 150px;
                transition: 1s all;
                display: block;
            }

                #home_img:hover {
                    transform: scale(1.2);
                }

            .main-menu {
                display: none;
            }

            #logoutbtn {
                display: block;
            }
        }
    </style>
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

                <a href="#">
                    <img src="img/hw.png" style="height: 50px; margin-left: 5px; margin-top: 36px" onclick="GoToStudentHomeWork()">
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
                <asp:Button runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
                <asp:Button ID="logoutbtn" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="LogOutButton" CausesValidation="False" />
                <a href="StudentPage.aspx">
                    <img src="img/home_btn.png" id="home_img">
                </a>
            </div>
            <div id="headLine">
                <img src="img/your _homworks.png" style="width: 100%; text-align: center; margin-top: -21px" />
            </div>
            <div id="wrapper3">
                <div style="width: 100%; height: 314px; overflow: scroll;">
                    <asp:GridView ID="GridView1" BorderColor="Transparent" class="table table-striped" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" ForeColor="Black"
                        runat="server" Width="100%" AutoGenerateColumns="false" DataKeyNames="Homework ID" OnRowDataBound="OnRowHover" OnSelectedIndexChanged="OnSelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="Homework ID" HeaderText="Homework ID" ItemStyle-Width="150" Visible="false" />
                            <asp:BoundField DataField="Homework Name" HeaderText="Homework Name" ItemStyle-Width="150" />
                            <asp:BoundField DataField="Deadline Date" HeaderText="Deadline Date" ItemStyle-Width="150" />
                            <asp:BoundField DataField="Class" HeaderText="Class" ItemStyle-Width="150" />
                            <asp:BoundField DataField="Course" HeaderText="Course" ItemStyle-Width="150" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </form>
    </div>
</body>
</html>

