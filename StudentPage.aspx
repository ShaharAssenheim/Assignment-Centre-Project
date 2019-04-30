<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentPage.aspx.cs" Inherits="StudentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE -Student Menu</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <link href="css/menubar.css" rel="stylesheet" />

    <script>
        function GoToStudentHomeWork() {
            window.location = "StudentHomeWorkPage.aspx";
        }
        function SubHW() {
            window.location = "StudentHomeWorkSubmissionPage.aspx";
        }
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script>
        var app = angular.module('myApp', []);
        app.controller('HWCtrl', function ($scope) {
            $scope.user = '<%= user %>';
        });
    </script>
    <style>
        .all_site {
            position: relative;
            width: 100%;
            height: 100%;
        }

        #wrapper2 {
            margin-top: -250px;
            display: none;
        }

        #headLine {
            text-align: center;
            height: 209px;
        }

        .main-menu {
            display: block;
        }

        h1 {
            display: block;
            font-size: 40px;
            color: #f5f5f0;
            text-shadow: -1px 0 #000066, 0 1px #000066, 1px 0 #000066, 0 -1px #000066;
        }

        .headButtons {
            display: none;
        }

        #logo {
            margin-left: 400px;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {
            .all_site {
                margin: auto;
            }

            #zoom:hover {
                transform: scale(1.5);
            }

            #zoom {
                background-color: Transparent;
                border: 0px;
                transition: 1s all;
            }

            #headLine {
                text-align: center;
                width: 100%;
                margin-left: 15px;
                margin-top: 40px;
            }

            #wrapper2 {
                display: block;
                border: 0px ridge gray;
                position: absolute;
                width: 200px;
                top: 150%;
                left: 65%;
                margin-top: -500px;
                margin-left: -150px;
                text-align: center;
            }

            .main-menu {
                display: none;
            }

            h1 {
                display: none;
            }

            .headButtons {
                display: block;
            }

            #logo {
                margin-left: 0;
            }
        }
    </style>
</head>
<body style="background: url(img/2.png) no-repeat center center fixed; background-size: cover">
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
                <a href="#">
                    <img src="img/sub.png" style="height: 50px; margin-left: 5px; margin-top: 36px" onclick="SubHW()">
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


    <div class="all_site">
        <form id="form1" runat="server" data-ng-app="myApp" data-ng-controller="HWCtrl">
            <div class="container" style="width: 100%;">
                <img id="logo" src="img/logo.png" style="height: 100px;">
                <div class="headButtons">
                    <asp:Button runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
                    <asp:Button runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="LogOutButton" CausesValidation="False" />
                </div>
            </div>
            <div id="headLine">
                <img src="img/Student menu.png" style="width: 100%; text-align: center" />
            </div>
            <br />
            <br />
            <h1 style="text-align: center">{{user}} welcome to your personal page</h1>
            <h1 style="text-align: center">please navigate throw the sidebar.</h1>
            <div id="wrapper2">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <div class="btn btn-primary" id="zoom">
                    <img src="img/homework.png" style="width: 100%; text-align: left; margin-top: -77px;" onclick="GoToStudentHomeWork()">
                </div>
                <br />
                <br />

                <div class="btn btn-primary" id="zoom">
                    <img src="img/submission.png" style="width: 100%; text-align: left; margin-top: -47px;" onclick="SubHW()">
                </div>

            </div>
        </form>
    </div>
</body>
</html>
