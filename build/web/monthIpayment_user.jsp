<%-- 
    Document   : monthlypayment
    Created on : Dec 29, 2015, 4:18:40 PM
    Author     : Aruna Csw
--%>

<%@page import="java.util.Date"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monthly Payment</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="bootstrap/themes/smoothness/jquery-ui.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/style.css" rel="stylesheet">

        <script>
            $(document).ready(function () {
                $("#datepicker").datepicker();
            });
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

                                        <li><a href="#">Monthly Summary</a></li>
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
                                </a>    </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
            <div class="well">
                <div class="row">
                    <h2>Monthly Payment</h2>
                    <%                        String sys_id = request.getParameter("sysid");
                        String date = request.getParameter("date");
                        String pay_id = request.getParameter("payId");

                        String month = request.getParameter("month");

//set total tea leaves weight
                        Date d = new Date();
                        String sday = "1";
                        String eday = "31";
                        int year = d.getYear();

                        String startday = (year + 1900) + "/" + month + "/" + sday;
                        String endDay = (year + 1900) + "/" + month + "/" + eday;

                        Statement stm = null;
                        ResultSet rst = null;

                        stm = DatabaseConnection.getConnection().createStatement();

                        String sql = "SELECT * FROM `daily_collection` WHERE `system_id`='" + sys_id + "' AND `date` BETWEEN '" + startday + "' AND '" + endDay + "' ";
                        //String sql1="SELECT SUM (net_weight) ";
                        rst = stm.executeQuery(sql);
                        double tot = 0.0;
                        while (rst.next()) {

                            tot = tot + rst.getDouble(6);
                        }

                        //set monthly Rate id 
                        String rateid = "R" + (year + 1900) + month;

                        //get total tea weightdetails
                        Statement stm1 = null;
                        ResultSet rst1 = null;
                        String sql1 = "select * from monthly_rate where rate_id='" + rateid + "'";
                        stm1 = DatabaseConnection.getConnection().createStatement();
                        rst1 = stm1.executeQuery(sql1);
                        double tea_l_rate = 0.0;
                        double trans_rate=0.0;
                        while (rst1.next()) {
                            tea_l_rate = rst1.getDouble(4);
                            trans_rate = rst1.getDouble(7);
                        }

                        //get total value of issued tea
                        String tsent_id = "TD" + (year + 1900) + month;
                        Statement stm2 = null;
                        ResultSet rst2 = null;
                        String sql2 = "select * from tea_deduction where tea_issued_id='" + tsent_id + "' and system_id='"+sys_id+"'";
                        stm2 = DatabaseConnection.getConnection().createStatement();
                        rst2 = stm2.executeQuery(sql2);
                        double tea_rate = 0.0;
                        while (rst2.next()) {
                            tea_rate = rst2.getDouble(6);

                        }
                        
                        //get fertilizer value
                         String fsent_id ="FD" + (year + 1900) + month;
                        Statement stm3 = null;
                        ResultSet rst3 = null;
                        String sql3 = "select * from fertilier_deduction where fsent_id='" + fsent_id + "' and system_id='"+sys_id+"'";
                        stm3 = DatabaseConnection.getConnection().createStatement();
                        rst3 = stm3.executeQuery(sql3);
                        double ferti_rate = 0.0;
                        while (rst3.next()) {
                            ferti_rate = rst3.getDouble(6);

                        }
                         //get Advancement payment value
                         String ap_id ="AP" + (year + 1900) + month;
                         String status="Approved";
                        Statement stm4 = null;
                        ResultSet rst4 = null;
                        String sql4 = "select * from advancement_payment where ap_id='" + ap_id + "' and system_id='"+sys_id+"' and status='"+status+"'";
                        stm4 = DatabaseConnection.getConnection().createStatement();
                        rst4 = stm4.executeQuery(sql4);
                        double apay = 0.0;
                        while (rst4.next()) {
                            apay = rst4.getDouble(2);

                        }
                    %>
                    <form method="post" action="AddMonthlyPayment">

                        <table border="0">
                            <tr>
                                <td>
                                    <label for="inputcolid">Collector Id:</label>
                                </td>
                                <td>
                                    <input type="text" name="sysid" class="form-control" value="<%out.print(sys_id);%>" readonly="false">
                                </td>
                                <td>
                                    <a href="search.jsp" target="new"> <button type="button" class="btn btn-default navbar-btn" alt="Search" > <span class="glyphicon glyphicon-search"></span></button></a>

                                </td>
                                <td>
                                    <label for="inputcoldate">Date:</label>
                                </td>
                                <td>
                                    <input  name="date" class="form-control" value="<%out.print(date);%>" readonly="false">
                                </td>


                            </tr>
                            <tr><td>
                                    <label for="inputcolid">Payment Id:</label>
                                </td>

                                <td>
                                    <input type="text" class="form-control" name="payid" value="<%out.print(pay_id);%>" readonly="false" >

                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>


                                <td>        <button type="button" class="btn btn-success">Generated <span class="glyphicon glyphicon-ok-circle"></span></button>
                                </td>

                            </tr>


                        </table>
                        <hr>
                        </div>
                        <div class="row">
                            <div class="col-md-4">

                                <div class="panel panel-default" draggable="true">
                                    <div class="panel-body" style="background:#fff">
                                        <div class="page-header">
                                            <h3><font color="#9d9d9d">Tea Details</font></h3>
                                        </div><br>

                                        <table border="0">
                                            <tr><td>
                                                    <label for="inputcolid">Total Tea Weight:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <input type="text" class="form-control" name="tot_tl_weight" value="<%out.print(tot);%>" readonly="false">
                                                        <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                                    </div>                                </td>
                                                <td></td></tr>
                                            <tr><td>
                                                    <label for="inputcolid">Monthly Tea Rate:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" id="residencyphone" value="<%out.print(tea_l_rate);%>" readonly="false">
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>


                                            <tr><td>
                                                    <label for="inputcolid">Total Value Of tea Leaves:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" name="tot_tl_value" value="<%out.print(tea_l_rate * tot);%>" readonly="false" >
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>

                                        </table>
                                    </div>





                                </div>


                            </div>
                            <div class="col-md-4">

                                <div class="panel panel-default" draggable="true">
                                    <div class="panel-body" style="background:#fff">
                                        <div class="page-header">
                                            <h3><font color="#9d9d9d">Deduction Details</font></h3>
                                        </div><br>

                                        <table border="0">
                                            <tr><td>
                                                    <label for="inputcolid">Total Value Of tea:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" name="tot_t_value" value="<%out.print(tea_rate);%>" >
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>
                                            <tr><td>
                                                    <label for="inputcolid">Issued Fertilizer value:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" value="<%out.print(ferti_rate);%>" name="tot_f_value">
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>


                                            <tr><td>
                                                    <label for="inputcolid">Issued Advance Payment:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" value="<%out.print(apay);%>" name="ad_pay" >
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>
                                            <tr><td>
                                                    <label for="inputcolid">Total Deduction :</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" value="<%out.print(tea_rate+ferti_rate+apay);%>" name="tot_deduct">
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>

                                        </table>
                                    </div>





                                </div>


                            </div>
                            <div class="col-md-4">

                                <div class="panel panel-default" draggable="true">
                                    <div class="panel-body" style="background:#fff">
                                        <div class="page-header">
                                            <h3><font color="#9d9d9d">Monthly Transport Details</font></h3>
                                        </div><br>
                                        <table border="0">
                                            <tr><td>
                                                    <label for="inputcolid">Total Tea Weight:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <input type="text" class="form-control" value="<%out.print(tea_l_rate);%>" >
                                                        <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                                    </div>                                </td>
                                                <td></td></tr>
                                            <tr><td>
                                                    <label for="inputcolid">Monthly Transport Rate:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" value="<%out.print(trans_rate);%>" >
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>


                                            <tr><td>
                                                    <label for="inputcolid">Total Value for Transport:</label>
                                                </td>

                                                <td><div class="input-group">
                                                        <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                        <input type="text" class="form-control" value="<%out.print(tea_l_rate*trans_rate);%>" name="tot_trans">
                                                        <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                    </div>                                </td>
                                                <td></td>
                                            </tr>

                                        </table>
                                    </div>





                                </div>


                            </div>
                        </div>
                                                        <div>
                                                            <table>
                                                                <tr>
                                                                    <td>Total Payment :</td>
                                                                    <%
                                                                    double tottl=tea_l_rate * tot;
                                                                    
                                                                    double totdeduct=tea_rate+ferti_rate+apay;
                                                                    double tottrans=tea_l_rate*trans_rate;
                                                                    %>
                                                                    <td><input type="text" value="<%out.print((tottl+tottrans)-totdeduct);%>" name="net_pay"></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                        <div align="center">
                            <button type="submit" class="btn btn-default navbar-btn">To Approval <span class="glyphicon glyphicon-envelope"></span></button>
                            <button type="button" class="btn btn-default navbar-btn">Print <span class="glyphicon glyphicon-print"></span></button>
                            <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>

                     
                        
                        </div>
                    </form>

                </div>   
                <div>
                    <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





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
                + "<h1 align=\"center\">Invalid User !</h1>"
                + "<p align=\"center\">You Must Login First &nbsp;&nbsp;&nbsp;&nbsp;"
                + "<a href=\"index.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To Home <span class=\"glyphicon glyphicon-home\"></span></button>\n"
                + "</a></p> <hr/>\n"
                + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                + " </div>");
    }
%>