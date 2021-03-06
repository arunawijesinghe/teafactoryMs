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
        <title>Daily Tea Collection</title>
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
                                <li><a href="registration_user.jsp"><b><font color="Black">Registration <span class="glyphicon glyphicon-bishop"></span></font></b></a></li>

                                <li class="dropdown">

                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><b><font color="Black">Tea Collection <span class="caret"></span></b></font></a>                                    <ul class="dropdown-menu">
                                        <li><a href="dailyCollection_user.jsp">Daily Collection</a></li>


                                        <li role="separator" class="divider"></li>
                                        <li><a href="#">Daily Summary</a></li>

                                        <li><a href="monthlysummery.jsp">Monthly Summary</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">

                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><b><font color="Black">Payments <span class="caret"></span></b></font></a>                                    <ul class="dropdown-menu">
                                        <li><a href="monthlyPayment_user.jsp">Monthly Payments</a></li>
                                        <li><a href="transport_user.jsp">Transport Payments</a></li>
                                        <li><a href="deduction_user.jsp">Deduction</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="monthlyRate_user.jsp">Monthly Rates</a></li>


                                    </ul>
                                </li>
                                <li><a href="dailyjobs_user.jsp"><b><font color="Black">Daily Jobs <span class="glyphicon glyphicon-flag"></span></font></b></a></li>
                                <li><a href="myProfile_user.jsp"><b><font color="Black">My Profile <span class="glyphicon glyphicon-user"></span></font></b></a></li>


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
                            <div class="page-header">
                                <h3><font color="#9d9d9d">Daily Tea Collection</font></h3>
                            </div>
                            <form method="post" action="DailyCollection" name="dailyCollection">
                                <table border="0">
                                    <tr><td>
                                            <label for="inputcolid">System Id:</label>
                                        </td>
                                        <td>
                                            <input type="text" name="sysid" class="form-control" required="true">
                                        </td>
                                        <td><a href="search.jsp" target="new">
                                                <button type="button" class="btn btn-default navbar-btn" alt="Search" onClick="search.jsp" > <span class="glyphicon glyphicon-search"></span></button></a>

                                        </td>
                                        <td>&nbsp;</td><td>
                                            <label for="inputcoldate">Date:</label>
                                        </td>
                                        <% /*                                           Date date = new Date();
                                             int day = date.getDate();
                                             int month = date.getMonth() + 1;
                                             int year = date.getYear();
                                             String sday = Integer.toString(day);
                                             if (day < 10) {
                                             sday = "0" + sday;
                                             }
                                             String sm = Integer.toString(month);
                                             if (month < 10) {
                                             sm = "0" + sm;
                                             }
                                             String fulldate = sm + "/" + sday + "/" + (year + 1900);

                                             */%>
                                        <td>

                                            <input type="text" name="date" class="form-control" placeholder="dd/mm/yyyy" id="datepicker" onclick="checkDate1()" >
                                        </td>
                                        <td>Daily Collection Index:</td>
                                        <td>
                                            <select class="form-control" name="index" onblur="setTcolid()" onclick="checkDate1()">
                                                <%
                                                    for (int i = 1; i < 251; i++) {
                                                        out.print("<option value=" + i + ">" + i + "</option>");
                                                    }
                                                %>
                                            </select>
                                        </td>


                                    </tr>
                                    <tr>

                                    <tr><td>
                                            <label for="inputcolid">Collection Id:</label>
                                        </td>
                                        <td>
                                            <input type="text" name="collection_id" class="form-control" placeholder="auto Generate" onclick="setTcolid()">
                                        </td>
                                        <td colspan="4"><div id="alert1"></div></td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Total Tea Weight:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <input type="text" class="form-control" name="total_weight" >
                                                <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                            </div>                                </td>
                                        <td></td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Deducted Tea Weight:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <input type="text" class="form-control" name="deduct_weight" onblur="setNetWeight()" onC>
                                                <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                            </div>                                </td>
                                        <td></td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Net Tea Weight:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <input type="text" class="form-control" name="net_weight" onclick="setNetWeight()">
                                                <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                            </div>                                </td>
                                        <td></td>

                                    </tr>

                                </table>

                                <button type="submit" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
                                <button type="button" class="btn btn-default navbar-btn" onclick="window.print()">Print <span class="glyphicon glyphicon-print"></span></button>
                                <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>


                            </form>


                        </div>
                    </div>


                </div></div>
            <div class="row">

                <div  style="background:#999">
                    <table class="table table-responsive">
                        <tr>
                            <td><font color="white">collection Id     </font></td>
                            <td><font color="white">Collector Id    </font></td>
                            <td><font color="white">Collector Name     </font></td>
                            <td><font color="white">Total Tea Amount (Kg)    </font></td>
                            <td><font color="white">Deduct tea amount (Kg)    </font></td>
                            <td><font color="white">Net Tea amount  (Kg)   </font></td>
                        </tr>
                        <%
                            Date date = new Date();
                            int day = date.getDate();
                            int month = date.getMonth() + 1;
                            int year = date.getYear();
                            String sday = Integer.toString(day);
                            if (day < 10) {
                                sday = "0" + sday;
                            }
                            String sm = Integer.toString(month);
                            if (month < 10) {
                                sm = "0" + sm;
                            }
                            String fulldate = (year + 1900) + "-" + sm + "-" + sday;
                            Statement stm = null;
                            ResultSet rst = null;
                            Statement stm1 = null;
                            ResultSet rst1 = null;

                            String sql = "SELECT * FROM `daily_collection` where date='" + fulldate + "' order by `collection_id` ASC";
                            stm = DatabaseConnection.getConnection().createStatement();
                            rst = stm.executeQuery(sql);

                            while (rst.next()) {


                        %>

                        <tr>
                            <td><font color="Green"><% out.print(rst.getString(3));%></font></td>
                            <td><% out.print(rst.getString(1));%></td>
                            <%
                                String sysid = rst.getString(1);
                                String sql1 = "select fullname from registration where system_id='" + sysid + "' ";
                                stm1 = DatabaseConnection.getConnection().createStatement();
                                rst1 = stm1.executeQuery(sql1);
                                while (rst1.next()) {%><td><% out.print(rst1.getString(1));%></td><%}%>

                            <td><% out.print(rst.getString(4));%></td>
                            <td><% out.print(rst.getString(5));%></td>
                            <td><% out.print(rst.getString(6));%></td><%}%></tr>
                    </table>

                    <table>
                        <%
                            Statement stm2 = null;
                            ResultSet rst2 = null;
                            double tot = 0;
                            String sql2 = "SELECT SUM(net_weight)FROM daily_collection where date='" + fulldate + "'";
                            stm2 = DatabaseConnection.getConnection().createStatement();
                            rst2 = stm2.executeQuery(sql2);
                            while (rst2.next()) {
                                double c = rst2.getDouble(1);

                                tot = tot + c;

                        %>
                        <tr><td>Total Received Tea Weight</td>
                            <td> </td>
                            <td align="center"><font color="Red"><%out.print("      " + tot + " Kg");%></font></td>
                        </tr>

                        <% }
                        %>

                    </table>                                



                </div>
                <div >

                    <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





                </div>
            </div>
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