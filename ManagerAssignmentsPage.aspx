<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerAssignmentsPage.aspx.cs" Inherits="ManagerAssignmentsPage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ASSIGNMENT CENTRE - Assignments</title>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <link href="css/menubarmanager.css" rel="stylesheet" />
    <script>
        var app = angular.module('myApp', []);
        app.controller('HWCtrl', function ($scope) {
            $scope.user = '<%= user %>';
        });
    </script>
    <style>
        #home_img:hover {
            transform: scale(1.5);
        }

        #home_img {
            transition: 1s all;
            display: none;
        }

        #Button3 {
            display: none;
        }

        .main-menu {
            display: block;
        }

        #headline {
            margin-left: 416px;
            margin-top: -65px;
            width: 39%;
        }

        #wrapper3 {
            position: absolute;
            margin-left: -187px;
            margin-top: -92px;
        }

        #form1 {
            position: relative;
            width: 100%;
            height: 100%;
        }

        #Student2 {
            display: none;
        }

        #Student1 {
            display: block;
        }

        td {
            width: 50%;
        }

        @media only screen and (max-width: 600px), only screen and (max-device-width: 600px) {
            #Student1 {
                display: none;
            }

            #Student2 {
                display: block;
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
                width: 60%;
                margin-left: 80px;
                margin-top: -10px;
            }

            #wrapper3 {
                border: 0px ridge gray;
                position: absolute;
                width: 60%;
                height: 344px;
                margin-top: -26px;
                margin-left: -130px;
                text-align: center;
            }

            .main-menu {
                display: none;
            }

            #Button3 {
                display: block;
            }
        }
    </style>
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
            <asp:Button ID="Button1" runat="server" Style="background-color: Transparent; color: white; font-size: 20px" CssClass="btn" Text="{{user}}" CausesValidation="False" Enabled="False" />
            <asp:Button ID="Button3" runat="server" CssClass="btn btn-secondary" Text="Logout" OnClick="Button3_Click" CausesValidation="False" />
            <a href="ManagerPage.aspx">
                <img src="img/home_btn.png" id="home_img" style="width: 38px; margin-top: 28px;">
            </a>
        </div>
        <div id="headline" style="text-align: center">
            <img src="img/assign.png" style="width: 100%" />
        </div>
        <br />
        <div id="wrapper3">
            <table style="width: 100%">
                <tr>
                    <td>
                        <div style="width: 100%; height: 350px; overflow: scroll">
                            <asp:GridView ID="GridView1" OnRowCommand="GridView_OnRowCommand" BorderColor="Transparent" class="table table-striped" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" ForeColor="Black"
                                runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="tid" HeaderText="Teacher ID" ItemStyle-Width="150" SortExpression="tid" />
                                    <asp:BoundField DataField="class" HeaderText="Class" ItemStyle-Width="150" SortExpression="class" />
                                    <asp:BoundField DataField="course" HeaderText="Course" ItemStyle-Width="150" SortExpression="course" />
                                    <asp:TemplateField ShowHeader="False" HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:Button ID="Button8" runat="server" CssClass="btn btn-primary" CausesValidation="false" CommandName="DeleteT"
                                                Text="Delete" CommandArgument='<%# Eval("tid")+","+ Eval("class")+","+ Eval("course")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BackColor="White" ForeColor="Black"></HeaderStyle>
                            </asp:GridView>
                        </div>
                    </td>
                    <td>
                        <div id="Student1" style="width: 100%; height: 350px; overflow: scroll">
                            <asp:GridView ID="GridView2" OnRowCommand="GridView_OnRowCommand" BorderColor="Transparent" class="table table-striped" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" ForeColor="Black"
                                runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Id" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Student ID" ItemStyle-Width="150" SortExpression="Id" ReadOnly="True" />
                                    <asp:BoundField DataField="class" HeaderText="Class" ItemStyle-Width="150" SortExpression="class" />
                                    <asp:TemplateField ShowHeader="False" HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:Button ID="Button8" runat="server" CssClass="btn btn-primary" CausesValidation="false" CommandName="DeleteS"
                                                Text="Delete" CommandArgument='<%# Eval("Id")+","+ Eval("class")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BackColor="White" ForeColor="Black"></HeaderStyle>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [student_in_class]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="Student2" style="width: 100%; height: 350px; overflow: scroll">
                            <asp:GridView ID="GridView3" OnRowCommand="GridView_OnRowCommand" BorderColor="Transparent" class="table table-striped" HeaderStyle-BackColor="White" HeaderStyle-ForeColor="Black" ForeColor="Black"
                                runat="server" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="Id" AllowSorting="True">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Student ID" ItemStyle-Width="150" SortExpression="Id" ReadOnly="True" />
                                    <asp:BoundField DataField="class" HeaderText="Class" ItemStyle-Width="150" SortExpression="class" />
                                    <asp:TemplateField ShowHeader="False" HeaderStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:Button ID="Button8" runat="server" CssClass="btn btn-primary" CausesValidation="false" CommandName="DeleteS"
                                                Text="Delete" CommandArgument='<%# Eval("Id")+","+ Eval("class")%>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <HeaderStyle BackColor="White" ForeColor="Black"></HeaderStyle>
                            </asp:GridView>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [student_in_class]"></asp:SqlDataSource>
                    </td>
                    <td></td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [teacher_class_course]"></asp:SqlDataSource>
            <br />
            <div style="text-align: left">
                &nbsp;<asp:Button ID="Button4" runat="server" CssClass="btn btn-primary" Text="New Assignment" OnClick="NewAssignBtn" />

                &nbsp;
            </div>
        </div>
    </form>
</body>
</html>


