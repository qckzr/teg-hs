<%-- 
    Document   : eliminarUsuario2
    Created on : Jul 25, 2013, 11:42:05 PM
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
        <form action="${pageContext.request.contextPath}/EliminarUsuarioServlet2" method="POST">
            <p>Nombre: ${nombre}</p>
            <p>Apellido ${apellido}</p>
            <p>Correo ${correo}</p>
            <p>Contrasena ${contrasena}</p>
            <input type="hidden" value="${id}" name="id"/>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
