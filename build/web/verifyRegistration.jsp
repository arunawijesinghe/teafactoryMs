<%@page import="com.fims.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Registration verify</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
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

        <%    String custype = request.getParameter("cusType");

            if (custype.equals("Cul")) {
                custype = "Cultivator";
            } else if (custype.equals("Col")) {
                custype = "Collector";
            }
            String sysid = request.getParameter("sysId");
            String nic = request.getParameter("cusNic");
            String fullname = request.getParameter("cusFullName");
            String nwi = request.getParameter("cusNwithIni");
            String gender = request.getParameter("gender");
            if (gender.equals("m")) {
                gender = "Male";
            } else {
                gender = "Female";
            }
            String homeno = request.getParameter("address_homeno");
            String street = request.getParameter("street");
            String city1 = request.getParameter("address_city1");
            String city2 = request.getParameter("address_city2");
            String resPhone = request.getParameter("residencyphone");
            String mobPhone = request.getParameter("mobilephone");
            String landno = request.getParameter("lno");
            String lstreet = request.getParameter("lstreet");
            String lcity1 = request.getParameter("lcity1");
            String lcity2 = request.getParameter("lcity2");
            String lsize = request.getParameter("lsize");
            String v1 = request.getParameter("brand1");
            String r1 = request.getParameter("reg1");
            String v2 = request.getParameter("brand2");
            String r2 = request.getParameter("reg2");
            String v3 = request.getParameter("brand3");
            String r3 = request.getParameter("reg3");
            String v4 = request.getParameter("brand4");
            String r4 = request.getParameter("reg4");


        %>
        <div class="container" style="background:#ebebeb">
            <div class="well">
                <h3><img src="img/icons/Document 1 Edit.png">Verify Registration Details</h3>
                <div class="row">
                    <div class="col-md-3"></div>
                    <div class="col-md-6" style="background: #fff" >
                        <h3 align="center">Registration Form</h3>
                        <hr>
                        <form method="post" action="Registration"class="form-group" name="reg">
                            <table border="0" class="table-hover" align="center">
                                <tr><td>Personal Details</td></tr>

                                <tr><td></td>
                                    <td>Customer Type:</td>
                                    <td><input type="text" name="cusType" class="form-control" value="<%out.print(custype);%>"></td>
                                </tr> 
                                <tr><td></td>
                                    <td>System Id:</td>
                                    <td><input type="text" name="sysid" class="form-control" value="<%out.print(sysid);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>NIC No:</td>
                                    <td><input type="text" name="nic" class="form-control" value="<%out.print(nic);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>Full Name:</td>
                                    <td><input type="text" name="fullName" class="form-control" value="<%out.print(fullname);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>Name With Initials:</td>
                                    <td><input type="text" name="nwi" class="form-control" value="<%out.print(nwi);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>Gender:</td>
                                    <td><input type="text" name="gender" class="form-control" value="<%out.print(gender);%>"></td>
                                </tr></table>
                            <table border="0"class="table-hover" align="center">
                                <hr>
                                <tr><td>Contact Details</td></tr>
                                <tr><td></td>
                                    <td>Address:</td>
                                    <td>Home No:</td>
                                    <td><input type="text" name="homeNo" class="form-control" value="<%out.print(homeno);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>Street:</td>
                                    <td><input type="text" name="hStreet" class="form-control" value="<%out.print(street);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>City1:</td>
                                    <td><input type="text" name="hCity1" class="form-control" value="<%out.print(city1);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>City 2:</td>
                                    <td><input type="text" name="hCity2" class="form-control" value="<%out.print(city2);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>Contact No:</td>
                                    <td>Residency No:</td>
                                    <td><input type="text" name="resPhone" class="form-control" value="<%out.print(resPhone);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>Mobile No:</td>
                                    <td><input type="text" name="mobPhone" class="form-control" value="<%out.print(mobPhone);%>"></td>
                                </tr>
                            </table>
                            <table border="0"class="table-hover" align="center">
                                <hr>
                                <tr><td>Land Details</td></tr>
                                <tr><td></td>
                                    <td>Address:</td>
                                    <td>Land No:</td>
                                    <td><input type="text" name="landNo" class="form-control" value="<%out.print(landno);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>Street:</td>
                                    <td><input type="text" name="lStreet" class="form-control" value="<%out.print(lstreet);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>City1:</td>
                                    <td><input type="text" name="lCity1" class="form-control" value="<%out.print(lcity1);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>City 2:</td>
                                    <td><input type="text" name="lCity2" class="form-control" value="<%out.print(lcity2);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td></td>
                                    <td>Land Size:</td>
                                    <td><input type="text" name="lSize" class="form-control" value="<%out.print(lsize);%>"></td>
                                </tr>
                            </table>

                            <table border="0"class="table-hover" align="center">
                                <hr>
                                <tr><td>Vehicle Details</td></tr>
                                <tr><td></td>
                                    <td>Brand:</td>
                                    <td><input type="text" name="brand1" class="form-control" value="<%out.print(v1);%>"></td>

                                    <td>Registration No:</td>
                                    <td><input type="text" name="regNo1" class="form-control" value="<%out.print(r1);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>Brand:</td>
                                    <td><input type="text" name="brand2" class="form-control" value="<%out.print(v2);%>"></td>

                                    <td>Registration No:</td>
                                    <td><input type="text" name="regNo2" class="form-control" value="<%out.print(r2);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>Brand:</td>
                                    <td><input type="text" name="brand3" class="form-control" value="<%out.print(v3);%>"></td>

                                    <td>Registration No:</td>
                                    <td><input type="text" name="regNo3" class="form-control" value="<%out.print(r3);%>"></td>
                                </tr>
                                <tr><td></td>
                                    <td>Brand:</td>
                                    <td><input type="text" name="brand4" class="form-control" value="<%out.print(v4);%>"></td>

                                    <td>Registration No:</td>
                                    <td><input type="text" name="regNo4" class="form-control" value="<%out.print(r4);%>"></td>
                                </tr>
                            </table>
                            <div align="center"><button type="submit" class="btn btn-default navbar-btn">Save <span class="glyphicon glyphicon-save"></span></button>
                                <button type="reset" class="btn btn-default navbar-btn">Print <span class="glyphicon glyphicon-print"></span></button>
                                <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>

                            </div>
                        </form>
                    </div>
                </div>
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