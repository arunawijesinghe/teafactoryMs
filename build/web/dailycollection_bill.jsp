<%-- 
    Document   : dailycollection_bill
    Created on : Mar 27, 2016, 7:22:52 AM
    Author     : Aruna Csw
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.fims.utillity.DatabaseConnection"%>
<%@page import="java.util.Date"%>
<%@page import="com.fims.model.DailyCollection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Daily Collection Bill</title>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="bootstrap/themes/smoothness/jquery-ui.css">
        <script src="bootstrap/js/jquery.min.js"></script>
        <script src="bootstrap/js/jquery-ui.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>

        <link href="bootstrap/css/style.css" rel="stylesheet">
    </head>
    <body>
        <%
            String tcolid = request.getParameter("tcolid");
            Connection conn = DatabaseConnection.getConnection();
            String sql = "Select * from daily_collection where collection_id='" + tcolid + "'";
            Statement stm = conn.createStatement();
            ResultSet rst = stm.executeQuery(sql);
            rst.first();
        %>
        <div class="col-md-4">
        <table class="table " width="300">
            <tr><td align="center" colspan="2">
                    <h2><img src="img/logo.jpg" alt="Wijaya Group" width="30" height="30"/>
                        Wijaya Tea Factory</h2>
                    Rev. Pagngnaloka Mawatha, Urala. Tp:071 229 6004
                </td></tr>
            <tr><td align="center" colspan="2">
                    Daily Tea Collection
                </td></tr>
            <tr></tr>
            <tr></tr>
            <tr>
                <td>System Id:</td>
                <td><%out.print(rst.getString(1));%></td>
            </tr>
            <tr>
                <td>Date:</td>
                <td><%out.print(rst.getDate(2));%></td>
            </tr>
            <tr>
                <td>Collection Id:</td>
                <td><%out.print(rst.getString(3));%></td>
            </tr>
            <tr>
                <td>Total Weight:</td>
                <td><%out.print(rst.getDouble(4) + " Kg");%></td>
            </tr>
            <tr>
                <td>Deduct Weight:</td>
                <td><%out.print(rst.getDouble(5) + " Kg");%></td>
            </tr>
            <tr>
                <td>Net Weight:</td>
                <td><%out.print(rst.getDouble(6) + " Kg");%></td>
            </tr>
            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
            <tr></tr>
            <tr>
                <td></td>
                <td>--------------------</td>
            </tr>
            <tr>
                <td></td>
                <td>Signature</td>
            </tr>

        </table>  <a href="#" onclick="javascript:window.print();" >Print Bill</a>
    </body>
</html>
