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
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formulariosArchivos.js"></script>
        <script src="scripts/ejecutableNodos.js"></script>
        <script src="scripts/checkboxEventos.js"></script>

    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/CrearEjecutableServlet">
            <h1 class="text-center pull-left page-header">Crear Ejecutable</h1>
            <div class="row-fluid pull-left">
                <div class="control-group">
                    <label class="control-label">Tipo de Ejecutable: </label>
                    <div class="controls">
                        <select name="tipoEjecutable">
                            <option value="CLIENTE">Cliente</option>
                            <option value="SERVIDOR">Servidor</option>
                        </select>
                    </div>
                </div>
                <div class="control-group">     
                    <label class="control-label">Aplicacion:</label>
                    <div class="controls">
                        <select  id="aplicacion" name="aplicacion">
                            <sql:query dataSource="${localSource}" 
                                       sql="SELECT id,nombre FROM aplicaciones" 
                                       var="result" />

                            <c:forEach var="row" items="${result.rows}">

                                <option value="${row.id}">${row.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Nodo:</label>
                    <div class="controls">
                        <span name="node" id="node">

                        </span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Eventos:</label>
                    <div class="controls">
                        <span name="eventos" id="eventos">
                            <sql:query dataSource="${localSource}" 
                                       sql="SELECT id,nombre FROM eventos" 
                                       var="result" />

                            <c:forEach var="row" items="${result.rows}">

                                <label>${row.nombre} <input type="checkbox" 
                                                            class="checkboxEvento" id="${row.id}"/></label>
                                <input type="hidden" name="evento${row.id}" id="evento${row.id}" value="false"/>
                            </c:forEach>
                        </span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Parametros:</label>
                    <div class="controls">
                        <select onchange="parametrosAplicaciones(this.value);">
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
                    </div>
                </div>
                <h2 class="text-center pull-left  page-header">Parametros: </h2>
                <div class="row-fluid pull-left">
                    <span id="Parametros"></span>
                </div>
                <div class="controls pull-left">
                    <input type="hidden" id="cantidadParametros" name="cantidadParametros"/>

                    <input type="submit" value="Enviar" class="btn"/>
                </div>
            </div>
        </form>
        <div id="results"></div>
    </body>
</html>
