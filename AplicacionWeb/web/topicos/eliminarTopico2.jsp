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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/EliminarTopicoServlet2">
               <h1 class="text-center pull-left page-header">Eliminar Topico</h1>           
             <div class="row-fluid pull-left">
                
            <div class="control-group">
                 <div class="span12">
             <dl class="dl-horizontal"> 
                 <dt>Nombre:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                 <dt>Categoria:</dt> <dd><p class="text-justify">${categoria}</p></dd>
                 <dt>Descripcion:</dt> <dd><p class="text-justify">${descripcion}</p></dd>
                 <dt>Usuario:</dt> <dd><p class="text-justify">${usuario}</p></dd>
                 <dt>Imagen:</dt> <dd><p class="text-justify">${imagen}</p></dd>
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
