<%-- 
    Document   : modificarNodo2
    Created on : Jul 31, 2013, 12:02:36 PM
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
        <form class="formularios" method="POST" action="${pageContext.request.contextPath}/ModificarNodoServlet2">
              <label>IP: <input type="text" name="ip" value="${ip}"/></label><br/>
              <label>Nombre Usuario: </label><input type="text" name="usuario" value="${usuario}"/><br/>
             <label>Contrasena <input type="password" name="contrasena" value="${contrasena}"/></label><br/>
             <input type="hidden" name="id" value="${id}"/>
             <input type="submit" value="Enviar"/>
        </form>
             <div id="results"></div>
    </body>
</html>
