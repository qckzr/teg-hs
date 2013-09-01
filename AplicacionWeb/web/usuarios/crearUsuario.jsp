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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script  src="${pageContext.request.contextPath}/scripts/formularios.js"></script>
        <link rel="stylesheet" type="text/css" href="/css/bootstrap.css">
    </head>
    <body>
        <form  class="formularios form-horizontal"  action="${pageContext.request.contextPath}/CrearUsuarioServlet" method="POST">
           
            <h1 class="text-center pull-left page-header">Crear Usuario</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label" for="nombre">Nombre:</label>
                <div class="controls">
                    <input name="nombre" id="nombre" type="text" placeholder="Nombre"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="apellido">Apellido:</label>
                <div class="controls">
                    <input name="apellido" id="apellido" type="text" placeholder="Apellido"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="correo" >Correo:</label>
                <div class="controls">
                    <input name="correo" id="correo" type="text" placeholder="Correo"/>
                </div>
            </div>
            <div class="control-group" for="contrasena">
                <label class="control-label" for="contrasena">Contrasena</label>
                <div class="controls">
                    <input name="contrasena" id="contrasena" type="text" placeholder="Contrasena"/><br/>
                   
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
