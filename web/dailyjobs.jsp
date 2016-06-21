<%-- 
    Document   : dailycollection
    Created on : Dec 29, 2015, 2:02:35 PM
    Author     : Aruna Csw
--%>

<%@page import="com.fims.model.DailyJobsApproval"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Daily Jobs</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/themes/smoothness/jquery-ui.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <link href="bootstrap/css/style.css" rel="stylesheet">


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
                                        <li><a href="#">Daily Summary</a></li>

                                        <li><a href="monthlysummery.jsp">Monthly Summary</a></li>
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
                                <li><a href="#"><b><font color="Black">Daily Jobs <span class="glyphicon glyphicon-flag"></span></font></b></a></li>
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
                <div class="well">
                    <table class="table table-hover" align="center">
                        <tr>
                            <th>Date</th>
                            <th>Collector Id</th>
                            <th>Payment Id</th>
                            <th>Total Pay</th>
                            <th>Status</th>
                            <th colspan="2">Approve/Reject</th>
                        </tr>
                        <tr>
                            <th colspan="6" algin="center" class="bg-success">
                                Monthly Payment
                            </th>
                        </tr>
                        <tr>
                        <td></td>
                    </tr>
                         <tr>
                        <%  
                            Statement stm1 = null;
                            ResultSet rst1 = null;
                            String status = "pending";
                            String sql1 = "select * from monthly_payment  order by date desc";
                                  //  + ";
                            stm1 = DatabaseConnection.getConnection().createStatement();
                            rst1 = stm1.executeQuery(sql1);
                            while (rst1.next()) {

                        %>
                       
                        <form method="post" action="ApproveMonthlyPayment">
                            <td><%out.print(rst1.getDate(2));%>"</td>
                            <td><input type="text" class="form-control " value="<%out.print(rst1.getString(1));%>" readonly="true"></td>
                            <td ><input type="text" name="mp_id" class="form-control" value="<%out.print(rst1.getString(3));%> " readonly="false"></td>
                            <td><input type="text" name ="pay" class="form-control" value="<%out.print(rst1.getString(11));%> "></td>
                            <td><input type="text" class="form-control" value="<%out.print(rst1.getString(12));%> " readonly="true"></td>
                            
                            <% String statue1=rst1.getString(12);
                            if(statue1.equalsIgnoreCase("pending")){
                            
                            %>
                            <td><input type="submit" class="btn btn-success" value="Approve" name="action"> 
                                </td> 
                            <td><input type="submit" class="btn btn-danger" value="Reject" name="action"></td>
                          <%}%>    </form>
                    </tr><%}%>
                    <tr>
                        <td></td>
                    </tr>
                        <tr>
                            <th colspan="6" algin="center" class="bg-success">
                                Advancement Payment
                            </th> </tr>
                         <tr>
                        <%  
                            Statement stm = null;
                            ResultSet rst = null;
                            //String status = "pending";
                            String sql = "select * from advancement_payment order by date desc";
                                  //  + ";
                            stm = DatabaseConnection.getConnection().createStatement();
                            rst = stm.executeQuery(sql);
                            while (rst.next()) {

                        %>
                       
                        <form method="post" action="ApproveDailyJob">
                            <td><%out.print(rst.getDate(3));%>"</td>
                            <td><input type="text" class="form-control " value="<%out.print(rst.getString(1));%>" readonly="true"></td>
                            <td ><input type="text" name="ap_id" class="form-control" value="<%out.print(rst.getString(4));%> " readonly="false"></td>
                            <td><input type="text" name ="payment" class="form-control" value="<%out.print(rst.getString(2));%> "></td>
                            <td><input type="text" class="form-control" value="<%out.print(rst.getString(5));%> " readonly="true"></td>
                            <% String statue=rst.getString(5);
                            if(statue.equalsIgnoreCase("pending")){
                            
                            %>
                            <td><input type="submit" class="btn btn-success" value="Approve" name="action"> 
                                </td> 
                            <td><input type="submit" class="btn btn-danger" value="Reject" name="action"></td>
                          <%}%>    
                        </form>
                       
                    </tr><%}%>
                         
                              
                    </table>   
                </div>

            </div>
            <div >

                <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





            </div>
        </div>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
<%        }
    }catch (NullPointerException e) {
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