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
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formularios.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <script type="text/javascript" src="media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="scripts/convertirAdataTable.js"></script>
        <script type="text/javascript" src="scripts/dataTableEvento.js"></script>

    </head>
    <body>
       
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/EliminarEventoServlet1">
            <h1 class="page-header text-center pull-left">Eliminar Evento</h1>
             <div class="row-fluid pull-left">
             <table id="tabla" class="display">
                        <thead>
                    <tr>
                        <th>Nombre evento</th>
                        
                    </tr>
                </thead>
                <tbody>
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM eventos" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <tr>
                <td><a href="#" id="${row.id}" class="idEvento">${row.nombre}</a></td>
            </tr>
	</c:forEach>
                </tbody>
             </table>
        <div class="controls">
            <input type="submit" value="Enviar" class="btn" id="enviar"/>
            <input type="hidden" name="eventos" id="eventos" value="0"/>
        </div>
             </div>
        </form>
        <div id="results">
        </div>
    </body>
</html>
