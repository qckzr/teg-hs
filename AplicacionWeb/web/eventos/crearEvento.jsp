<%-- 
    Document   : crearUsuario
    Created on : Jul 24, 2013, 3:55:34 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script  src="${pageContext.request.contextPath}/scripts/formularios.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    </head>
    <body>
        <form  class="formularios form-horizontal"  action="${pageContext.request.contextPath}/CrearEventoServlet" method="POST">
           
            <h1 class="text-center pull-left page-header">Crear Evento</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label" for="nombre">Nombre:</label>
                <div class="controls">
                    <input name="nombre" id="nombre" type="text" placeholder="Nombre"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="path">Path Script:</label>
                <div class="controls">
                    <input name="path" id="path" type="text" placeholder="Script"/>
                </div>
            </div>
            
         <div class="controls"> 
       <input type="submit" value="Enviar" class="btn"/>
  </div>
            </div>
        </form>
            <div id="results"></div>
                 
    </body>
</html>
