<%-- 
    Document   : eliminarEjecutable1
    Created on : Jul 28, 2013, 11:27:21 PM
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
        <script type="text/javascript" src="media/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="scripts/convertirAdataTable.js"></script>
        <script type="text/javascript" src="scripts/dataTableEjecutable.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/EliminarEjecutableServlet1">
            <h1 class="text-center pull-left page-header">Eliminar Ejecutable</h1>
             <div class="row-fluid pull-left">
            <table id="tabla" class="display">
                <thead>
                    <tr>
                        <th>Nombre ejecutable</th>
                        
                        <th>Tipo</th>
                        <th> Nombre Aplicacion</th>
                    </tr>
                </thead>
                <tbody>
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT e.id, e.nombre,e.tipo, concat(a.nombre,'') as nombreAplicacion 
                   FROM ejecutables e, aplicaciones a where e.id_aplicacion = a.id" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <tr>
                <td><a href="#" id="${row.id}" class="idEjecutable">${row.nombre}</a></td>
                <td>${row.tipo}</td>
                <td>${row.nombreAplicacion}</td>
            </tr>
	</c:forEach>
                </tbody>
            </table>
        <div class="controls">
            <input type="submit" value="Enviar" class="btn" id="enviar"/>
            <input type="hidden" name="ejecutables" id="ejecutables" value="0"/>
        </div>
             </div>
         </form>
        <div id="results"></div>
    </body>
</html>
