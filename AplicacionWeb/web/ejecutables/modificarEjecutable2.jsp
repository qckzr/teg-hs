<%-- 
    Document   : modificarEjecutable2
    Created on : Aug 5, 2013, 2:05:19 AM
    Author     : sam
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
        <form method="POST" action="${pageContext.request.contextPath}/ModificarEjecutableServlet2" enctype="multipart/form-data">
            <label>Nombre: ${nombre}</label><br/>
             <label>Tipo: <select name="tipo">
                     <c:set var="tipoAplicacion" value="CLIENTE"/>       
                     <c:choose>
                                
                                 <c:when test="${tipo == tipoAplicacion}">
                                      <option value="CLIENTE" selected="selected">CLIENTE </option>
                                      <option value="SERVIDOR">SERVIDOR </option>
                                 </c:when>
                                  <c:otherwise>
                                      <option value="CLIENTE" >CLIENTE </option>
                                      <option value="SERVIDOR" selected="selected">SERVIDOR </option>
                                  </c:otherwise>
                             </c:choose></select></label><br/>
             <label>Ruta Ejecutable: ${ruta_ejecutable}</label><br/>
             <label>Nuevo Ejecutable: <input type="file" name="ejecutable"/></label><br/>
             <label>Aplicacion: <select name="aplicaciones">
                       <sql:query dataSource="${localSource}" 
                    sql="SELECT id, nombre FROM aplicaciones" 
	           var="result" />
        
                    <c:forEach var="row" items="${result.rows}">
                         <c:choose>
                                 <c:when test="${row.id == aplicacion}">
                                      <option value="${row.id}" selected="selected">${row.nombre} </option>
                                 </c:when>
                                  <c:otherwise>
                                      <option value="${row.id}">${row.nombre} </option>
                                  </c:otherwise>
                             </c:choose>
                    
                    </c:forEach>
                 </select> </label><br/>
             <c:forEach var="row" items="${parametros}">
                    <c:set var="cantidadParametros" value="1"/>
                    <label>Nombre: <input name="nombreParametro${cantidadParametros}" value="${row[0]}"/></label> 
                    <label>Valor: <input name="valorParametro${cantidadParametros}" value="${row[1]}" /></label> 
                    <input type="hidden" value="${row[2]}" name="idParametro${cantidadParametros}"/>
                    <c:set var="cantidadEscenarios" value="${cantidadParametros + 1}" scope="page"/>
                    
            </c:forEach>
            <input type="Submit" value="Enviar"/>
            <input type="hidden" value="${id}" name="id"/>
            <input type="hidden" value="${cantidadParametros}" name="cantidadParametros"/>
        </form>
    </body>
</html>
