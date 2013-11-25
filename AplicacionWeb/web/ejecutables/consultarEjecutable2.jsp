<%-- 
    Document   : consultarEjecutable2
    Created on : Jul 28, 2013, 11:27:53 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/respuesta.js"></script>
    </head>
    <body>
        <form class="form-horizontal">
           <h1 class="text-center pull-left page-header">Consultar Ejecutable</h1>
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
                    <input type="button" id="regresar" value="Regresar" class="btn"/>
                </div>
             </div>
        </form>

    </body>
</html>
