<%-- 
    Document   : eliminarNodo2
    Created on : Jul 31, 2013, 11:55:29 AM
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
        <form method="POST" action="${pageContext.request.contextPath}/EliminarNodoServlet2">
              <label>IP: ${ip}</label><br/>
             <label>Nombre Usuario: ${usuario}</label><br/>
             <label>Contrasena ${contrasena}</label><br/>
             <input type="hidden" name="id" value="${id}"/>
             <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
