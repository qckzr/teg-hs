<%-- 
    Document   : cargarEjecutable
    Created on : Jul 28, 2013, 8:56:49 PM
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
        <script src="scripts/parametrosAplicaciones.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formulariosArchivos.js"></script>
        <script src="scripts/ejecutableNodos.js"></script>
    </head>
    <body>
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/CrearEjecutableServlet">
            
            <label>Tipo de Ejecutable: </label><select name="tipoEjecutable">
                <option value="CLIENTE">Cliente</option>
                <option value="SERVIDOR">Servidor</option>
            </select>
            <label>Aplicacion:</label><select  id="aplicacion" name="aplicacion">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM aplicaciones" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.nombre}</option>
	</c:forEach>
        </select> <label>Nodo:
        <span name="node" id="node">

        </span></label>
            <label>Parametros:</label><select onchange="parametrosAplicaciones(this.value);">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    </select> 
            <span id="Parametros"></span><br/>
            <input type="hidden" id="cantidadParametros" name="cantidadParametros"/>
            
            <input type="submit" value="Enviar"/>
        </form>
        <div id="results"></div>
    </body>
</html>
