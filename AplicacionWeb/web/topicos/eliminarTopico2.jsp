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
    </head>
    <body>
         <form method="POST" action="${pageContext.request.contextPath}/EliminarTopicoServlet2">
             <label>Nombre: ${nombre}</label><br/>
             <label>Categoria: ${categoria}</label><br/>
             <label>Descripcion: ${descripcion}</label><br/>
             <label>Usuario: ${usuario}</label><br/>
             <input type="hidden" name="id" value="${id}"/>
             <input type="submit" value="Enviar"/>
             
         </form>
    </body>
</html>
