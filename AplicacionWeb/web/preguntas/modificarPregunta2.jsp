<%-- 
    Document   : modificarPregunta2
    Created on : Aug 5, 2013, 12:39:28 AM
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
        <script src="scripts/validarUnicaRespuesta.js"></script>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formularios.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarPreguntaServlet2">
            <h1 class="text-center pull-left page-header">Modificar Pregunta</h1>           
            <div class="row-fluid pull-left">
                <div class="control-group">
                    <label class="control-label" for="Enunciado">Enunciado:</label>
                    <div class="controls">
                        <textarea name="enunciado" cols="50" rows="3" class="span6">${enunciado}</textarea>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="topicos">Topico:</label>
                    <div class="controls">
                        <select name="topicos" class="span6">
                            <sql:query dataSource="${localSource}" 
                                       sql="SELECT id, nombre, categoria FROM topicos" 
                                       var="result" />

                            <c:forEach var="row" items="${result.rows}">
                                <c:choose>
                                    <c:when test="${row.id == topico}">
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
                <c:set var="respuesta" value="SI"/>
                <c:set var="contadorPregunta" value="1"/>
                <c:forEach var="row" items="${preguntas}">
                    <c:choose>
                        <c:when test="${row[1] == respuesta}">
                            <div class="control-group">
                                <label class="control-label" for="respuesta${contadorPregunta}">Respuesta ${contadorPregunta}: </label>
                                <div class="controls">
                                    <input type="text" name="respuesta${contadorPregunta}" value="${row[0]}"/>
                                </div>
                                <label class="control-label" for="checkbox${contadorPregunta}">Respuesta Correcta:</label>
                                <div class="controls">
                                    <input type="checkbox" name="checkbox${contadorPregunta}" id="checkbox${contadorPregunta}" value="'SI'" checked="checked" onclick="validarUnicaRespuesta(checkbox${contadorPregunta})"/>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="control-group">
                                <label class="control-label" for="respuesta${contadorPregunta}">Respuesta ${contadorPregunta}:</label>
                                <div class="controls">
                                    <input type="text" name="respuesta${contadorPregunta}" value="${row[0]}"/>
                                </div>
                                <label class="control-label" for="checkbox${contadorPregunta}">Respuesta Correcta:</label> 
                                <div class="controls">
                                    <input type="checkbox" name="checkbox${contadorPregunta}" id="checkbox${contadorPregunta}" value="NULL" onclick="validarUnicaRespuesta(checkbox${contadorPregunta})"/>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <input type="hidden" name="idRespuesta${contadorPregunta}" value="${row[2]}"/>
                    <c:set var="contadorPregunta" value="${contadorPregunta + 1}" scope="page"/>
                </c:forEach>
                <div class="controls">
                    <input type="submit" value="Enviar" class="btn"/>
                    <input type="hidden" name="id" value="${id}" />
                </div>
            </div>

        </form>
        <div id="results"></div>   
    </body>
</html>
