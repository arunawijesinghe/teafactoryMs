<%-- 
    Document   : profile
    Created on : Dec 28, 2015, 9:53:50 AM
    Author     : Aruna Csw
--%>

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

                            <form method="post" action="SearchResults.jsp">
                                <table border="0">
                                    <tr>
                                        <td><label for="inputnic">NIC No:</label></td>
                                        <td><input type="text" name="nic" class="form-control"></td>
                                        <td><button type="submit" class="form-control" value="nic" name="action"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">System Id:</label></td>
                                        <td><input type="text" class="form-control" name="sysid"></td>
                                        <td><button type="submit" class="form-control"value="sysid" name="action"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">Tea Collection Id:</label></td>
                                        <td><input type="text" class="form-control" name="tcolid"></td>
                                        <td><button type="submit" class="form-control"value="tcolid" name="action"><span class="glyphicon glyphicon-search"></span></button></td>

                                    </tr> <tr>
                                        <td><label for="inputnic">Monthly Payment Id:</label></td>
                                        <td><input type="text" class="form-control" name="mp_id"></td>
                                        <td><button type="submit" class="form-control"value="mp_id" name="action"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">Tea Sent Id:</label></td>
                                        <td><input type="text" class="form-control" name="ts_id"></td>
                                        <td><button type="submit" class="form-control" value="ts_id" name="action"><span class="glyphicon glyphicon-search"></span></button></td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td><label for="inputnic">Fertilizer sent Id:</label></td>
                                        <td><input type="text" class="form-control"name="fs_id"></td>
                                        <td><button type="submit" class="form-control" value="fs_id" name="action"><span class="glyphicon glyphicon-search"></span></button></td>

                                    </tr>
                                
                        </tr> <tr>
                        <td><label for="inputnic">Advance Payment Id:</label></td>
                        <td><input type="text" class="form-control" name="ap_id"></td>
                        <td><button type="submit" class="form-control" value="ap_id" name="action"><span class="glyphicon glyphicon-search"></span></button></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><label for="inputnic">Transport Id:</label></td>
                        <td><input type="text" class="form-control" name="trans_id"></td>
                        <td><button type="submit" class="form-control" value="trans_id" name="action"><span class="glyphicon glyphicon-search"></span></button></td>

                    </tr>


                </table>



            </form>

        </div>
                       <div id = "s-results">
     This is where our search results will be displayed
</div>
                            
                            
                            
                            
                        </div><hr/>
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