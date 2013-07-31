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
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/EliminarAplicacionServlet2">
         <label>Nombre: ${nombre}</label><br/>
             <label>Fecha Actualizacion: ${fecha_actualizacion}</label><br/>
             <label>Instrucciones:  ${instrucciones}</label><br/>
             <label>Topico: ${topico}</label><br/>
             <c:forEach var="row" items="${escenarios}">
           
                 <p>Escenario ${row[0]} - Descripcion: ${row[1]}</p> 
            </c:forEach>
            <input type="submit" value="Enviar" />
            <input type="hidden" value="${id}" name="id"/>
        </form>
    </body>
</html>
