<%-- 
    Document   : dailysummary
    Created on : Jan 16, 2016, 9:46:48 AM
    Author     : Aruna Csw
--%>

<%@page import="com.fims.dao.DailyCollectionDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% out.print("before display");%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
        ...
        <table>
            <c:forEach items="${dcollst}" var="dcollst">
                <tr>
                    <td>${dcollst.system_id}</td>
                    <td><c:out value="${product.date}" /></td>
                    <td><c:out value="${product.collection_id}" /></td>
                                        <td><c:out value="${product.total_weight}" /></td>
                    <td><c:out value="${product.deduct_weight}" /></td>
                    <td><c:out value="${product.net_weight}" /></td>

                </tr>
            </c:forEach>
        </table>
    </body>
</html>
