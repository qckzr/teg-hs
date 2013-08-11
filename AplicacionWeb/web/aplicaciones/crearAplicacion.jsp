<%-- 
    Document   : crearAplicacion
    Created on : Jul 30, 2013, 9:30:10 PM
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
        <script src="scripts/escenariosAplicaciones.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formulariosArchivos.js"></script>
        
    </head>
    <body>
        
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/CrearAplicacionServlet" enctype="multipart/form-data">
            
            <label>Nombre: </label><input type="text" name="nombre"/>
            <label>Instrucciones: </label><textarea name="instrucciones"></textarea>
            <label>Topico:</label><select name="topicos">
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos" 
	           var="result" />
            <c:forEach var="row" items="${result.rows}">
                <option value="${row.id}">${row.nombre}</option>
            </c:forEach>
            </select>
             <label>Escenarios:</label><select onchange="escenariosAplicaciones(this.value);">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    </select> 
            <span id="Escenarios"></span><br/>
            <input type="hidden" id="cantidadEscenarios" name="cantidadEscenarios"/>
            <input type="submit" value="Enviar"/>
        </form>
            <div id="results"></div>
    </body>
</html>
