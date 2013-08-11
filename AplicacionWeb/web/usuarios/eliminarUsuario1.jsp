<%-- 
    Document   : eliminarUsuario1
    Created on : Jul 25, 2013, 11:41:57 PM
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
       
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/EliminarUsuarioServlet1">
        <select name="usuarios">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre,apellido FROM usuarios" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.nombre} ${row.apellido}</option>
	</c:forEach>
        </select>
        <input type="submit" value="Enviar"/> 
        </form>
        <div id="results">
        </div>
    </body>
</html>
