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
    </head>
    <body>
        <ul>
            <li><a href="topicos.jsp">Topicos</a></li>
            <li><a href="gestion.jsp">Gestion</a></li>
        </ul>
        <div id="login">
            <form>
                <label>Usuario:<input type="text" name="usuario"/></label>
                <label>Password:<input type="password" name="contrasena"/></label>
                <input type="submit" value="Entrar"/>
            </form>
        </div>
  
    </body>
</html>
