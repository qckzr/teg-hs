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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios"  action="${pageContext.request.contextPath}/CrearUsuarioServlet" method="POST">
            <label>Nombre: </label><input name="nombre" type="text"/><br/>
            <label>Apellido: </label><input name="apellido" type="text"/><br/>
            <label>Correo: </label><input name="correo" type="text"/><br/>
            <label>Contrasena </label><input name="contrasena" type="text"/><br/>
            <input type="submit" value="Enviar"/><br/>
            
        </form>
            <div id="results"></div>
                 
    </body>
</html>
