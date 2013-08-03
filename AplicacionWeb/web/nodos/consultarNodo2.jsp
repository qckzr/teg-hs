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
    </head>
    <body>
        <label>IP: ${ip}</label><br/>
             <label>Nombre Usuario: ${usuario}</label><br/>
             <label>Contrasena ${contrasena}</label><br/>
             <a href="nodos/nodos.jsp">Regresar</a>  
    </body>
</html>
