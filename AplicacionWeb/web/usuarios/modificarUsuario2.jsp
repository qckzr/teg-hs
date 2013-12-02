<%-- 
    Document   : modificarUsuario2.jsp
    Created on : Jul 25, 2013, 10:19:29 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="../conexionBD.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarUsuarioServlet2">
            <h1 class="text-center pull-left page-header">Modificar Usuario</h1>
            <div class="row-fluid pull-left">
                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre:</label>
                    <div class="controls">
                        <input type="text" value="${nombre}" name="nombre" id="nombre"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="apellido">Apellido: </label> 
                    <div class="controls">
                        <input type="text" value="${apellido}" name="apellido" id="apellido"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="correo">Correo:</label>
                    <div class="controls">
                        <input type="text" value="${correo}" name="correo" id="correo"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="contrasena">Contrasena:</label>
                    <div class="controls">
                        <input type="text" value="${contrasena}" name="contrasena" id="contrasena"/>
                    </div>
                </div>
                <div class="controls">        
                    <input type="hidden" value="${id}" name="id"/>
                    <input type="submit" value="Enviar" class="btn"/> 
                </div>    
            </div>
        </form>
        <div id="results"></div>
    </body>
</html>
