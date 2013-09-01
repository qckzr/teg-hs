<%-- 
    Document   : eliminarAplicacion2
    Created on : Jul 30, 2013, 9:33:31 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/EliminarAplicacionServlet2">
             <h1 class="text-center pull-left page-header">Eliminar Aplicación</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                <div class="span6">
             <dl class="dl-horizontal"> 
                 <dt>Nombre:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                 <dt>Fecha Actualización:</dt> <dd><p class="text-justify">${fecha_actualizacion}</p></dd>
                 <dt>Instrucciones:</dt> <dd><p class="text-justify">${instrucciones}</p></dd>
                 <dt>Topico:</dt> <dd><p class="text-justify">${topico}</p></dd>
            </dl>
             
            <dl class="dl-horizontal">
             <c:forEach var="row" items="${escenarios}">
           
                 <dt>Escenario:</dt> <dd><p class="text-justify">${row[0]}</p></dd>
                 <dt>Descripcion:</dt><dd><p class="text-justify">${row[1]}</p></dd>
            </c:forEach>
            </dl>
            </div>
            </div>
            <div class="controls">
                <input type="submit" value="Enviar" class="btn" />
            <input type="hidden" value="${id}" name="id"/>
            </div>
            </div>
        </form>
        <div id="results"></div>
    </body>
</html>
