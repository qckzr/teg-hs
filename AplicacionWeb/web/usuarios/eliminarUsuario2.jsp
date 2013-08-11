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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios" action="${pageContext.request.contextPath}/EliminarUsuarioServlet2" method="POST">
            <p>Nombre: ${nombre}</p>
            <p>Apellido ${apellido}</p>
            <p>Correo ${correo}</p>
            <p>Contrasena ${contrasena}</p>
            <input type="hidden" value="${id}" name="id"/>
            <input type="submit" value="Enviar"/>
        </form>
            <div id="results">
            </div>
                 
    </body>
</html>
