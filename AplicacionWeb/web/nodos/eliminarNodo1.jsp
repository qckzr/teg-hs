<%-- 
    Document   : eliminarNodo1
    Created on : Jul 31, 2013, 11:55:23 AM
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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/EliminarNodoServlet1">
        <select name="nodos">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id, ip FROM nodos" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.ip}</option>
	</c:forEach>
        </select>
        <input type="submit" value="Enviar"/>
        </form>
        <div id="results"></div>
    </body>
</html>
