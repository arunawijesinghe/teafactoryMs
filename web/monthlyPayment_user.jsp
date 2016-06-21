<%-- 
    Document   : monthlypayment
    Created on : Dec 29, 2015, 4:18:40 PM
    Author     : Aruna Csw
--%>

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
        <script type="text/javascript">
            function setTPid() {
                var d = new Date();
                var yr = d.getUTCFullYear().toString();
                var m = document.mpay.month.value;
                var sys=document.mpay.sysid.value;
                var sid=sys.slice(3,13);
                document.mpay.payId.value =  yr + m+"MP"+sid;
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
                    <form method="post" name="mpay" action="monthIpayment_user.jsp">

                        <table border="0">
                            <tr><td>
                                    <label for="inputcolid">Collector Id:</label>
                                </td>
                                <td>
                                    <input type="text" name="sysid" class="form-control">
                                </td>
                                <td>
                                    <a href="search.jsp" target="new"> <button type="button" class="btn btn-default navbar-btn" alt="Search" > <span class="glyphicon glyphicon-search"></span></button></a>


                                <td>
                                    <label for="inputcoldate">Date:</label>
                                </td>
                                <td>
                                    <input  name="date" class="form-control" id="datepicker">
                                </td>
                                <td><label for="month">Payment Month</label></td>
                                <td>
                                    <select name="month">
                                        <option value="01">January</option>
                                        <option value="02">February</option>
                                        <option value="03">March</option>
                                        <option value="04">April</option>
                                        <option value="05">May</option>
                                        <option value="06">June</option>
                                        <option value="07">July</option>
                                        <option value="08">August</option>
                                        <option value="09">September</option>
                                        <option value="10">October</option>
                                        <option value="11">November</option>
                                        <option value="12">December</option>
                                    </select>
                                </td>



                            </tr>
                            <tr><td>
                                    <label for="inputcolid">Payment Id:</label>
                                </td>

                                <td>
                                    <input type="text" class="form-control" name="payId" onclick="setTPid()">

                                </td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td>        <button type="submit" class="btn btn-default navbar-btn">Generate <span class="glyphicon glyphicon-arrow-right" ></span></button>
                                </td>
                            </tr>


                        </table>
                    </form>
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
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                            </div>                                </td>
                                        <td></td></tr>
                                    <tr><td>
                                            <label for="inputcolid">Monthly Tea Rate:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>
                                    </tr>


                                    <tr><td>
                                            <label for="inputcolid">Total Value Of tea:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                <input type="text" class="form-control" id="residencyphone" >
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
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>
                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Issued Fertilizer value:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>
                                    </tr>


                                    <tr><td>
                                            <label for="inputcolid">Issued Advance Payment:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>
                                    </tr>
                                    <tr><td>
                                            <label for="inputcolid">Total Deduction :</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                <input type="text" class="form-control" id="residencyphone" >
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
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">Kg</span>                           
                                            </div>                                </td>
                                        <td></td></tr>
                                    <tr><td>
                                            <label for="inputcolid">Monthly Transport Rate:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>
                                    </tr>


                                    <tr><td>
                                            <label for="inputcolid">Total Value for Transport:</label>
                                        </td>

                                        <td><div class="input-group">
                                                <span class="input-group-addon" id="basic-addon1">Rs:</span>
                                                <input type="text" class="form-control" id="residencyphone" >
                                                <span class="input-group-addon" id="basic-addon1">.00</span>                           
                                            </div>                                </td>
                                        <td></td>
                                    </tr>

                                </table>
                            </div>





                        </div>


                    </div>
                </div>
                <div align="center">
                    <button type="button" class="btn btn-default navbar-btn">To Approval <span class="glyphicon glyphicon-envelope"></span></button>
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