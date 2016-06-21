<%-- 
    Document   : dailycollection
    Created on : Dec 29, 2015, 2:02:35 PM
    Author     : Aruna Csw
--%>

<%@page import="org.apache.jasper.JasperException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.util.Date"%>
<%@page import="com.fims.model.DailyCollection"%>
<%@page import="com.fims.dao.DailyCollectionDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fims.model.User"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monthly Summery</title>
        <link rel="icon" href="img/logo.jpg" type="image/jpg">
        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/themes/smoothness/jquery-ui.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <script src="bootstrap/js/GetTCollectionId.js"></script>
        <script src="bootstrap/js/CheckDate.js"></script>        
        <script src="bootstrap/js/GetTotalTeaCollection.js"></script>        

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
        <script type="text/javascript">
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
                                <li><a href="registration.jsp"><b><font color="Black">Registration <span class="glyphicon glyphicon-bishop"></span></font></b></a></li>

                                <li class="dropdown">

                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><b><font color="Black">Tea Collection <span class="caret"></span></b></font></a>                                    <ul class="dropdown-menu">
                                        <li><a href="dailycollection.jsp">Daily Collection</a></li>


                                        <li role="separator" class="divider"></li>
                                        <li><a href="dailysummary.jsp">Daily Summary</a></li>

                                        <li><a href="#">Monthly Summary</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown">

                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><b><font color="Black">Payments <span class="caret"></span></b></font></a>                                    <ul class="dropdown-menu">
                                        <li><a href="monthlypayment.jsp">Monthly Payments</a></li>
                                        <li><a href="transport.jsp">Transport Payments</a></li>
                                        <li><a href="deduction.jsp">Deduction</a></li>
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
            <%                int option = Integer.parseInt(request.getParameter("option"));
                String fdate = request.getParameter("fdate");
                String tdate = request.getParameter("tdate");
                String col_id=request.getParameter("col_id");
                
                if(fdate.equalsIgnoreCase("")&&tdate.equalsIgnoreCase("")){
                    out.print("<head><title>Error</title>"
                                    + "<link rel=\"icon\" href=\"img/Bulbon.png\" type=\"image/png\">\n"
                                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                                    + "</head>"
                                    + "<Body><div class=\"row\">"
                                    + "<div class=\"well\" style=\"background:#cd3a3a\">"
                                    + "<font color=\"white\">"
                                    + "<h1 align=\"center\">Invali Input</h1>" 
                                    + "<p align=\"center\">You Must fill the fields &nbsp;&nbsp;&nbsp;&nbsp;"
                                    + "<a href=\"monthlysummery.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back </button>\n"
                                    + "</a></p> <hr/>\n"
                                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                                    + " </div>");
                }else{
SimpleDateFormat df = new SimpleDateFormat("MM/dd/yyyy");
            
            int fd =(df.parse(fdate).getDate());
            String fy=String.valueOf(df.parse(fdate).getYear()+1900);
            int fm=(df.parse(fdate).getMonth()+1);
            String fds="";
            String fms="";
            if(fd<10){
             fds="0"+String.valueOf(fd);
            }else{
            fds=String.valueOf(fd);
            }
            if(fm<10){
             fms="0"+String.valueOf(fm);
            }else{
            fms=String.valueOf(fm);
            }
            String fdate1=fy+"-"+fms+"-"+fds;
            
            //generate To date
            int td =(df.parse(tdate).getDate());
            String ty=String.valueOf(df.parse(tdate).getYear()+1900);
            int tm=(df.parse(tdate).getMonth()+1);
            String tds="";
            String tms="";
            if(td<10){
             tds="0"+String.valueOf(td);
            }else{
            tds=String.valueOf(td);
            }
            if(tm<10){
             tms="0"+String.valueOf(tm);
            }else{
            tms=String.valueOf(tm);
            }
            String tdate1=ty+"-"+tms+"-"+tds;
            
            
            
            
            
            
                switch (option) {

                    case 1:
                        Statement stm = null;
                        ResultSet rst = null;
                        String sql = "select * from daily_collection where date between '"+fdate1+"' and '"+tdate1+"' ";
                        stm = DatabaseConnection.getConnection().createStatement();
                        rst = stm.executeQuery(sql);
            %>
            <table class="table table-hover">
                <tr>
                    <th>Collector id</th>
                    <th>Date</th>
                    <th>Collection Id</th>
                    <th>Total Weight (Kg)</th>
                    <th>Deduct Weight (Kg)</th>
                    <th>Net Weight (Kg)</th>
                </tr> 
                <%
                        double totnet1=0.0;
                        double totweight1=0.0;
                        double totdeduct1=0.0;
                    while (rst.next()) {
                        totnet1=totnet1+(rst.getDouble(6));
                        totweight1=totweight1+(rst.getDouble(4));
                    totdeduct1=totdeduct1+(rst.getDouble(5));
                    
                    
                %>


                <td><%out.print(rst.getString(1));%></td>

                <td><%out.print(rst.getDate(2));%></td>

                <td><%out.print(rst.getString(3));%></td>
                <td><%out.print(rst.getDouble(4));%></td>
                <td><%out.print(rst.getDouble(5));%></td>

                <td><%out.print(rst.getDouble(6));%></td>
                </tr>
                <%
                    }%>
                    <tr class="bg-danger"><td></td>
                        <td></td>
                        
                        <td>Total</td>
                        <td><%out.print(totweight1);%></td>
                        <td><%out.print(totdeduct1);%></td>
                        <td><%out.print(totnet1);%></td>
                    </tr>
            </table>
<% break;
                    case 2:
                        Statement stm1 = null;
                        ResultSet rst1 = null;
                        String sql1 = "select * from monthly_payment where date between '"+fdate1+"' and '"+tdate1+"' ";
                        stm1 = DatabaseConnection.getConnection().createStatement();
                        rst1 = stm1.executeQuery(sql1);
            %>
            <table class="table table-hover">
                <tr>
                    <th>Collector id</th>
                    <th>Date</th>
                    <th>Payment Id</th>
                    <th>Total Tea Weight(Kg)</th>
                    <th>Value of Tea Leaves(Rs)</th>
                    <th>Total Tea Values (Rs)</th>
                    <th>Total Fertilizer Value (Rs)</th>
                    <th>Advance Payment (Rs)</th>
                    <th>Total Deduct (Rs)</th>
                    <th>Total Transport (Rs)</th>
                    <th>Net Payment (Rs)</th>
                    
                </tr> 
                <%
                        double tot_tl_weight=0.0;
                        double tot_tl_val=0.0;
                        double tot_t_val=0.0;
                        double tot_f_val=0.0;
                        double tot_ap_val=0.0;
                        double tot_net=0.0;
                        
                                
                                
                    while (rst1.next()) {
                        tot_tl_weight=tot_tl_weight+(rst1.getDouble(4));
                        tot_tl_val=tot_tl_val+(rst1.getDouble(5));
                        tot_t_val=tot_t_val+(rst1.getDouble(6));
                        tot_f_val=tot_f_val+(rst1.getDouble(7));
                        tot_ap_val=tot_ap_val+(rst1.getDouble(8));
                        tot_net=tot_net+(rst1.getDouble(11));
                              %>
                              <td><%out.print(rst1.getString(1));%></td>

                <td><%out.print(rst1.getDate(2));%></td>
                <td><%out.print(rst1.getString(3));%></td>
                <td><%out.print(rst1.getDouble(4));%></td>
                <td><%out.print(rst1.getDouble(5));%></td>
                <td><%out.print(rst1.getDouble(6));%></td>
                <td><%out.print(rst1.getDouble(7));%></td>
                <td><%out.print(rst1.getDouble(8));%></td>
                <td><%out.print(rst1.getDouble(9));%></td>
                <td><%out.print(rst1.getDouble(10));%></td>
                <td><%out.print(rst1.getDouble(11));%></td>
            </tr><%}%>
            <tr class="bg-danger">
                    <td></td><td></td><td>Total</td>
                    <td><%out.print(tot_tl_weight);%></td>
                    <td><%out.print(tot_tl_val);%></td>
                    <td><%out.print(tot_t_val);%></td><td><%out.print(tot_f_val);%></td><td><%out.print(tot_ap_val);%></td>
                    <td></td>
                    <td></td>
                    <td><%out.print(tot_net);%></td>
                </tr>
                
                    
            </table>
            
            <% 
                    break;
                    case 3:
                        Statement stm3 = null;
                        ResultSet rst3 = null;
                        String sql3 = "select * from fertilier_deduction where date between '"+fdate1+"' and '"+tdate1+"' ";
                        stm3 = DatabaseConnection.getConnection().createStatement();
                        rst3 = stm3.executeQuery(sql3);
            %>
            <table class="table table-hover">
                <tr>
                    <th>Collector id</th>
                    <th>Date</th>
                    <th>Fertilizer Sent Id</th>
                    <th>Total Fertilizer Weight (Kg)</th>
                    
                    
                </tr> 
                <% 
                        double tf=0.0;
                    while (rst3.next()) {
                        tf=tf+(rst3.getDouble(4));
                    
                %>


                <td><%out.print(rst3.getString(1));%></td>

                <td><%out.print(rst3.getDate(2));%></td>

                <td><%out.print(rst3.getString(3));%></td>
                <td><%out.print(rst3.getDouble(4));%></td>
                
                </tr>
                <%
                    }%>
                    <tr class="bg-danger">
                        <td></td><td></td> <td>Total</td><td><%out.print(tf);%></td>
                    </tr>
            </table>
 <%
                    break;
                    case 4:
                        Statement stm4 = null;
                        ResultSet rst4 = null;
                        String sql4 = "select * from tea_deduction where date between '"+fdate1+"' and '"+tdate1+"' ";
                        stm4 = DatabaseConnection.getConnection().createStatement();
                        rst4 = stm4.executeQuery(sql4);
            %>
            <table class="table table-hover">
                <tr>
                    <th>Collector id</th>
                    <th>Date</th>
                    <th>Tea Sent Id</th>
                    <th>Total Tea Weight (Kg)</th>
                    
                    
                </tr> 
                <%
                    while (rst4.next()) {
                %>


                <td><%out.print(rst4.getString(1));%></td>

                <td><%out.print(rst4.getDate(3));%></td>

                <td><%out.print(rst4.getString(2));%></td>
                <td><%out.print(rst4.getDouble(4));%></td>
                
                </tr>
                <%
                    }%>
            </table>
            <%
                break;
case 5:
                        Statement stm5 = null;
                        ResultSet rst5 = null;
                        String sql5 = "select * from daily_collection where system_id='"+col_id+"' and date between '"+fdate1+"' and '"+tdate1+"' ";
                        stm5 = DatabaseConnection.getConnection().createStatement();
                        rst5 = stm5.executeQuery(sql5);
            %>
            <table class="table table-hover">
                <tr>
                    <th>Collector id</th>
                    <th>Date</th>
                    <th>Collection Id</th>
                    <th>Total Weight (Kg)</th>
                    <th>Deduct Weight (Kg)</th>
                    <th>Net Weight (Kg)</th>
                </tr> 
                <%
                        double totnet=0.0;
                        double totweight=0.0;
                        double totdeduct=0.0;
                    while (rst5.next()) {
                        totnet=totnet+(rst5.getDouble(6));
                        totweight=totweight+(rst5.getDouble(4));
                    totdeduct=totdeduct+(rst5.getDouble(5));
                            
                %>


                <td><%out.print(rst5.getString(1));%></td>

                <td><%out.print(rst5.getDate(2));%></td>

                <td><%out.print(rst5.getString(3));%></td>
                <td><%out.print(rst5.getDouble(4));%></td>
                <td><%out.print(rst5.getDouble(5));%></td>

                <td><%out.print(rst5.getDouble(6));%></td>
                </tr>
                <%
                    } %>
                    <tr class="bg-danger"><td></td>
                        <td></td>
                        
                        <td>Total</td>
                        <td><%out.print(totweight);%></td>
                        <td><%out.print(totdeduct);%></td>
                        <td><%out.print(totnet);}%></td>
                    </tr>
            </table>









            <div class="row">

                <div  align="center">
                    <div class="panel panel-default" draggable="true" align="center">
                        <div class="panel-body" style="background:#fff">
                            <div class="page-header">
                                <h3><font color="#9d9d9d">Monthly Summary</font></h3>
                            </div>
                            <form method="post" action="" >
                                <table border="0">
                                    <tr>
                                        <td>Summary Type:</td>
                                        <td>
                                            <select class="form-control" name="option" >
                                                <option value="1">Monthly Tea Collection</option>
                                                <option value="2">Total Monthly payment</option>
                                                <option value="3">Monthly fertilizer usage</option>
                                                <option value="4">Monthly Tea usage</option>
                                                <option value="5">Monthly Tea Collection</option>


                                            </select>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <label for="inputcoldate">From:</label>
                                        </td>

                                        <td>

                                            <input type="text" name="fdate" class="form-control" placeholder="dd/mm/yyyy" id="datepicker"  >
                                        </td>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <label for="inputcoldate">To:</label>
                                        </td>

                                        <td>

                                            <input type="text" name="tdate" class="form-control" placeholder="dd/mm/yyyy" id="datepicker1"  >
                                        </td>

                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td>
                                            <input type="button" class="btn btn-default" value ="Generate">
                                        </td>
                                    </tr>
                                    <tr>




                                </table>                                



                        </div>
                        <div >

                            <p align="center">All Rights Reserved.<span class="glyphicon glyphicon-copyright-mark" ></span> Copyright by 2015-2016 . Powered by ??????</p>





                        </div>
                    </div>
                    <script src="bootstrap/js/bootstrap.min.js"></script>
                    </body>
                    </html>
                    <%        }}
                        }catch (NullPointerException e ) {
                            out.print("<head><title>Error</title>"
                                    + "<link rel=\"icon\" href=\"img/Bulbon.png\" type=\"image/png\">\n"
                                    + "<link href=\"bootstrap/css/bootstrap.min.css\" rel=\"stylesheet\">\n"
                                    + "<link href=\"bootstrap/css/style.css\" rel=\"stylesheet\">\n"
                                    + "</head>"
                                    + "<Body><div class=\"row\">"
                                    + "<div class=\"well\" style=\"background:#cd3a3a\">"
                                    + "<font color=\"white\">"
                                    + "<h1 align=\"center\">Invalid User ! catch</h1>" 
                                    + "<p align=\"center\">You Must Login First &nbsp;&nbsp;&nbsp;&nbsp;"
                                    + "<a href=\"index.jsp\"><button type=\"button\" class=\"btn btn-default navbar-btn\">Back To Home <span class=\"glyphicon glyphicon-home\"></span></button>\n"
                                    + "</a></p> <hr/>\n"
                                    + " <p align=\"center\">All Rights Reserved.<span class=\"glyphicon glyphicon-copyright-mark\" ></span> Copyright by 2015-2016 . Powered by ??????</p>\n"
                                    + " </div>");
                        }
                    %>