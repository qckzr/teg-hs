<%-- 
    Document   : crearTopico
    Created on : Jul 26, 2013, 11:48:36 AM
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
        <form action="${pageContext.request.contextPath}/CrearTopicoServlet" method="POST">
            <label>Nombre: <input type="text" name="nombre"/></label><br/>
            <label>Categoria: <select name="categoria"><br/>
                <option value="INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS">INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS</option>
                <option value="COMUNICACION EN SISTEMAS DISTRIBUIDOS">COMUNICACION EN SISTEMAS DISTRIBUIDOS</option>
                <option value="SINCRONIZACION EN AMBIENTES DISTRIBUIDOS">SINCRONIZACION EN AMBIENTES DISTRIBUIDOS</option>
                <option value="REPLICACION">REPLICACION</option>
                <option value="SISTEMAS DE ARCHIVOS DISTRIBUIDOS">SISTEMAS DE ARCHIVOS DISTRIBUIDOS</option>
                <option value="SERVICIOS DE NOMBRE">SERVICIOS DE NOMBRE</option>
                <option value="OBJETOS DISTRIBUIDOS">OBJETOS DISTRIBUIDOS</option>
                <option value="SERVICIOS WEB">SERVICIOS WEB</option>
            </select></label><br/>
            <label>Descripcion: <textarea name="descripcion"  cols="45" rows="5"></textarea></label><br/>
            <label>Imagen (Opcional): <input type="file" name="imagen"/></label><br/>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
