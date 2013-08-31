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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        <form class="formularios form-horizontal" action="${pageContext.request.contextPath}/EliminarUsuarioServlet2" method="POST">
             <h1 class="page-header text-center pull-left">Eliminar Usuario</h1>
             <div class="control-group">
                 <div class="span4">
             <dl class="dl-horizontal"> 
                 <dt>Nombre:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                 <dt>Apellido:</dt> <dd><p class="text-justify">${apellido}</p></dd>
                 <dt>Correo:</dt> <dd><p class="text-justify">${correo}</p></dd>
                 <dt>Contrasena:</dt> <dd><p class="text-justify">${contrasena}</p></dd>
            </dl>
             </div>
             </div>
            <div class="span2 offset2">
            <input type="hidden" value="${id}" name="id"/>
            <input type="submit" value="Enviar" class="btn"/>
            </div>
        </form>
            <div id="results">
            </div>
                 
    </body>
</html>
