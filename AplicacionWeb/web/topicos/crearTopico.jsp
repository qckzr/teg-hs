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
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/scripts/formulariosImagenes.js"></script>
       
          <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    </head>
    <body>
      
        <form class="formularios form-horizontal" action="${pageContext.request.contextPath}/CrearTopicoServlet" method="POST">
            
             <h1 class="text-center pull-left page-header">Crear Topico</h1>           
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label" for="nombre">Nombre:</label>
                <div class="controls">
                    <input type="text" name="nombre"/>
                </div>
            </div>
             <div class="control-group">
                 <label class="control-label" for="categoria">Categoria:</label> 
                <div class="controls">
                     
                     <select name="categoria" class="span5">
                <option value="INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS">INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS</option>
                <option value="COMUNICACION EN SISTEMAS DISTRIBUIDOS">COMUNICACION EN SISTEMAS DISTRIBUIDOS</option>
                <option value="SINCRONIZACION EN AMBIENTES DISTRIBUIDOS">SINCRONIZACION EN AMBIENTES DISTRIBUIDOS</option>
                <option value="REPLICACION">REPLICACION</option>
                <option value="SISTEMAS DE ARCHIVOS DISTRIBUIDOS">SISTEMAS DE ARCHIVOS DISTRIBUIDOS</option>
                <option value="SERVICIOS DE NOMBRE">SERVICIOS DE NOMBRE</option>
                <option value="OBJETOS DISTRIBUIDOS">OBJETOS DISTRIBUIDOS</option>
                <option value="SERVICIOS WEB">SERVICIOS WEB</option>
            </select></div>
                 
             </div>
                 <div class="control-group">
                    <label class="control-label" for="descripcion">Descripcion:</label> 
                    <div class="controls">
                        <textarea name="descripcion"  cols="60" rows="5"></textarea>
                    </div>
                 </div>
                 <div class="control-group">
                    <label class="control-label" for="checkboxImagen">¿Imagen?</label>
                    <div class="controls">
                        <input type="checkbox" name="checkboxImagen" id="checkboxImagen"/>
                    </div>
                 </div>
                 <div class="controls">     
                        <input type="hidden" name="imagen" id="imagen" value="false"/>
                        <input type="submit" value="Enviar" class="btn"/>
                 </div>
            </div>
        </form>

            <div id="results"></div>
    </body>
</html>
