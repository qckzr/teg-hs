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
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/EliminarEjecutableServlet2">
        <label>Nombre: ${nombre}</label><br/>
             <label>Tipo: ${tipo}</label><br/>
             <label>Ruta Ejecutable: ${ruta_ejecutable}</label><br/>
             <label>Aplicacion: ${aplicacion}</label><br/>
             <c:forEach var="row" items="${parametros}">
           
                 <p>Nombre: ${row[0]} - Valor: ${row[1]}</p> 
            </c:forEach>
            <input type="Submit" value="Enviar"/>
            <input type="hidden" value="${id}" name="id"/>
        </form>
    </body>
</html>
