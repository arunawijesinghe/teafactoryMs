<%-- 
    Document   : dailycollection
    Created on : Dec 29, 2015, 2:02:35 PM
    Author     : Aruna Csw
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.util.Date"%>
<%@page import="com.fims.model.DailyCollection"%>
<%@page import="com.fims.dao.DailyCollectionDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fims.model.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create User</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/themes/smoothness/jquery-ui.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <script src="bootstrap/js/GetTCollectionId.js"></script>
        <script src="bootstrap/js/CheckDate.js"></script>        
        <script src="bootstrap/js/GetTotalTeaCollection.js"></script>        

        <link href="bootstrap/css/style.css" rel="stylesheet">

        <script>
            $(document).ready(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <script type="text/javascript">
            function setUsername() {
                var cl_name = document.user.cl_name.value;
                document.user.u_name.value = cl_name;
            }
            function setPassword() {

                var pword = document.user.nic_no.value;
                document.user.p_word.value=pword;


            }




        </script>

        <style type="text/css">
            a:link {
                text-decoration: none;
            }
            a:visited {
                text-decoration: none;

                a:hover {
                    text-decoration: none;

                }
            }
            a:active {
                text-decoration: none;
            }
        </style>

        <%
            try {
                User user = (User) session.getAttribute("user");
                String name = user.getUsername();
                if (user.getUsername().equals(null)) {
                    out.print("<head><title>Error</title>"
                            + "<link rel=\"icon\" href=\"img/Bulbon.png\" type=\"image/png\">\n"
                            + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                            + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                            + "</head>"
                            + "<Body><div class=\"row\">"
                            + "<div class=\"well\" style=\"background:#cd3a3a\">"
                            + "<font color=\"white\">"
                            + "<h1 align=\"center\">Invalid User !</h1>"
                            + "<p align=\"center\">You Must Login First &nbsp;&nbsp;&nbsp;&nbsp;"
                            + "<button type=\"button\" class=\"btn btn-default navbar-btn\">Back To Home <span class=\"glyphicon glyphicon-home\"></span></button>\n"
                            + "</p> <hr/>\n"
                            + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                            + " </div>");
                } else {

        %>

    </head>

    <body style="background:#fff">


        <div class="container" style="background:#ebebeb">
            <div class="row">
                <nav class="navbar navbar-pills"style="background:#9d9d9d">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" ><font color="white"><b>Tea Factory Information Management</font></b></a>
                        </div>

                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li ><a href="index.jsp"><b><font color="Black">Home <span class="glyphicon glyphicon-home"></span></font></b></a></li>
                                <li><a href="registration.jsp"><b><font color="Black">Registration <span class="glyphicon glyphicon-bishop"></span></font></b></a></li>

                                <li class="dropdown">

                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><b><font color="Black">Tea Collection <span class="caret"></span></b></font></a>                                    <ul class="dropdown-menu">
                                        <li><a href="dailycollection.jsp">Daily Collection</a></li>


                                        <li role="separator" class="divider"></li>
                                        <li><a href="dailysummary.jsp">Daily Summary</a></li>

                                        <li><a href="#">Monthly Summary</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">

                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><b><font color="Black">Payments <span class="caret"></span></b></font></a>                                    <ul class="dropdown-menu">
                                        <li><a href="monthlypayment.jsp">Monthly Payments</a></li>
                                        <li><a href="transport.jsp">Transport Payments</a></li>
                                        <li><a href="deduction.jsp">Deduction</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="monthlyrate.jsp">Monthly Rates</a></li>


                                    </ul>
                                </li>
                                <li><a href="dailyjobs.jsp"><b><font color="Black">Daily Jobs <span class="glyphicon glyphicon-flag"></span></font></b></a></li>
                                <li><a href="myprofile.jsp"><b><font color="Black">My Profile <span class="glyphicon glyphicon-user"></span></font></b></a></li>


                                <li>
                                    <form class="navbar-form navbar-right" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search">
                                        </div>
                                        <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>

                                    </form></li>
                                <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li><a href="Logout">
                                    <button type="button" class="btn btn-default navbar-btn">Logout <span class="glyphicon glyphicon-log-out"></span></button>
                                </a></li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>

            <div class="row">

                <div  align="center">
                    <div class="panel panel-default" draggable="true" align="center">
                        <div class="panel-body" style="background:#fff">
                            <div class="col-md-3">

                            </div>
                            <div class="col-md-6">
                                <div class="page-header">
                                    <h3><font color="#9d9d9d">Enter User Details    <img src="img/icons/Users.png">
                                        </font></h3>


                                </div>
                                <form method="post" action="AddUser" name="user">
                                    <table border="0" class="table table-hover">
                                        <tr>

                                            <td><img src="img/icons/Contact.png">
                                                <label for="inputcolid">   NIC No:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="nic_no" class="form-control" required="true" maxlength="10">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label><img src="img/icons/Finder.png">    Full Name:</label></td><td>
                                                <input type="text" name="full_name" class="form-control" required="true">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label><img src="img/icons/Mail.png">     E mail Address:</label></td><td>
                                                <input type="email" name="email" class="form-control">
                                            </td>
                                        </tr>
                                        <tr><td>
                                                <label for="cl_name">Calling Name:</label>
                                            </td>

                                            <td>
                                                <input type="text" name="cl_name" class="form-control">
                                            </td>
                                            <td></td>

                                        </tr>
                                        <tr>
                                            <td><label>User Role</label></td>
                                            <td>
                                                <select name="role" class="form-control">
                                                    <option value="admin">Administrator</option>
                                                    <option value="user">User</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid"><img src="img/icons/User.png">     User name:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="u_name" class="form-control" onclick="setUsername()">
                                            </td>


                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid"><img src="img/icons/Lock Open.png">     Password:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="p_word" class="form-control" onclick="setPassword()">
                                            </td>


                                        </tr>

                                    </table>

                                    <button type="submit" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
                                    <button type="button" class="btn btn-default navbar-btn" onclick="window.print()">Print <span class="glyphicon glyphicon-print"></span></button>
                                    <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>


                                </form>


                            </div>
                        </div>


                    </div></div>

                <script src="bootstrap/js/bootstrap.min.js"></script>
                </body>
                </html>
                <%        }
                    } catch (NullPointerException e) {
                        out.print("<head><title>Error</title>"
                                + "<link rel=\"icon\" href=\"img/Bulbon.png\" type=\"image/png\">\n"
                                + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                                + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                                + "</head>"
                                + "<Body><div class=\"row\">"
                                + "<div class=\"well\" style=\"background:#cd3a3a\">"
                                + "<font color=\"white\">"
                                + "<h1 align=\"center\">Invalid User ! catch</h1>" + e
                                + "<p align=\"center\">You Must Login First &nbsp;&nbsp;&nbsp;&nbsp;"
                                + "<a href=\"index.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To Home <span class=\"glyphicon glyphicon-home\"></span></button>\n"
                                + "</a></p> <hr/>\n"
                                + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                                + " </div>");
                    }
                %>