<%-- 
    Document   : crearNodo
    Created on : Jul 31, 2013, 11:29:32 AM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/CrearNodoServlet">
            <label>Ip:</label><input type="text" name="ip"/>
            <label>Usuario:</label><input type="text" name="usuario"/>
            <label>Contrasena:</label><input type="password" name="contrasena"/>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
