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
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarAplicacionServlet2">
            <h1 class="text-center pull-left page-header">Modificar Aplicación</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                
                <label class="control-label">Nombre:</label> 
                <div class="controls">
                    <input type="text" value="${nombre}" name="nombre"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Fecha Actualizacion:</label> 
                <div class="controls">
                    <input type="text" name="fecha_actualizacion" value="${fecha_actualizacion}">
                </div>
            </div>
            <div class="control-group">    
                <label class="control-label">Instrucciones:</label>
                <div class="controls">
                    <textarea  name="instrucciones" class="span6">${instrucciones}</textarea>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Topico:</label> 
                <div class="controls">
                    <select name="topicos" class="span6">
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
                         
                </select>
                </div>
            </div>
            
                <h2 class="text-center pull-left  page-header">Escenarios: </h2>
                <div class="row-fluid pull-left">
                 <c:set var="cantidadEscenarios" value="1"/>
                <c:forEach var="escenario" items="${escenarios}">
                    <input type="hidden" name="idEscenario${cantidadEscenarios}" value="${escenario[3]}"/>
                    <div class="control-group">
                        <label class="control-label">Nombre:</label>
                        <div class="controls">
                            <input type="text" name="escenario${cantidadEscenarios}" value="${escenario[0]}"/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Descripción:</label>
                        <div class="controls">
                            <textarea name="descripcion${cantidadEscenarios}" class="span6">${escenario[1]}</textarea>
                        </div>
                    </div>
                        <div class="control-group">
                            <label class="control-label">Imagen:</label>
                            <div class="controls">
                                <p>${escenario[2]}</p>
                            </div>

                            </div>
                    <c:set var="cantidadEscenarios" value="${cantidadEscenarios + 1}" scope="page"/>
                    
                </c:forEach>
                </div>
                    <div class="controls pull-left">
                        <input type="hidden" value="${id}" name="id"/>
                        <input type="hidden" value="${cantidadEscenarios}" name="cantidadEscenarios"/>
                        <input type="submit" value="Enviar" class="btn"/>   
                    </div>
            </div>
        </form>
            <div id="results"></div>
    </body>
</html>
