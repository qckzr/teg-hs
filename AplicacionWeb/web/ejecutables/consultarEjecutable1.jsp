<%-- 
    Document   : consultarEjecutable
    Created on : Jul 28, 2013, 11:27:37 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@include file="../conexionBD.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <form method="POST" action="${pageContext.request.contextPath}/ConsultarEjecutableServlet1">
        <select name="ejecutables">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre,tipo FROM ejecutables" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.nombre} - ${row.tipo}</option>
	</c:forEach>
        </select>
        <input type="submit" value="Enviar"/>
         </form>
    </body>
</html>
