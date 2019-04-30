<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TeacherHomeWorkListPage.aspx.cs" Inherits="TeacherHomeWorkListPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE - HW List</title>
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
        #GridView1 tr:hover {
            background-color: #D3D3D3;
        }


        #home_img {
            display: none;
        }

        #headLine {
            height: 250px;
            text-align: center;
            margin: 0 auto;
            margin-top: -50px;
            width: 80%;
        }

        .main-menu {
            display: block;
        }

            .main-menu:hover, nav.main-menu.expanded {
                width: 350px;
                overflow: visible;
            }

        #wrapper3 {
            margin-top: -20px;
            margin-left: -200px;
        }

        #Button3 {
            display: none;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {
            #home_img:hover {
                transform: scale(1.5);
            }

            #home_img {
                width: 40px;
                margin-top: 28px;
                float: left;
                margin-left: 150px;
                transition: 1s all;
                display: block;
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
                width: 80%;
                margin-left: 31px;
                margin-top: 40px;
            }

            #wrapper3 {
                border: 0px ridge gray;
                position: absolute;
                width: 200px;
                top: 150%;
                left: 50%;
                margin-top: -500px;
                margin-left: -100px;
                text-align: center;
                display: block;
            }

            .main-menu {
                display: none;
            }



            #logo {
                margin-left: 0;
            }

            #Button3 {
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
    <form id="form1" runat="server" data-ng-app="myApp" data-ng-controller="HWCtrl">
        <div class="container" style="width: 100%">
            <img src="img/logo.png" style="height: 100px;">
            <asp:Button ID="Button1" runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="Button3_Click" CausesValidation="False" />
            <a href="TeacherPage.aspx">
                <img src="img/home_btn.png" id="home_img" style="width: 38px; margin-top: 28px;">
            </a>
        </div>
        <div id="headLine" style="text-align: center">
            <img src="img/hw_list.png" style="width: 100%" />
        </div>
        <div id="wrapper3">
            <div style="width: 100%; height: 300px; overflow: scroll">
                <asp:GridView ID="GridView1" BorderColor="Transparent" OnRowCommand="GridView1_OnRowCommand" class="table table-striped" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" ForeColor="Black"
                    runat="server" Width="100%" AutoGenerateColumns="false" DataKeyNames="Homework ID" OnRowDataBound="OnRowDataBound" OnSelectedIndexChanged="OnSelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="Homework ID" HeaderText="Homework ID" ItemStyle-Width="150" Visible="false" />
                        <asp:BoundField DataField="Homework Name" HeaderText="Homework Name" ItemStyle-Width="150" />
                        <asp:BoundField DataField="Deadline Date" HeaderText="Deadline Date" ItemStyle-Width="150" />
                        <asp:BoundField DataField="Class" HeaderText="Class" ItemStyle-Width="150" />
                        <asp:BoundField DataField="Course" HeaderText="Course" ItemStyle-Width="150" />
                        <asp:TemplateField ShowHeader="False" HeaderStyle-Width="30px">
                            <ItemTemplate>
                                <asp:Button ID="Button8" runat="server" CssClass="btn btn-primary" CausesValidation="false" CommandName="Edit"
                                    Text="Edit" CommandArgument='<%# Eval("Homework ID")+","+ Eval("Homework Name")+","+ Eval("Deadline Date")+","+ Eval("Class")+","+ Eval("Course")%>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
