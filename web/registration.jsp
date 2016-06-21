<%@page import="java.util.Date"%>
<%@page import="com.fims.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="bootstrap/css/style.css" rel="stylesheet">
        <script type="text/javascript">

function checknic(){
var input=document.reg.cusNic.value;
if(input.length!==10){alert("Invalid Nic No")
    }
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

        <script type="text/javascript">
            function generateId() {
                var custype;
                var custype = document.reg.cusType.value;
                if (custype === "Cul") {
                    custype1 = "CUL";
                } else {
                    custype1 = "COL";
                }
                var dayindex = document.reg.dayindex.value;
                if (dayindex < 10) {
                    dayindex = "0" + dayindex;
                }
                var d = new Date();
                var day = d.getUTCDate().toString();
                if (day < 10) {
                    day = "0" + day;
                }
                var month = d.getUTCMonth() + 1;
                if (month < 10) {
                    month = "0" + month;
                }
                var year = d.getUTCFullYear().toString();
                sysid = custype1 + year + month + day + dayindex;
               // alert("System Id : " + sysid);

                document.reg.sysId.value = sysid;


            }
//-->
        </script>
       

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
                                        <li><a href="#">Monthly Rates</a></li>


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
                                </a>   </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>

            <div class="well">
                <h2 >Registration Form       </h2>
                <form method="post" action="verifyRegistration.jsp"class="form-group" name="reg">
                    <div class="row">
                        <div class="col-md-6">

                            <div class="panel panel-default" draggable="true">
                                <div class="panel-body" style="background:#fff">
                                    <div class="page-header">
                                        <h3><font color="#9d9d9d">Personal Details</font></h3>
                                    </div><br>
                                    <table border="0" align="center">
                                        <tr>
                                            <td><label for="selectcustype" >Customer Type:</label></td>
                                            <td><select class="form-control" name="cusType">
                                                    <option value="Cul">Cultivator</option>
                                                    <option value="Col">Collector</option> 
                                                </select></td>
                                            <td><label for="selectcustype" >Daily Index:</label></td>
                                            <td><select class="form-control" name="dayindex"  Onblur="generateId()">
                                                    <%                                                        for (int i = 1; i < 101; i++) {
                                                            out.print("<option ='" + i + "'>" + i + "</option>");
                                                        }

                                                    %>

                                                </select></td>
                                                <%   
                                                   /* String custype = request.getParameter("cusType");
                                                    if (custype == "Col") {
                                                        custype = "COL";
                                                    } else {
                                                        custype = "CUL";
                                                    }
                                                    String ndex = request.getParameter("dayindex");
                                                    Date date = new Date();
                                                    int day = date.getDate();

                                                    int month = date.getMonth() + 1;

                                                    int year = date.getYear() + 1900;

                                                    String day1 = (Integer.toString(day));
                                                    if (day < 10) {
                                                        day1 = "0" + 1;
                                                    }
                                                    String month1 = (Integer.toString(month));
                                                    if (month < 10) {
                                                        month1 = "0" + 1;
                                                    }
                                                    String year1 = (Integer.toString(year));

                                                    String sysid =  custype+year1+month1+day1;*/
                                                %>

                                        </tr>

                                        <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                        <tr>
                                            <td><label for="inputsysid">System Id:</label></td>
                                            <td><input type="text" class="form-control" name="sysId"  placeholder="will be Generate"  required="true">
                                            </td>

                                        </tr>
                                        <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;</td></tr>

                                        <tr>
                                            <td><label for="inputnic">Customer NIC No:</label></td>
                                            <td><input type="text" class="form-control " name="cusNic" placeholder="National Identity Card" required="true" onblur="checknic()">



                                        </tr>
                                        <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;</td></tr>

                                        <tr>
                                            <td><label for="inputfullname">Full Name:</label></td>
                                            <td><input type="text" class="form-control " name="cusFullName" placeholder="Full Name">



                                        </tr>

                                        <tr>
                                            <td><label for="inputnameinitials">Name With Initials:</label></td>
                                            <td><input type="text" class="form-control " name="cusNwithIni" required="true">



                                        </tr>
                                        <tr>
                                            <td><label for="inputnameinitials">Gender:</label></td>
                                            <td align="left"><input type="radio"  name="gender" value="m"> male
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="radio"  name="gender" value="f"> female</td>

                                            <td>&nbsp;&nbsp;&nbsp;</td>


                                        </tr>


                                    </table>

                                </div>



                            </div>
                        </div>
                        <div class="col-md-6">

                            <div class="panel panel-default" draggable="true">
                                <div class="panel-body" style="background:#fff">
                                    <div class="page-header">
                                        <h3><font color="#9d9d9d">Contact Details</font></h3>
                                    </div><br>
                                    <table border="0" align="center">
                                        <tr>
                                            <td>Address:</td>
                                            <td><input type="text" class="form-control" name="address_homeno"placeholder="Home No/Name"></td>
                                        </tr>
                                        <tr><td></td>
                                            <td><input type="text" name="street" class="form-control "placeholder="Street"></td>
                                        </tr>
                                        <tr><td></td>
                                            <td><input type="text" class="form-control " name="address_city1" placeholder="City 1"></td>
                                        </tr>
                                        <tr><td></td>
                                            <td><input type="text" class="form-control " name="address_city2" placeholder="City 2"></td>
                                        </tr>

                                        <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                        <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                        <tr>
                                            <td><label for="inputsysid">TelePhone No:</label></td>
                                            <td><div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-phone-alt"></span></span>                           
                                                    <input type="text" class="form-control" name="residencyphone" placeholder="Residency" ></div>

                                            </td>

                                        </tr>
                                        <tr><td></td>
                                            <td><div class="input-group">
                                                    <span class="input-group-addon" id="basic-addon1"><span class="glyphicon glyphicon-phone"></span></span>                           
                                                    <input type="text" class="form-control" name="mobilephone" placeholder="Mobile" required="true" ></div>

                                            </td>
                                        </tr>



                                    </table>

                                </div>



                            </div>







                        </div>
                    </div>
                    <div class="row">

                        <div class=" col-md-6">


                            <div class="panel panel-default" draggable="true">
                                <div class="panel-body" style="background:#fff">
                                    <div class="page-header">
                                        <h3><font color="#9d9d9d">Other Details</font></h3>
                                    </div>
                                    <h3>Land Details</h3>
                                    <table border="0" align="center">

                                        <tr>
                                            <td><label for="">Address:</label></td>
                                            <td><input type="text" class="form-control" name="lno"placeholder="Land Name"></td>
                                        </tr>
                                        <tr><td></td>
                                            <td><input type="text" class="form-control " name="lstreet" placeholder="Street"></td>
                                        </tr>
                                        <tr><td></td>
                                            <td><input type="text" class="form-control " name="lcity1" placeholder="City 1"></td>
                                        </tr>
                                        <tr><td></td>
                                            <td><input type="text" class="form-control " name="lcity2" placeholder="City 2"></td>
                                        </tr>

                                        <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                        <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                            <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                        <tr>
                                            <td><label for="inputsysid">Land Size:</label></td>
                                            <td><div class="input-group">
                                                    <input type="text" class="form-control" name="lsize" >
                                                    <span class="input-group-addon" id="basic-addon1">AKrs</span>                           
                                                </div>

                                            </td>

                                        </tr>




                                    </table>

                                </div>



                            </div>
                        </div>

                        <div class=" col-md-6">


                            <div class="panel panel-default" draggable="true">
                                <div class="panel-body" style="background:#fff">
                                    <div class="page-header">
                                        <h3><font color="#9d9d9d">Other Details</font></h3>
                                    </div>
                                    <td><h3>Vehicle Details</h3>
                                        <table border="0" >

                                            <tr>
                                                <td><label for="vehiclebrand">Brand:</label> </td>
                                                <td><input type="text" class="form-control" name="brand1"placeholder="Dimo batta/Mahindra Maximo etc"></td>
                                                <td><label for="vehicleregno">Registration No:</label></td>
                                                <td><input type="text" class="form-control " name="reg1" placeholder="SP XX xxxx"></td>
                                            </tr>

                                            <tr>
                                                <td><label for="vehiclebrand">Brand:</label> </td> 
                                                <td><input type="text" class="form-control" name="brand2"placeholder="Dimo batta/Mahindra Maximo etc"></td>
                                                <td><label for="vehicleregno">Registration No:</label></td>
                                                <td><input type="text" class="form-control " name="reg2" placeholder="SP XX xxxx"></td>
                                            </tr>


                                            <tr>
                                                <td><label for="vehiclebrand">Brand:</label> </td>
                                                <td><input type="text" class="form-control" name="brand3"placeholder="Dimo batta/Mahindra Maximo etc"></td>
                                                <td><label for="vehicleregno">Registration No:</label></td>
                                                <td><input type="text" class="form-control " name="reg3" placeholder="SP XX xxxx"></td>
                                            </tr>

                                            <tr>
                                                <td><label for="vehiclebrand">Brand:</label> </td>
                                                <td><input type="text" class="form-control" name="brand4"placeholder="Dimo batta/Mahindra Maximo etc"></td>
                                                <td><label for="vehicleregno">Registration No:</label></td>
                                                <td><input type="text" class="form-control " name="reg4" placeholder="SP XX xxxx"></td>
                                            </tr>

                                            <tr> 
                                            

                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>


                                        </table>

                                </div>
                            </div>
                        </div>
                    </div>
                                                <div ><button type="submit" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
                                            <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>
</div>

                </form>

            </div>
            <div >

                <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





            </div>





        </div>
        <script src="bootstrap/js/jquery.js"></script>
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