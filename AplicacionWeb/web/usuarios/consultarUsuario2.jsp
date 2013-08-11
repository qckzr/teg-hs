<%-- 
    Document   : consultarUsuario2
    Created on : Jul 25, 2013, 11:51:29 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/respuesta.js"></script>
    </head>
    <body>
        
            <p>Nombre: ${nombre}</p>
            <p>Apellido ${apellido}</p>
            <p>Correo ${correo}</p>
            <p>Contrasena ${contrasena}</p>
            <input type="button" id="regresar" value="Regresar"/>
    </body>
</html>
