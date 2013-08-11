<%-- 
    Document   : modificarAplicacion2
    Created on : Jul 30, 2013, 9:33:01 PM
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
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/ModificarAplicacionServlet2" enctype="multipart/form-data">
            <label>Nombre: <input type="text" value="${nombre}" name="nombre"/></label><br/>
            <label>Fecha Actualizacion: <input type="text" name="fecha_actualizacion" value="${fecha_actualizacion}"></label><br/>
            <label>Instrucciones:<textarea  name="instrucciones">${instrucciones}</textarea></label><br/>
            <label>Topico: <select name="topicos">
                     <sql:query dataSource="${localSource}" 
                    sql="SELECT id, nombre, categoria FROM topicos" 
	           var="result" />
        
                    <c:forEach var="row" items="${result.rows}">
                         <c:choose>
                                 <c:when test="${row.id == idTopico}">
                                      <option value="${row.id}" selected="selected">${row.categoria}: ${row.nombre} </option>
                                 </c:when>
                                  <c:otherwise>
                                      <option value="${row.id}">${row.categoria}: ${row.nombre} </option>
                                  </c:otherwise>
                             </c:choose>
                    
                    </c:forEach>
                         
                </select></label><br/>
            <label>Escenarios: </label><br/>
           
                 <c:set var="cantidadEscenarios" value="1"/>
                <c:forEach var="escenario" items="${escenarios}">
                    <input type="hidden" name="idEscenario${cantidadEscenarios}" value="${escenario[3]}"/>
                    <input type="text" name="escenario${cantidadEscenarios}" value="${escenario[0]}"/>
                    <textarea name="descripcion${cantidadEscenarios}">${escenario[1]}</textarea>
                    <label>Imagen: ${escenario[2]}</label><input type="file" name="imagen${cantidadEscenarios}" /><br/>s
                    <c:set var="cantidadEscenarios" value="${cantidadEscenarios + 1}" scope="page"/>
                    
                </c:forEach>
            <br/>
            <input type="hidden" value="${id}" name="id"/>
            <input type="submit" value="Enviar"/>            
        </form>
            <div id="results"></div>
    </body>
</html>
