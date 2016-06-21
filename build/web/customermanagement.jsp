<%-- 
    Document   : profile
    Created on : Dec 28, 2015, 9:53:50 AM
    Author     : Aruna Csw
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Management</title>
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
                            <h3>Customer Management <span class="glyphicon glyphicon-qrcode"></span></h3>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                        </div>     
                        
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3"></div>
                                <div class="col-md-6" background="white">
                                <form method="post" action="CustomerManagement">
                                    <table class="table" bgcolor="white">
                                      <%
                        String nic=request.getParameter("nic");
                        String sql="select * from registration where nic='"+nic+"' ";
                        Statement stm=DatabaseConnection.getConnection().createStatement();
                        ResultSet rst=stm.executeQuery(sql);
                       while(rst.next()){
                        
                        
                        
                        %>
                                    <tr>
                                        <td>System Id:</td>
                                        <td><input type="text" name="sysid" value="<%out.print(rst.getString(2));%>" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td>NIC No:</td>
                                        <td><input type="text" name="nic" value="<%out.print(rst.getString(3));%>" readonly="true"></td>
                                    </tr>
                                    <tr>
                                        <td>Full Name:</td>
                                        <td><input type="text" name="fullname" value="<%out.print(rst.getString(4));%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Name with initials:</td>
                                        <td><input type="text" name="nwi" value="<%out.print(rst.getString(5));%>"></td>
                                    </tr>
                                    <tr>
                                        <td>Home No:</td>
                                        <td><input type="text" name="homeno" value="<%out.print(rst.getString(7));%>"></td>
                                    </tr>
                                <tr>
                                        <td>Street:</td>
                                        <td><input type="text" name="street" value="<%out.print(rst.getString(8));%>"></td>
                                    </tr>
                                    <tr>
                                        <td>City 1:</td>
                                        <td><input type="text" name="city1" value="<%out.print(rst.getString(9));%>"></td>
                                    </tr>
                                <tr>
                                        <td>City 2:</td>
                                        <td><input type="text" name="city2" value="<%out.print(rst.getString(10));%>"></td>
                                    </tr>
                                <tr>
                                        <td>Residency Phone No:</td>
                                        <td><input type="text" name="resphone" value="<%out.print(rst.getInt(11));%>"></td>
                                    </tr>
                                <tr>
                                        <td>Mobile Phone No:</td>
                                        <td><input type="text" name="mobphone" value="<%out.print(rst.getInt(12));%>"></td>
                                    </tr><%}%>
                                </table> 
                                    
                                
                                    
                            </div>
<div class="col-md-3">
    <table>
                <tr><td>
                        <input type="submit" value="update" name="action">
            </td></tr>
                 <tr><td>
                        <input type="submit" value="delete" name="action">
            </td></tr>
    </table>   
                                </div>
                            </div>
                            </div>                               
                             
                            <div >

                                <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





                            </div>

                        </div>

                        <script src="bootstrap/js/jquery.js"></script>
                        <script src="bootstrap/js/bootstrap.min.js"></script>
                        </body>
                        </body>
                        </html>
