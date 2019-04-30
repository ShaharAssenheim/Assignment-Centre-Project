<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentHomeWorkSubmissionPage.aspx.cs" Inherits="StudentHomeWorkSubmissionPage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE - Submit HW</title>
    <script src="inc/jquery-1.10.2.js"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />
    <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />
    <link href="css/menubar.css" rel="stylesheet" />

    <style>
        .bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form {
            font-family: Arial, Helvetica, sans-serif;
            color: black;
        }

            .bootstrap-iso form button, .bootstrap-iso form button:hover {
                color: white !important;
            }

        .asteriskField {
            color: red;
        }
    </style>

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

        .main-menu {
            display: block;
        }

        #Button6 {
            display: none;
        }

        #headline {
            margin-left: 200px;
            margin-top: -41px;
            width: 70%;
        }

        .all_site {
            position: relative;
            width: 100%;
            height: 100%;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {
            #headline {
                text-align: center;
                width: 100%;
                margin-left: 11px;
                margin-top: 40px;
            }

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

            .LableStyle {
                text-align: left;
            }
        }
    </style>

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />


    <script>
        $(document).ready(function () {
            var date_input = $('input[name="TextBox1"]');
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,

            })
        })
    </script>
    <script type="text/javascript">
        function test() {
            document.getElementById('<%=TextBox2.ClientID%>').value = document.getElementById('<%=TextBoxHWF.ClientID%>').files[0].name;;
        }
    </script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script>
        var app = angular.module('myApp', []);
        app.controller('HWCtrl', function ($scope) {
            $scope.dld = '<%= dld %>';
            $scope.user = '<%= user %>';
        });

    </script>
</head>
<body style="background: url(img/2.png) no-repeat center center fixed; background-size: cover;">

    <div class="all_site">

        <form id="form1" runat="server" data-ng-app="myApp" data-ng-controller="HWCtrl">


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
            </nav>
            <div class="container" style="width: 100%;">
                <img src="img/logo.png" style="height: 100px; text-align: left">
                <asp:Button ID="Button5" runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
                <asp:Button ID="Button6" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="Button6_Click" CausesValidation="False" />
                <a href="StudentPage.aspx">
                    <img src="img/home_btn.png" id="home_img" style="width: 38px; margin-top: 28px;">
                </a>
            </div>
            <div style="text-align: center">
                <div id="headline">
                    <img src="img/hwsubmission.png" style="width: 100%" />
                </div>
            </div>
            <div id="wrapper3" style="margin-top: -80px">
                <br />
                <br />
                <table class="TableStyle">
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Submission Name </td>
                        <td class="TextBoxStyle">
                            <asp:TextBox ID="TextBoxHWN" runat="server" CssClass="form-control" Height="30px" Width="150px"></asp:TextBox>
                        </td>
                        <td class="ErrMsgStyle">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter submission name" ControlToValidate="TextBoxHWN" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Course Name </td>
                        <td class="TextBoxStyle">
                            <asp:DropDownList ID="DropDownCourseN" CssClass="form-control" runat="server" AutoPostBack="true" Height="35px" Width="150px" OnSelectedIndexChanged="DropDownCourseN_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select course" ControlToValidate="DropDownCourseN" ForeColor="Red" InitialValue="Select Course"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Homework Name </td>
                        <td class="TextBoxStyle">
                            <asp:DropDownList ID="DropDownHWN" AutoPostBack="true" CssClass="form-control" runat="server" Height="35px" Width="150px" OnSelectedIndexChanged="DropDownHWN_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td style="text-align: left">&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please select homework" ControlToValidate="DropDownHWN" ForeColor="Red" InitialValue="Select Homework"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DeadLine Date </td>
                        <td class="TextBoxStyle">

                            <asp:TextBox ID="TextBox3" ng-model="dld" runat="server" Style="background-color: Transparent; border: 0px; font-size: 20px" CssClass="form-control" Height="30px" Width="150px" Enabled="False"></asp:TextBox>

                        </td>
                        <td class="ErrMsgStyle">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="LableStyle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; File Attachment </td>
                        <td class="TextBoxStyle">
                            <asp:FileUpload ID="TextBoxHWF" onchange="test()" runat="server" Style="display: none" CausesValidation="false" />
                            <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="150px" CausesValidation="false" CssClass="form-control" ReadOnly="True" Enabled="false"></asp:TextBox>

                        </td>
                        <td class="ErrMsgStyle">&nbsp;<asp:Button ID="Button7" CssClass="btn btn-primary" runat="server" Text="Attach" CausesValidation="false" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please upload file" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="Button2" runat="server" CssClass="btn btn-primary" OnClick="SaveBtn" Style="text-align: left" Text="Save" />
            </div>
        </form>
    </div>
</body>
</html>

