<%-- 
    Document   : eliminarEjecutable2
    Created on : Jul 28, 2013, 11:27:30 PM
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
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/EliminarEjecutableServlet2">
            <h1 class="text-center pull-left page-header">Eliminar Ejecutable</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                 <div class="span4">
             <dl class="dl-horizontal"> 
                 <dt>Nombre:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                 <dt>Tipo:</dt> <dd><p class="text-justify">${tipo}</p></dd>
                 <dt>Ruta Ejecutable:</dt> <dd><p class="text-justify">${ruta_ejecutable}</p></dd>
                 <dt>Aplicacion:</dt> <dd><p class="text-justify">${aplicacion}</p></dd>
            </dl>
            
            <dl class="dl-horizontal">
                <c:forEach var="row" items="${parametros}">
                    <dt>Nombre:</dt><dd><p class="text-justify"> ${row[0]}</p></dd>
                    <dt>Valor:</dt><dd><p class="text-justify">${row[1]}</p> </dd>
                </c:forEach>
            </dl>
             </div>
             </div>
        
             
           
                 
                <div class="controls">
                    <input type="Submit" value="Enviar" class="btn"/>
            <input type="hidden" value="${id}" name="id"/>
                </div>
             </div>
        
        </form>
        <div id="results"></div>
    </body>
</html>
