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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarEjecutableServlet2" >
              <h1 class="text-center pull-left page-header">Modificar Ejecutable</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label">Nombre:</label> 
                <div class="controls">
                    <input type="text" value="${nombre}"  disabled class="span6"/>
                </div>
            </div>
                <div class="control-group">
                    <label class="control-label">Tipo:</label>
                    <div class="controls">
                        <select name="tipo">
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
                             </c:choose></select></div>
                </div>
                   <div class="control-group">                   
                       <label class="control-label">Ruta Ejecutable:</label> 
                       <div class="controls">
                           <input type="text" value="${ruta_ejecutable}"disabled class="span6"/>
                       </div>
                   </div>
                    
            <div class="control-group">
                <label class="control-label">Aplicacion: </label>
                <div class="controls">
                    <select name="aplicaciones">
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
                 </select>
                </div>
            </div>
            <h2 class="text-center pull-left  page-header">Parametros: </h2>
                <div class="row-fluid pull-left">
                    <c:set var="cantidadParametros" value="1"/>
             <c:forEach var="row" items="${parametros}">
                    
                    <div class="control-group">
                        <label class="control-label">Nombre: </label>
                        <div class="controls">
                            <input name="nombreParametro${cantidadParametros}" value="${row[0]}"/>
                        </div>
                    </div>
                        <div class="control-group">
                        <label class="control-label">Valor: </label>
                        <div class="controls">
                                <input name="valorParametro${cantidadParametros}" value="${row[1]}" />
                        </div>
                    
                    <input type="hidden" value="${row[2]}" name="idParametro${cantidadParametros}"/>
                    <c:set var="cantidadParametros" value="${cantidadParametros + 1}" scope="page"/>
                    </div>
            </c:forEach>
                    </div>
                    <div class="controls pull-left">
                    
                        <input type="Submit" value="Enviar" class="btn"/>
            <input type="hidden" value="${id}" name="id"/>
            <input type="hidden" value="${cantidadParametros -1}" name="cantidadParametros"/>
                    </div>
             </div>
        </form>
        <div id="results"></div>
    </body>
</html>
