<%-- 
    Document   : modificarUsuario1.jsp
    Created on : Jul 25, 2013, 12:53:10 AM
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
        <form method="POST" action="${pageContext.request.contextPath}/ModificarUsuarioServlet1">
        <select name="usuarios">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre,apellido FROM usuarios" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.nombre} ${row.apellido}</option>
	</c:forEach>
        </select>
        <input type="submit" value="Enviar"/>
        </form> <!--<c:out value="${product.name}" default="Not Available" escapeXml="true"></c:out> -->
    </body>
</html>
