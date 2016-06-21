<%-- 
    Document   : profile
    Created on : Dec 28, 2015, 9:53:50 AM
    Author     : Aruna Csw
--%>

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
                            <h3>Forget My Password <span class="glyphicon glyphicon-qrcode"></span></h3>
                            <!-- Collect the nav links, forms, and other content for toggling -->
                        </div>           
                        <div class="well ">

                            <div class="row">
                                <h2>User Account Verification <span class="glyphicon glyphicon-user"></span></h2>

                                <div class="col-md-6">

                                    <div class="panel panel-default" draggable="true">
                                        <div class="panel-body" style="background:#fff">
                                            <div class="page-header">
                                                <h3><font color="#9d9d9d">Password Recovery Question <span class="glyphicon glyphicon-question-sign"></span></font></h3>
                                            </div>
                                            <form method="post" action="forgelmypassword.jsp"> 
                                                <table border="0" align="center">
                                                    <tr>
                                                        <td><label for="username">User Name:</label></td>
                                                        <td><input type="text" class="form-control col-sm-5s" name="uname">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>

                                                    <tr>
                                                        <td><label for="inputsysid">Question:</label></td>
                                                        <td><select class="form-control" name="question">
                                                                <option value="1">What's your best friends name ?</option>
                                                                <option value="2">What's your  favorite book ?</option>
                                                                <option value="3">What's your pet name ?</option>
                                                                <option value="4">What's your favorite film ?</option>


                                                            </select></td>

                                                    </tr>

                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td><label for="inputsysid">Answer:</label></td>
                                                        <td><input type="text" class="form-control" name="answer">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>

                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td>  
                                                            <button type="submit" class="btn btn-default navbar-btn">Verify <span class="glyphicon glyphicon-check"></span></button>
                                                        </td><td>&nbsp;&nbsp;&nbsp;&nbsp; <button type="reset" class="btn btn-default navbar-btn">Cancel <span class="glyphicon glyphicon-remove-sign"></span></button>
                                                        </td>

                                                    </tr>



                                                </table>
                                            </form>
                                        </div>



                                    </div>
                                </div>

                                <div class="col-md-4">

                                    <div class="panel panel-default" draggable="true">
                                        <div class="panel-body" style="background:#fff">
                                            <div class="page-header">
                                                <h3><font color="#9d9d9d">Change Password <span class="glyphicon glyphicon-lock"></span></font></h3>
                                            </div>
                                            <form> 
                                                <table border="0" align="center">




                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td><label for="inputsysid">Email:</label></td>
                                                        <td><input type="email" class="form-control" id="systemid">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td><label for="inputsysid">New Password:</label></td>
                                                        <td><input type="password" class="form-control" id="systemid">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td><label for="inputsysid">Re-Enter Password:</label></td>
                                                        <td><input type="password" class="form-control" id="systemid">
                                                        </td>

                                                    </tr>
                                                    <tr><td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td></tr>
                                                    <tr>
                                                        <td>  
                                                            <button type="button" class="btn btn-default navbar-btn">Change <span class="glyphicon glyphicon-cog"></span></button>
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
                        </body>
                        </body>
                        </html>
