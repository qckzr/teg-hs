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
        <title>Escenario: ${nombre}</title>
        <script>function closeWin() { window.close(); }</script>"
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        <h3 id="nombre" class="text-center page-header"><p>${nombre}</p></h3>
        <dl class="dl"> 
            <dt>Descripcion </dt><dd><p id="descripcion" class="text-justify">${descripcion}</p></dd>
            <dt id="imagen"></dt><dd><img src="${imagen}"/></dd> 
        </dl> 
        <div class="row-fluid">
            <input type="button" value="Cerrar" class="btn text-center offset5" onclick="closeWin()"/>
        </div>
       
    </body>
</html>
