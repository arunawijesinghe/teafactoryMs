<%-- 
    Document   : dailycollection
    Created on : Dec 29, 2015, 2:02:35 PM
    Author     : Aruna Csw
--%>

<%@page import="java.util.Date"%>
<%@page import="com.fims.dao.DeductionDao"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transport Payment</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/themes/smoothness/jquery-ui.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <link href="bootstrap/css/style.css" rel="stylesheet">

        <script>
            $(document).ready(function () {
                $("#datepicker").datepicker();
            });
        </script>
        <script type="text/javascript">
            function setTPid() {
                var d = new Date();
                var yr = d.getUTCFullYear().toString();
                var m = d.getUTCMonth() + 1;
                if (m < 10) {
                    m = "0" + m;
                }
                document.transport.trans_id.value = "TP" + yr + m;
            }
            </script>
            <script type="text/javascript">
            function setPrice() {
                var tot = document.transport.tot.value;
                var mtr = document.transport.mrate.value;

                document.transport.price.value = tot * mtr;


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
            DeductionDao ddo = new DeductionDao();
                    double teaLRate = ddo.getMonthTeaLeavesRate();
                    
                    
                    String systemId=request.getParameter("sysid");
                    String date=request.getParameter("date");
                    String transportId=request.getParameter("trans_id");

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
                                        <li><a href="#">Transport Payments</a></li>
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
                                <h3><font color="#9d9d9d">Monthly Transport Payment</font></h3>
                            </div>
                            <form method="post" action="AddTransport" name="transport">
                                <table border="0">
                                    <tr><td>
                                            <label for="inputcolid">Collector Id:</label>
                                        </td>
                                        <td>
                                            <input type="text" name="sysid" class="form-control" value="<%out.print(systemId);%>">
                                        </td>
                                        <td>

                                        </td>
                                        <td>&nbsp;</td><td>
                                            <label for="inputcoldate">Date:</label>
                                        </td>
                                        <td>
                                            <input  name="date" class="form-control" value="<%out.print(date);%>">
                                        </td>


                                    </tr>


                                    <tr><td>
                                            <label for="inputcolid">Transport Id:</label>
                                        </td>
                                        <td>
                                            <input type="text" name="trans_id" class="form-control" value="<%out.print(transportId);%>">
                                        </td>
                                        <td>
                                            <label class="form-control alert">Generated</label>
                                            
                                        </td>

                                    </tr>
                                    <tr>
                                        
                                        <td>
                                            <label for="inputcolid">Total Tea Weight:</label>
                                        </td>
                                        <%
                                            Date d = new Date();
                                             String sday = "1";
                                             String eday="31";
                                             int month = d.getMonth() + 1;
                                             int year = d.getYear();
                                             
                                             String sm = Integer.toString(month);
                                             if (month < 10) {
                                             sm = "0" + sm;
                                             }
                                             String startday =(year + 1900)+"/"+sm+"/"+sday;
                                             String endDay=(year + 1900)+"/"+sm+"/"+eday;  
                                             
                                              Statement stm=null;
                                              ResultSet rst=null;
       
                                              stm= DatabaseConnection.getConnection().createStatement();
                                              
                                              
       
                                              String sql="SELECT * FROM `daily_collection` WHERE `system_id`='"+systemId+"' AND `date` BETWEEN '"+startday+"' AND '"+endDay+"' ";
                                              //String sql1="SELECT SUM (net_weight) ";
                                              rst=stm.executeQuery(sql);
                                              double tot=0.0;
                                              while(rst.next()){
           
                                                  tot=tot+rst.getDouble(6);
                                              }%>
                                        <td><div class="input-group">
                                                <input type="text" class="form-control" name="tot" value="<%out.print(tot);%>" readonly="false" >
                                                <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                            </div>                                </td>
                                        <td></td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Monthly Tea Rate:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs.</span> 
                                                <input type="text" class="form-control" name="mrate" value="<%out.print(teaLRate);%>" readonly="false">
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>

                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Total Payment:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs.</span> 
                                                <input type="text" class="form-control" name="price" onclick="setPrice()">
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>

                                    </tr>

                                </table>

                                <button type="submit" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
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