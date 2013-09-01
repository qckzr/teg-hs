<%-- 
    Document   : consultarPregunta2
    Created on : Jul 30, 2013, 1:34:14 AM
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
        <script src="scripts/respuesta.js"></script>
    </head>
    <body>
        <form class="form-horizontal">
          <h1 class="text-center pull-left page-header">Consultar Pregunta</h1>           
             <div class="row-fluid pull-left">
            <div class="control-group">
                 <div class="span4">
             <dl class="dl-horizontal"> 
                 <dt>Enunciado:</dt> <dd><p class="text-justify">${enunciado}</p></dd>
                 <dt>Topico:</dt> <dd><p class="text-justify">${topico}</p></dd>
                 <c:set var="respuesta" value="SI"/>
                    <c:forEach var="row" items="${preguntas}">
                        <c:choose>
                            <c:when test="${row[1] == respuesta}">
                            <dt>Opcion:</dt> <dd><p class="text-justify">${row[0]} - Respuesta Correcta</p></dd>
                    </c:when>
                    <c:otherwise>
                        <dt>Opcion:</dt> <dd><p class="text-justify">${row[0]}</p></dd>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
                
            </dl>
             </div>
             </div>
                    <div class="controls">
                        <input type="button" id="regresar" value="Regresar"/>
                    </div>
             </div>
        </form>
    </body>
</html>
