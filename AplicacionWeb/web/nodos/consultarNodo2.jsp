<%-- 
    Document   : consultarNodo2
    Created on : Jul 31, 2013, 11:55:18 AM
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
        <label>IP: ${ip}</label><br/>
             <label>Nombre Usuario: ${usuario}</label><br/>
             <label>Contrasena ${contrasena}</label><br/>
             <input type="button" id="regresar" value="Regresar"/>
    </body>
</html>
