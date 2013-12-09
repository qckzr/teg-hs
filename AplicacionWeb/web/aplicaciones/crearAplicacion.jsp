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
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formulariosArchivos.js"></script>

    </head>
    <body>

        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/CrearAplicacionServlet" enctype="multipart/form-data">
            <h1 class="text-center pull-left page-header">Crear Aplicacion</h1>
            <div class="row-fluid pull-left">
                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre: </label>
                    <div class="controls">
                        <input type="text" name="nombre" class="span12"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="instrucciones">Instrucciones: </label>
                    <div class="controls">
                        <textarea name="instrucciones" class="span12"></textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="topicos">Topico:</label>
                    <div class="controls">
                        <select name="topicos">
                            <sql:query dataSource="${localSource}" 
                                       sql="SELECT id,nombre FROM topicos" 
                                       var="result" />
                            <c:forEach var="row" items="${result.rows}">
                                <option value="${row.id}">${row.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Escenarios:</label>
                    <div class="controls">
                        <select onchange="escenariosAplicaciones(this.value);">
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                        </select> 
                    </div>
                </div>
                <h2 class="text-center pull-left  page-header">Escenarios: </h2>
                <div class="row-fluid pull-left">
                    <span id="Escenarios"></span><br/>
                </div>
                <div class="controls pull-left">
                    <input type="hidden" id="cantidadEscenarios" name="cantidadEscenarios"/>
                    <input type="submit" value="Enviar" class="btn"/>
                </div>

            </div>
        </form>
        <div id="results"></div>
    </body>
</html>
