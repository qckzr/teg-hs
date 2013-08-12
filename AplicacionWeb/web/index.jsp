<%-- 
    Document   : index
    Created on : Jul 24, 2013, 3:45:42 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistemas Distribuidos</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="scripts/iniciarSesion.js"></script>
    </head>
    <body>
        <ul>
            <li><a href="topicos.jsp">Topicos</a></li>
            <li><a href="gestion.jsp">Gestion</a></li>
        </ul>
        <div id="infoUsuario">
            
                <label>Usuario:<input type="text" name="usuario" id="usuario"/></label>
                <label>Password:<input type="password" name="contrasena" id="contrasena"/></label>
                <input type="button" id="login" value="Entrar"/>
                
            
        </div>
        <a href="#" id="logout">Salir</a>
    </body>
</html>
