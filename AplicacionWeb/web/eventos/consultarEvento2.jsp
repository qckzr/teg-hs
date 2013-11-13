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
        <form class="form-horizontal">
        <h1 class="page-header text-center pull-left">Consultar Evento</h1>
        <div class="row-fluid pull-left">
            <div class="control-group">
                 <div class="span12">
             <dl class="dl-horizontal"> 
                 <dt>Nombre:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                 <dt>Path:</dt> <dd><p class="text-justify">${path}</p></dd>
                 
            </dl>
             </div>
             </div>
            <div class="controls">
            <input type="button" id="regresar" class="btn" value="Regresar"/>
            </div>
        </div>
        </form>
            
    </body>
</html>
