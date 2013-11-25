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
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/EliminarNodoServlet2">
            <h1 class="text-center pull-left page-header">Eliminar Nodo</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                <div class="span4">
             <dl class="dl-horizontal"> 
                 <dt>IP:</dt> <dd><p class="text-justify">${ip}</p></dd>
                 <dt>Nombre Usuario:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                 <dt>Contrasena:</dt> <dd><p class="text-justify">${contrasena}</p></dd>
            </dl>
             </div>
             </div>
            <div class="controls">
             <input type="hidden" name="id" value="${id}"/>
             <input type="submit" value="Enviar" class="btn"/>
            </div>
        </form>
             <div id="results"></div>
    </body>
</html>
