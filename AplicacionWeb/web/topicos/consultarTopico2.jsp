<%-- 
    Document   : consultaTopico2
    Created on : Jul 28, 2013, 1:50:57 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/respuesta.js"></script>
    </head>
    <body>
        <form class="form-horizontal">
         <h1 class="text-center pull-left page-header">Consultar Topico</h1>           
             <div class="row-fluid pull-left">
                
            <div class="control-group">
                 <div class="span12">
             <dl class="dl-horizontal"> 
                 <dt>Nombre:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                 <dt>Categoria:</dt> <dd><p class="text-justify">${categoria}</p></dd>
                 <dt>Descripcion:</dt> <dd><p class="text-justify">${descripcion}</p></dd>
                 <dt>Usuario:</dt> <dd><p class="text-justify">${usuario}</p></dd>
            </dl>
             </div>
             </div>
            <div class="controls">
            
                
                <input type="button" id="regresar" value="Regresar" class="btn"/>   
            </div>
             </div>
        </form>
    </body>
</html>
