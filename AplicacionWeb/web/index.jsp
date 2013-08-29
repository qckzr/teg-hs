<%-- 
    Document   : index
    Created on : Jul 24, 2013, 3:45:42 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistemas Distribuidos</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="scripts/iniciarSesion.js"></script>
        <script  type="text/javascript" src="scripts/jquery-ui-1.10.3.custom.js"></script>
        <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css">
        <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
        <link rel="stylesheet" type="text/css" href="styles/general.css">
       
        <script>
            $(function() {
                $( "a, input[type=button]" )
                .button()
               
                });
  </script>
    </head>
    <body>
        <div id="contenido" >
            <div id="main">
            <div id="titulo" class="col w10"><h1 class="content">Infraestructura Tecnológica con Fines Educativos Sobre Sistemas Distribuidos v1.0</h1></div>
        <div id="infoUsuario" class="col w1">
            
            <div class="content">
                <%--<c:choose>
                                <c:when test="${sessionScope.nombre == asd}"> --%>
                                    <label>Usuario:<input type="text" name="usuario" id="usuario" class="input"/></label>
                                    <label>Password:<input type="password" name="contrasena" id="contrasena" class="input"/></label>
                                    <input type="button" id="login" class="button" value="Entrar"/> 
<%--                                 </c:when>
                                <c:otherwise> --%>
                                    <a href="#" id="logout">Salir</a>
<%--                                </c:otherwise>
                </c:choose> --%>
                
                
            </div>
            
        </div>
        <div id="menu" class="col w10">
        
            <a  class="content"href="topicos.jsp">Tópicos</a>
            <a  class="content"href="gestion.jsp">Gestión</a>
        
        </div>
            </div>
        </div>
        <div id="footer">
            <p>Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p>
        </div>
    </body>
</html>
