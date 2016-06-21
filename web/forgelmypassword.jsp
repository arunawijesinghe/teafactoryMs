<%-- 
    Document   : profile
    Created on : Dec 28, 2015, 9:53:50 AM
    Author     : Aruna Csw
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="com.fims.model.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget My Password</title>
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
        <script type="text/javascript">
            function checkPassword() {

                var pwd1 = document.change.npassword.value;
                var pwd2 = document.change.cpassword.value;

                if (pwd1 !== pwd2) {
                    alert("Password Confirmation Invalid!");

                }



            }
        </script>

    </head>
    <%
        String uname = request.getParameter("uname");
        int qno = Integer.parseInt(request.getParameter("question"));
        String answer = request.getParameter("answer");
        ResultSet rst;
        try{
        Statement stm = DatabaseConnection.getConnection().createStatement();
        String sql = "select * from user where username='" + uname + "'";
        rst = stm.executeQuery(sql);
        rst.first();

        String uname1 = rst.getString(1);
        int qno1 = rst.getInt(8);
        String answer1 = rst.getString(9);
        User user = new User();
        user.setUsername(uname1);
        if (uname.equals(uname1)) {
            if (qno == qno1 && answer.equalsIgnoreCase(answer1)) {
    %>

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
                            <h3>Forget My Password <span class="glyphicon glyphicon-qrcode"></span></h3>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                        </div>           
                        <div class="well ">

                            <div class="row">
                                <div class="col-md-4"><br>
                                    <br<br>
                                    <br<br>
                                    <br>
                                    <h2>User Account Verification Successfully</h2>
                                    <center>
                                        <img src="img/icons/Lock Open.png" alt="" width="80" height="80"/>
                                    </center>
                                </div>

                                <div class="col-md-4">

                                    <div class="panel panel-default" draggable="true">
                                        <div class="panel-body" style="background:#fff">
                                            <div class="page-header">
                                                <h3><font color="#9d9d9d">Change Password <span class="glyphicon glyphicon-lock"></span></font></h3>
                                            </div>
                                            <form name="change" method="post" action="UpdateForgetPassword"> 
                                                <table border="0" align="center">




                                                    <tr><td><label for="inputsysid">UserName:</label></td>
                                                        <td><input type="text" class="form-control" name="username" value="<%out.print(user.getUsername());%>" readonly="true">
                                                        <tr>
                                                        <td><label for="inputsysid">Email:</label></td>
                                                        <td><input type="email" class="form-control" name="email">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td><label for="inputsysid">New Password:</label></td>
                                                        <td><input type="password" class="form-control" name="npassword">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td><label for="inputsysid">Re-Enter Password:</label></td>
                                                        <td><input type="password" class="form-control" name="cpassword" onblur="checkPassword()">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td>  
                                                            <button type="submit" class="btn btn-default navbar-btn">Change <span class="glyphicon glyphicon-cog"></span></button>
                                                        </td><td> <button type="r</td>eset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>
                                                        </td>

                                                    </tr>



                                                </table>
                                            </form>
                                        </div>



                                    </div>
                                </div>


                            </div>
                            <div >

                                <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





                            </div>

                        </div>

                        <script src="bootstrap/js/jquery.js"></script>
                        <script src="bootstrap/js/bootstrap.min.js"></script>
                        <%

                        }else{out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\">"
                        + "<h1 align=\"center\">Invalid Question Or Answer !</h1>"
                        + "<p align=\"center\">Please Check Your Typed Data &nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"index.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
            }
                
            }else{
                out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\"><h1 align=\"center\">Invalid User !</h1>"
                        + "<p align=\"center\">Please Contact Your System Administrator &nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"index.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
            }
        }catch(SQLException ex){
            
             out.print("<head><title>Error</title>"
                        + "<link rel=\"icon\" href=\"img/Error.png\" type=\"image/png\">\n"
                        + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                        + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                        + "</head>"
                        + "<Body><div class=\"row\">"
                        + "<div class=\"well\" style=\"background:#cd3a3a\">"
                        + "<font color=\"white\"><h1 align=\"center\">Invalid User !</h1>"
                        + "<p align=\"center\">Please Contact Your System Administrator &nbsp;&nbsp;&nbsp;&nbsp;"
                        + "<a href=\"index.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To  <span class=\"glyphicon glyphicon-backward\"></span></button></a>\n"
                        + "</p> <hr/>\n"
                        + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                        + " </div>");
            
            
        }
                         %>
                        </body>
                        </html>
