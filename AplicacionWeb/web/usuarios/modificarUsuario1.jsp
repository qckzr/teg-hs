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
        <script src="scripts/formularios.js"></script>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script type="text/javascript" src="media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="scripts/convertirAdataTable.js"></script>
        <script type="text/javascript" src="scripts/dataTableUsuario.js"></script>
     
        
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarUsuarioServlet1">
            <h1 class="page-header text-center pull-left">Modificar Usuario</h1>
            <div class="row-fluid pull-left">
             <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre,apellido FROM usuarios" 
	           var="result" />
            <table id="tabla" class="display">
                <thead>
                    <tr>
                        <th>Id </th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                    </tr>
                </thead>
                <tbody>
        <c:forEach var="row" items="${result.rows}">
            <tr>
                <td><a href="#" class="idUsuario" id="${row.id}">${row.id}</a></td>
                <td>${row.nombre}</td>
                <td>${row.apellido}</td>
            </tr>

	</c:forEach>
                </tbody>
                </table>
        <div class="controls">
            <input type="submit" value="Enviar" class="btn" id="enviar"/>
            <input type="hidden" value="0" id="usuarios" name="usuarios"/>
        </div>
            </div>
        </form>
        <div id="results"></div>
    </body>
</html>
