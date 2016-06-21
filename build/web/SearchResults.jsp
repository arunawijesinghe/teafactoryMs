<%-- 
    Document   : profile
    Created on : Dec 28, 2015, 9:53:50 AM
    Author     : Aruna Csw
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
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
                        <div align="right">
                            <h2>Search <span class="glyphicon glyphicon-search"></span></h2>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                        </div>           
                        <div class="well ">
                            <%                                String action = request.getParameter("action");
                                String nic = request.getParameter("nic");
                                String sysid = request.getParameter("sysid");
                                String tcol_id = request.getParameter("tcolid");
                                String mp_id = request.getParameter("mp_id");
                                String ts_id = request.getParameter("ts_id");
                                String fs_id = request.getParameter("fs_id");
                                String ap_id = request.getParameter("ap_id");
                                String trans_id = request.getParameter("trans_id");

                            %>

                            <form>
                                <table border="0">
                                    <tr>
                                        <td><label for="inputnic">NIC No:</label></td>
                                        <td><input type="text" class="form-control" value="<%out.print(nic);%>"></td>
                                        <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">System Id:</label></td>
                                        <td><input type="text" class="form-control"></td>
                                        <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">Tea Collection Id:</label></td>
                                        <td><input type="text" class="form-control"></td>
                                        <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>

                                    </tr> <tr>
                                        <td><label for="inputnic">Payment Id:</label></td>
                                        <td><input type="text" class="form-control"></td>
                                        <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">Tea Sent Id:</label></td>
                                        <td><input type="text" class="form-control"></td>
                                        <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">Fertilizer sent Id:</label></td>
                                        <td><input type="text" class="form-control"></td>
                                        <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>

                                    </tr>

                                </tr> <tr>
                                <td><label for="inputnic">Advance Payment Id:</label></td>
                                <td><input type="text" class="form-control"></td>
                                <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td><label for="inputnic">Transport Id:</label></td>
                                <td><input type="text" class="form-control"></td>
                                <td><button type="button" class="form-control"><span class="glyphicon glyphicon-search"></span></button></td>

                            </tr>


                        </table>



                    </form>

                </div>
                <div class="bg-warning">

                    <%if (null != action) {
                            switch (action) {
                                case "nic":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>NIC no</th>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Home No</th>
                            <th>Street</th>
                            <th>City 01</th>
                            <th>City 02</th>
                            <th>Residency Phone</th>
                            <th>Mobile Phone</th>

                        </tr>
                        <tr><%
                            Statement stm;
                            ResultSet rst = null;
                            String sql = "select * from registration where nic='" + nic + "'";

                            stm = DatabaseConnection.getConnection().createStatement();
                            rst = stm.executeQuery(sql);
                            while (rst.next()) {
                            %>

                            <td><%out.print(rst.getString(2));%></td>
                            <td><%out.print(rst.getString(3));%></td>
                            <td><%out.print(rst.getString(4));%></td>
                            <td><%out.print(rst.getString(6));%></td>
                            <td><%out.print(rst.getString(7));%></td>
                            <td><%out.print(rst.getString(8));%></td>
                            <td><%out.print(rst.getString(9));%></td>
                            <td><%out.print(rst.getString(10));%></td>

                            <td><%out.print(rst.getString(11));%></td>
                            <td><%out.print(rst.getString(12));%></td>




                        </tr> <%}%> 
                    </table>
                    <%

                            break;
                        case "sysid":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>NIC no</th>
                            <th>Full Name</th>
                            <th>Gender</th>
                            <th>Home No</th>
                            <th>Street</th>
                            <th>City 01</th>
                            <th>City 02</th>
                            <th>Residency Phone</th>
                            <th>Mobile Phone</th>

                        </tr>
                        <tr><%
                            Statement stm1;
                            ResultSet rst1 = null;
                            String sql1 = "select * from registration where system_id='" + sysid + "'";

                            stm1 = DatabaseConnection.getConnection().createStatement();
                            rst1 = stm1.executeQuery(sql1);
                            while (rst1.next()) {
                            %>

                            <td><%out.print(rst1.getString(2));%></td>
                            <td><%out.print(rst1.getString(3));%></td>
                            <td><%out.print(rst1.getString(4));%></td>
                            <td><%out.print(rst1.getString(6));%></td>
                            <td><%out.print(rst1.getString(7));%></td>
                            <td><%out.print(rst1.getString(8));%></td>
                            <td><%out.print(rst1.getString(9));%></td>
                            <td><%out.print(rst1.getString(10));%></td>

                            <td><%out.print(rst1.getString(11));%></td>
                            <td><%out.print(rst1.getString(12));%></td>




                        </tr> <%}%> 
                    </table>
                    <%

                            break;
                        case "tcolid":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>Date</th>
                            <th>Collection Id</th>
                            <th>Total Weight (Kg)</th>
                            <th>Deducted Weight (Kg)</th>
                            <th>Net Weight (Kg)</th>


                        </tr>
                        <tr><%
                            Statement stm2;
                            ResultSet rst2 = null;
                            String sql2 = "select * from daily_collection where collection_id='" + tcol_id + "'";

                            stm2 = DatabaseConnection.getConnection().createStatement();
                            rst2 = stm2.executeQuery(sql2);
                            while (rst2.next()) {
                            %>
                            <td><%out.print(rst2.getString(1));%></td>

                            <td><%out.print(rst2.getDate(2));%></td>

                            <td><%out.print(rst2.getString(3));%></td>
                            <td><%out.print(rst2.getDouble(4));%></td>
                            <td><%out.print(rst2.getDouble(5));%></td>

                            <td><%out.print(rst2.getDouble(6));%></td>





                        </tr> <%}%> 
                    </table>
                    <%

                            break;
                        case "mp_id":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>Date</th>
                            <th>Payment Id</th>
                            <th>Total Tea Leaves Weight (Kg)</th>
                            <th>Total Tea leaves value (Rs)</th>
                            <th>Total Tea Value(Rs)</th>
                            <th>Total Fertilizer Value(Rs)</th>
                            <th>Advancement Pay(Rs)</th>
                            <th>Total Deduct(Rs)</th>
                            <th>Total Transport value(Rs)</th>
                            <th>Net Payment(Rs)</th>
                            <th>Status</th>


                        </tr>
                        <tr><%
                            Statement stm3;
                            ResultSet rst3 = null;
                            String sql3 = "select * from monthly_payment where payment_id='" + mp_id + "'";

                            stm3 = DatabaseConnection.getConnection().createStatement();
                            rst3 = stm3.executeQuery(sql3);
                            while (rst3.next()) {
                            %>
                            <td><%out.print(rst3.getString(1));%></td>

                            <td><%out.print(rst3.getDate(2));%></td>

                            <td><%out.print(rst3.getString(3));%></td>
                            <td><%out.print(rst3.getDouble(4));%></td>
                            <td><%out.print(rst3.getDouble(5));%></td>

                            <td><%out.print(rst3.getDouble(6));%></td>
                            <td><%out.print(rst3.getDouble(7));%></td>
                            <td><%out.print(rst3.getDouble(8));%></td>

                            <td><%out.print(rst3.getDouble(9));%></td>
                            <td><%out.print(rst3.getDouble(10));%></td>

                            <td><%out.print(rst3.getDouble(11));%></td>
                            <td><%out.print(rst3.getString(12));%></td>





                        </tr> <%}%> 
                    </table>
                    <%

                            break;
                        case "ts_id":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>Date</th>
                            <th>Tea Issued Id</th>
                            <th>Total Weight (Kg)</th>
                            <th>Monthly Rate (Rs)</th>
                            <th>Amount (Rs)</th>


                        </tr>
                        <tr><%
                            Statement stm4;
                            ResultSet rst4 = null;
                            String sql4 = "select * from tea_deduction where tea_issued_id='" + ts_id + "'";
                            stm4 = DatabaseConnection.getConnection().createStatement();
                            rst4 = stm4.executeQuery(sql4);
                            while (rst4.next()) {
                            %>
                            <td><%out.print(rst4.getString(1));%></td>

                            <td><%out.print(rst4.getString(3));%></td>

                            <td><%out.print(rst4.getString(2));%></td>
                            <td><%out.print(rst4.getDouble(4));%></td>
                            <td><%out.print(rst4.getDouble(5));%></td>

                            <td><%out.print(rst4.getDouble(6));%></td>





                        </tr> <%}%> 
                    </table>
                    <%   break;
                      case "fs_id":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>Date</th>
                            <th>Tea Issued Id</th>
                            <th>Total Weight (Kg)</th>
                            <th>Monthly Rate (Rs)</th>
                            <th>Amount (Rs)</th>


                        </tr>
                        <tr><%
                            Statement stm5;
                            ResultSet rst5 = null;
                            String sql5 = "select * from fertilier_deduction where fsent_id='" + fs_id + "'";
                            stm5 = DatabaseConnection.getConnection().createStatement();
                            rst5 = stm5.executeQuery(sql5);
                            while (rst5.next()) {
                            %>
                            <td><%out.print(rst5.getString(1));%></td>

                            <td><%out.print(rst5.getDate(2));%></td>

                            <td><%out.print(rst5.getString(3));%></td>
                            <td><%out.print(rst5.getDouble(4));%></td>
                            <td><%out.print(rst5.getDouble(5));%></td>

                            <td><%out.print(rst5.getDouble(6));%></td>





                        </tr> <%}%> 
                    </table>

                    <%   break;
                        case "ap_id":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>Date</th>
                            <th>Advance Payment Id</th>
                            <th>Total Payment (Rs)</th>
                            <th>Status</th>


                        </tr>
                        <tr><%
                            Statement stm6;
                            ResultSet rst6 = null;
                            String sql6 = "select * from advancement_payment where ap_id='" + ap_id + "'";
                            stm6 = DatabaseConnection.getConnection().createStatement();
                            rst6 = stm6.executeQuery(sql6);
                            while (rst6.next()) {
                            %>
                            <td><%out.print(rst6.getString(1));%></td>

                            <td><%out.print(rst6.getDate(3));%></td>

                            <td><%out.print(rst6.getString(4));%></td>
                            <td><%out.print(rst6.getDouble(2));%></td>
                            <td><%out.print(rst6.getString(5));%></td>

                        </tr> <%}%> 
                    </table>
                    <%   break;
                         case "trans_id":%>
                    <table class="table table-hover" align="center" cellpadding="5">
                        <tr>
                            <th>System Id</th>
                            <th>Date</th>
                            <th>Transport Id</th>
                            <th>Total Tea weight (Kg)</th>
                            <th>Monthly Rate (Rs)</th>
                            <th>Total Payment (Rs)</th>
                            


                        </tr>
                        <tr><%
                            Statement stm7;
                            ResultSet rst7 = null;
                            String sql7 = "select * from transport where transport_id='" + trans_id + "'";
                            stm7 = DatabaseConnection.getConnection().createStatement();
                            rst7 = stm7.executeQuery(sql7);
                            while (rst7.next()) {
                            %>
                            <td><%out.print(rst7.getString(1));%></td>

                            <td><%out.print(rst7.getDate(2));%></td>

                            <td><%out.print(rst7.getString(3));%></td>
                            <td><%out.print(rst7.getDouble(4));%></td>
                            <td><%out.print(rst7.getString(5));%></td>
                            <td><%out.print(rst7.getString(6));%></td>

                            
                        </tr> <%}%> 
                    </table>



                    <%

                            }
                        }
                    %>
                </div>          

                <hr/>
                <div >

                    <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





                </div>

            </div>

            <script src="bootstrap/js/jquery.js"></script>
            <script src="bootstrap/js/bootstrap.min.js"></script>

            </body>
            </html>
            <%    }
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