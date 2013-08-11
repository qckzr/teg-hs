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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/EliminarPreguntaServlet2">
             <label>Enunciado: ${enunciado}</label><br/>
             <label>Topico: ${topico}</label><br/>
             <c:set var="respuesta" value="SI"/>
             <c:forEach var="row" items="${preguntas}">
                <c:choose>
                    <c:when test="${row[1] == respuesta}">
                        <p>Nombre: ${row[0]} - Respuesta Correcta</p> 
                    </c:when>
                    <c:otherwise>
                        <p>Nombre: ${row[0]}</p> 
                    </c:otherwise>
                </c:choose>
            </c:forEach>
                    <input type="submit" value="Enviar"/>
                    <input type="hidden" name="id" value="${id}"/>
             </form>
             <div id="results"></div>
    </body>
</html>
