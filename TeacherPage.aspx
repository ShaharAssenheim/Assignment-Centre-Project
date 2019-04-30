<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeacherPage.aspx.cs" Inherits="TeacherPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE - Teacher Menu</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <link href="css/menubar.css" rel="stylesheet" />
    <script>
        function NewHW() {
            window.location = "UploadNewHomeWorkPage.aspx";
        }
        function THWList() {
            window.location = "TeacherHomeWorkListPage.aspx";
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
        }

        #headline {
            margin: 0 auto;
            width: 70%;
        }

        .main-menu {
            display: block;
        }

            .main-menu:hover, nav.main-menu.expanded {
                width: 285px;
                overflow: visible;
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

        #wrapper2 {
            display: none;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {
            #zoom:hover {
                transform: scale(1.5);
            }

            #zoom {
                background-color: Transparent;
                border: 0px;
                transition: 1s all;
            }

            #headline {
                text-align: center;
                width: 100%;
                margin-left: 11px;
                margin-top: 40px;
            }

            #wrapper2 {
                border: 0px ridge gray;
                position: absolute;
                width: 200px;
                top: 180%;
                left: 65%;
                margin-top: -320px;
                margin-left: -150px;
                text-align: center;
                display: block;
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
<body style="background: url(img/2.png) no-repeat center center fixed; background-size: cover;">
    <div class="area"></div>
    <nav class="main-menu">
        <ul>
            <li>

                <a href="TeacherPage.aspx">
                    <img src="img/home.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li>

                <a href="UploadNewHomeWorkPage.aspx">
                    <img src="img/new_hw_m.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
                    <i class="fa fa-home fa-2x"></i>
                    <span class="nav-text"></span>
                </a>

            </li>
            <li class="has-subnav">
                <a href="TeacherHomeWorkListPage.aspx">
                    <img src="img/hw_sub_list.png" style="height: 50px; margin-left: 5px; margin-top: 36px">
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
            <div class="container" style="width: 100%">
                <img id="logo" src="img/logo.png" style="height: 100px;">
                <div class="headButtons">
                    <asp:Button ID="Button5" runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
                    <asp:Button ID="Button6" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="Button6_Click" CausesValidation="False" />
                </div>
            </div>
            <div id="headline">
                <img src="img/teacher_menu.png" style="width: 100%; text-align: center" />
            </div>

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
                    <img src="img/new_hw.png" style="width: 100%; text-align: left; margin-top: -93px" onclick="NewHW()">
                </div>
                <div class="btn btn-primary" id="zoom">
                    <img src="img/hw_sub_list2.png" style="width: 100%; text-align: left;" onclick="THWList()">
                </div>
            </div>
        </form>
    </div>
</body>
</html>
