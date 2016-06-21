<%-- 
    Document   : dailycollection
    Created on : Dec 29, 2015, 2:02:35 PM
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
        <title>Monthly Rates</title>
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
        <script type="text/javascript">
            function rateId(){
                
                var yr = document.monthlyRate.year.value;
                var m = document.monthlyRate.month.value;
                if(m<10){m="0"+m}
                document.monthlyRate.rateid.value="R"+yr+m;
                
                
            }
            
            
            
        </script>
      
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
                <nav class="navbar navbar-pills" style="background:#9d9d9d">
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
                                        <li><a href="#">Monthly Rates</a></li>


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
                                </a>     </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
<%
            Date date = new Date();
        int month = date.getMonth() + 1;
        int year = date.getYear() + 1900;

        String sm = Integer.toString(month);
        if (month < 10) {
            sm = "0" + sm;
        }
        String rateid = "R" + year + sm;

        
Statement stm=null;
ResultSet rst=null;
String sql="select * from monthly_rate where rate_id='"+rateid+"'";
stm = DatabaseConnection.getConnection().createStatement();
rst=stm.executeQuery(sql);

while(rst.next()){

%>
            <div class="row">

                <div  align="center">
                    <div class="panel panel-default" draggable="true" align="center">
                        <div class="panel-body" style="background:#fff">
                            <div class="page-header">
                                <h3><font color="#9d9d9d">Monthly Rates</font></h3>
                            </div>
                            <form method="post" action="AddMonthlyRate" name="monthlyRate">
                                <table border="0">
                                    <tr><td>
                                            <label for="inputcolid">Year:</label>
                                        </td>

                                        <td><input type="text" class="form-control"value="<%out.print(year);%>" readonly="true">
                                        </td>
                                    <tr><td>
                                            <label for="inputcolid">Month:</label>
                                        </td>

                                        <td>
                                            <input type="text" class="form-control" value="<%out.print(month);%>" readonly="true">
                                        </td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Rate id:</label>
                                        </td>

                                        <td>
                                            <input type="text" class="form-control" name="rateid" value="<%out.print(rateid);%>"readonly="true">
                                                                 </td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Tea Leaves Rate:</label>
                                        </td>

                                        <td>
                                            <input type="text" class="form-control" value="<%out.print(rst.getDouble(4));%>"readonly="true" >
                                                                 </td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Tea Rate:</label>
                                        </td>

                                        <td>
                                            <input type="text" class="form-control" name="trate"value="<%out.print(rst.getDouble(5));%>"readonly="true">
                                                                 </td>
                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Fertilizer Rate:</label>
                                        </td>

                                        <td>
                                            <input type="text" class="form-control" name="frate"value="<%out.print(rst.getDouble(6));%>"readonly="true">
                                                                 </td>
                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Transport Rate:</label>
                                        </td>

                                        <td>
                                            <input type="text" class="form-control" name="transrate"value="<%out.print(rst.getDouble(7));%>"readonly="true">
                                                                 </td>
                                    </tr>
                                    
                               
 </table><%}%>

                                <button type="button" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
                                <button type="button" class="btn btn-default navbar-btn">Print <span class="glyphicon glyphicon-print"></span></button>
                                <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>

                            </form>


                        </div>
                    </div>


                </div></div>
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
                        + "<h1 align=\"center\">Invalid User !</h1>"
                        + "<p align=\"center\">You Must Login First &nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"index.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To Home <span class=\"glyphicon glyphicon-home\"></span></button>\n" 
                        
                        + "</a></p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
        }
    %>