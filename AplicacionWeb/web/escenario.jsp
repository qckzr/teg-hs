<%-- 
    Document   : escenario
    Created on : Aug 11, 2013, 12:11:03 AM
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>function closeWin() { window.close(); }</script>"
    </head>
    <body>
        <div id="nombre"><p>${nombre}</p></div>
        <div id="descripcion"><p>${descripcion}</p></div>
        <div id="imagen"><img src="${imagen}"/></div> 
          
            <input type="button" value="Cerrar" onclick="closeWin()"/>
       
    </body>
</html>
