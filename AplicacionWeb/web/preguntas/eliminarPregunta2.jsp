<%-- 
    Document   : eliminarPregunta2
    Created on : Jul 30, 2013, 1:34:28 AM
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
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/EliminarPreguntaServlet2">
            <h1 class="text-center pull-left page-header">Eliminar Pregunta</h1>           
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
                    <input type="submit" value="Enviar" class="btn"/>
                    <input type="hidden" name="id" value="${id}"/>
                </div>
            </div>
        </form>
        <div id="results"></div>
    </body>
</html>
