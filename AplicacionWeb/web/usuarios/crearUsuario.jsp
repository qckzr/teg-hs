<%-- 
    Document   : crearUsuario
    Created on : Jul 24, 2013, 3:55:34 PM
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
        <form  action="${pageContext.request.contextPath}/CrearUsuarioServlet" method="POST">
            <label>Nombre: </label><input name="nombre" type="text"/><br/>
            <label>Apellido: </label><input name="apellido" type="text"/><br/>
            <label>Correo: </label><input name="correo" type="text"/><br/>
            <label>Contrasena </label><input name="contrasena" type="text"/><br/>
            <input type="submit" value="Enviar"/><br/>
            
        </form>
    </body>
</html>
