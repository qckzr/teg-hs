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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
        
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarUsuarioServlet1">
            <h1 class="page-header text-center pull-left">Modificar Usuario</h1>
            <div class="row-fluid pull-left">
             <div class="control-group">
                <label class="control-label" for="usuarios">Usuario:</label>
                <div class="controls">
                    <select name="usuarios" id="usuarios">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre,apellido FROM usuarios" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.nombre} ${row.apellido}</option>
	</c:forEach>
        </select>
                </div>
             </div>
        <div class="controls">
            <input type="submit" value="Enviar" class="btn"/>
        </div>
            </div>
        </form>
        <div id="results"></div>
    </body>
</html>
