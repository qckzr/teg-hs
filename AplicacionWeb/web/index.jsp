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
        <script type="text/javascript" src="scripts/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <link rel="stylesheet" type="text/css" href="css/adicionales.css">
      <!--  <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css">
        <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
        <link rel="stylesheet" type="text/css" href="styles/general.css"> -->
       
        <script>
            $(function() {
                $( "a, input[type=button]" )
                .button()
               
                });
  </script>
    </head>
    <body>
        <div id="contenido" class="container-fluid" >
            <div id="main" class="row-fluid">
            <div id="titulo" class="span12"><h1 class="text-center page-header">Infraestructura Tecnológica con Fines Educativos Sobre Sistemas Distribuidos v1.0</h1></div>

          <div class="row-fluid">
                 <div id="menu" class="pull-left">
            <a  class="btn btn-large btn-primary btn-block" href="topicos.jsp">Tópicos</a>
            <a  class="btn btn-large btn-primary btn-block" href="gestion.jsp">Gestión</a>
        </div>
            <div id="infoUsuario" class="span1 offset1 pull-left">
            <div class="content">

                <fieldset> 
                            <legend>Login:</legend>
                    <c:choose>
                    <c:when test="${sessionScope.nombre == null}"> 
                       
                            <label>Usuario:<input type="text" name="usuario" id="usuario" class="input" placeholder="usuario@ucab.edu.ve"/></label>
                            <label>Password:<input type="password" name="contrasena" id="contrasena" class="input" placeholder="password"/></label>
                            <input type="button" id="login" class="btn" value="Entrar"/> 
                      
                     </c:when>
                    <c:otherwise>
                        <p>${sessionScope.nombre} ${sessionScope.apellido}</p>
                        <a href="#" class="btn" id="logout">Salir</a>
                    </c:otherwise>
                         
</c:choose>
                         </fieldset>
                   
                    
<%--                                 </c:when>
                                <c:otherwise> --%>

               
<%--                                </c:otherwise>

                </c:choose> --%>
 

    
            
        </div>
      
     
      </div>

            </div>

        </div>
<div id="push"></div>
        </div>
<div id="footer">
                <div class="container">
      
     <p class="text-center">Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p> </div></div>

    </body>
</html>
