<%-- 
    Document   : subirArchivo
    Created on : Aug 8, 2013, 3:14:42 PM
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/SubirArchivoServlet" enctype="multipart/form-data">
            <input type="hidden" name="tipoArchivo" value="${tipoArchivo}"/>
            <c:set var="opcion1" value="topico"/>
            <c:set var="opcion2" value="ejecutable"/>
            <c:set var="opcion3" value="escenario"/>
            <c:choose>
                <c:when test="${tipoArchivo == opcion1}">
                    <input type="hidden" name="idTopico" value="${topico}"/>
                    <label>Imagen: <input type="file" name="archivo"/></label>

                </c:when>
                <c:when test="${tipoArchivo == opcion2}">

                    <input type="hidden" name="idEjecutable" value="${ejecutable}"/>
                    <c:forEach begin="1" end="${ejecutables}" varStatus="loop">
                        <label>Ejecutable: <input type="file" name="ejecutable${loop}"/></label>

                    </c:forEach>

                </c:when>
                <c:otherwise>

                    <c:forEach var="escenario" items="${idEscenarios}">
                        <c:set var="ids" value="1"/>
                        <input type="hidden" name="idEscenarios${ids}" value="${escenario}"/>
                        <c:set var="ids" value="${ids + 1}" scope="page"/>
                    </c:forEach>
                    <c:set var="cantidadEscenarios" value="1"/>
                    <c:forEach begin="1" end="${escenarios-1}" varStatus="loop">
                        <label>Escenario${cantidadEscenarios}: <input type="file" name="escenario${cantidadEscenarios}"/></label>
                            <c:set var="cantidadEscenarios" value="${cantidadEscenarios + 1}" scope="page"/>

                    </c:forEach>


                </c:otherwise>
            </c:choose>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
