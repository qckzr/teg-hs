<%-- 
    Document   : eliminarTopico2
    Created on : Jul 28, 2013, 12:39:21 PM
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
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/EliminarTopicoServlet2">
             <label>Nombre: ${nombre}</label><br/>
             <label>Categoria: ${categoria}</label><br/>
             <label>Descripcion: ${descripcion}</label><br/>
             <label>Usuario: ${usuario}</label><br/>
             <input type="hidden" name="id" value="${id}"/>
             <input type="submit" value="Enviar"/>
             
         </form>
             <div id="results"></div>
    </body>
</html>
