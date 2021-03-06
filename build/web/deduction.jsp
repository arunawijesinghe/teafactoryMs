<%-- 
    Document   : deduction
    Created on : Dec 29, 2015, 2:50:04 PM
    Author     : Aruna Csw
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.util.Date"%>
<%@page import="com.fims.dao.DeductionDao"%>
<%@page import="com.fims.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deduction</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link rel="stylesheet" href="bootstrap/themes/smoothness/jquery-ui.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="bootstrap/js/bootstrap.js"></script>
        <script src="bootstrap/js/SetPrice.js"></script>
        <script src="bootstrap/js/CheckDateDeduction.js"></script>

        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/style.css" rel="stylesheet">

        <script>
            $(document).ready(function () {
                $("#datepicker").datepicker();
            });
        </script> 
        <script>
            $(document).ready(function () {
                $("#datepicker1").datepicker();
            });
        </script>
        <script>
            $(document).ready(function () {
                $("#datepicker2").datepicker();
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
        
        <script type="text/javascript">
            function setTDid() {
                var d = new Date();
                var yr = d.getUTCFullYear().toString();
                var m = d.getUTCMonth() + 1;
                if (m < 10) {
                    m = "0" + m;
                }
                var sys=document.dedForm.sysid.value;
                var sid=sys.slice(3,13);
                document.dedForm.teaIssuedId.value =  yr + m+"TD"+sid;
            }

            function setFDid() {
                var d = new Date();
                var yr = d.getUTCFullYear().toString();
                var m = d.getUTCMonth() + 1;
                if (m < 10) {
                    m = "0" + m;
                }
                 var sys=document.fertiForm.fcolid.value;
                var sid=sys.slice(3,13);
                
                document.fertiForm.f_sent_id.value = yr + m+"FD"+sid ;

            }
            function setApid() {
                var d = new Date();
                var yr = d.getUTCFullYear().toString();
                var m = d.getUTCMonth() + 1;
                if (m < 10) {
                    m = "0" + m;
                }
                 var sys=document.apForm.ap_colid.value;
                var sid=sys.slice(3,13);
                document.apForm.ap_id.value =  yr + m+"AP"+sid;
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
                    DeductionDao ddo = new DeductionDao();
                    double teaRate = ddo.getMonthTeaRate();
                    double fertRate = ddo.getMonthFertilizerRate();

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
                                        <li><a href="#">Deduction</a></li>
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


            <div class="well">
                <h2>Deduction</h2>
                <div class="row">
                    <div class="col-md-6">

                        <div class="panel panel-default" draggable="true">
                            <div class="panel-body" style="background:#fff">
                                <div class="page-header">
                                    <h3><font color="#9d9d9d">Tea Details</font></h3>
                                </div><br>
                                <form method="post" action="AddTeaDeduct" name="dedForm">
                                    <table border="0">
                                        <tr><td>
                                                <label for="inputcolid">Collector Id:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="sysid" class="form-control">
                                            </td>
                                            <td>
                                                <a href="search.jsp" target="new"> <button type="button" class="btn btn-default navbar-btn" alt="Search" onClick="search.jsp" > <span class="glyphicon glyphicon-search"></span></button></a>
                                            </td>

                                            <td>
                                                <label for="inputcoldate">Date:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="date" class="form-control" placeholder="dd/mm/yyyy" id="datepicker" >
                                            </td>


                                        </tr>
                                        <tr>

                                        <tr><td>
                                                <label for="inputcolid">Tea sent Id:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="teaIssuedId" class="form-control" placeholder="auto Generate" onclick="checkDate() & setTDid()">
                                            </td>
                                            <td colspan="3"><div id="alert"></div></td>
                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid">Total Tea Weight:</label>
                                            </td>

                                            <td><div class="input-group">
                                                    <input type="text" class="form-control" name="tot_weight" onblur="setPrice()">
                                                    <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                                </div>                                </td>
                                            <td></td>

                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid">Monthly Tea rate:</label>
                                            </td>

                                            <td>
                                                <% 
                    DeductionDao.getMonthTeaRate();
                    
                                                    %>
                                                <input type="text" class="form-control" name="montrate" value="<%out.print(teaRate);%>" readonly="true">

                                            </td>
                                            <td></td>

                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid">Price:</label>
                                            </td>

                                            <td><div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1">RS.</span> 
                                                    <input type="text" class="form-control" id="residencyphone" name="price" onclick="setPrice()">
                                                </div>                                </td>
                                            <td></td>

                                        </tr>

                                    </table>
                                    <div align="center">
                                        <button type="submit" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
                                        <button type="button" class="btn btn-default navbar-btn">Print <span class="glyphicon glyphicon-print"></span></button>
                                        <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>

                                    </div>
                                </form>


                            </div>
                        </div>


                    </div>
                    <div class="col-md-6">

                        <div class="panel panel-default" draggable="true">
                            <div class="panel-body" style="background:#fff">
                                <div class="page-header">
                                    <h3><font color="#9d9d9d">Fertilizer Details</font></h3>
                                </div><br>
                                <form method="post" action="AddFertilizerDeduct" name="fertiForm">
                                    <table border="0">
                                        <tr><td>
                                                <label for="inputcolid">Collector Id:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="fcolid" class="form-control">
                                            </td>
                                            <td>
                                                <a href="search.jsp" target="new"> <button type="button" class="btn btn-default navbar-btn" alt="Search" > <span class="glyphicon glyphicon-search"></span></button></a>
                                            </td><td>
                                                <label for="inputcoldate">Date:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="date1" class="form-control" placeholder="dd/mm/yyyy" id="datepicker1">
                                            </td>
                                            <td></td>

                                        </tr>
                                        <tr>

                                        <tr><td>
                                                <label for="inputcolid">Fertilizer sent Id:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="f_sent_id" class="form-control" placeholder="auto Generate" onclick="checkDate1() & setFDid()">
                                            </td>
                                            <td colspan="3"><div id="alert1"></div></td>
                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid">Total Fertilizer Weight:</label>
                                            </td>

                                            <td><div class="input-group">
                                                    <input type="text" class="form-control" name="tot_f_weight" onblur="setPrice1()">
                                                    <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                                </div>                                </td>
                                            <td></td>

                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid">Monthly Fertilizer rate:</label>
                                            </td>

                                            <td>
                                                <input type="text" class="form-control" name="mon_f_rate" value="<%out.print(fertRate);%>" readonly="true" >

                                            </td>
                                            <td></td>

                                        </tr>
                                        <tr><td>
                                                <label for="inputcolid">Price:</label>
                                            </td>

                                            <td><div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1">RS.</span> 
                                                    <input type="text" class="form-control" name="fert_price" onclick="setPrice1()">
                                                </div>                                </td>
                                            <td></td>

                                        </tr>

                                    </table>
                                    <div align="center">
                                        <button type="submit" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
                                        <button type="button" class="btn btn-default navbar-btn">Print <span class="glyphicon glyphicon-print"></span></button>
                                        <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>

                                    </div>
                                </form>


                            </div>
                        </div>


                    </div></div>
                <div class="row">
                    <div class="center-block">

                        <div class="panel panel-default" draggable="true" align="cente">
                            <div class="panel-body" style="background:#fff" align="center">
                                <div class="page-header">
                                    <h3><font color="#9d9d9d">Advance Payment Details</font></h3>
                                </div><br>
                                <form method="post" action="AddAdvancementPayment" name="apForm">
                                    <table border="0">
                                        <tr><td>
                                                <label for="inputcolid">Collector Id:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="ap_colid" class="form-control">
                                            </td>
                                            <td>
                                                <a href="search.jsp" target="new"> <button type="button" class="btn btn-default navbar-btn" alt="Search" > <span class="glyphicon glyphicon-search"></span></button></a>

                                            </td><td>
                                                <label for="inputcoldate">Date:</label>
                                            </td><td>
                                                <input type="text" name="ap_date" class="form-control" placeholder="dd//mm/yyyy" id="datepicker2">
                                            </td>


                                        </tr>

                                        <tr><td>
                                                <label for="inputcolid">Advance Payment Id:</label>
                                            </td>
                                            <td>
                                                <input type="text" name="ap_id" class="form-control" placeholder="auto Generate" onclick="setApid()">
                                            </td>
                                        </tr><tr>
                                            <td>
                                                <label for="inputcolid">Total Payment:</label>
                                            </td>

                                            <td><div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1">Rs.</span>        
                                                    <input type="text" class="form-control" name="tot_pay">
                                                    <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                                </div>                                </td>
                                            <td></td>

                                        </tr>

                                    </table>
                                    <div align="center">
                                        <button type="submit" class="btn btn-default navbar-btn">To Approval <span class="glyphicon glyphicon-envelope"></span></button>
                                        <button type="button" class="btn btn-default navbar-btn">Print <span class="glyphicon glyphicon-print"></span></button>
                                        <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>

                                    </div>
                                </form>


                            </div>
                        </div>


                    </div>      
                </div>



            </div>
        </div></div></div>
<div >

    <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





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