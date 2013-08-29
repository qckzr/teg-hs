<%-- 
    Document   : gestion
    Created on : Jul 24, 2013, 3:46:49 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion Topicos</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script type="text/javascript" src="scripts/enviarPagina.js"></script>
        <script type="text/javascript" src="scripts/iniciarSesion.js"></script>
        <script  type="text/javascript" src="scripts/jquery-ui-1.10.3.custom.js"></script>
        <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css">
       <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
        <link rel="stylesheet" type="text/css" href="styles/general.css">
        <link rel="stylesheet" type="text/css" href="styles/dropdown.css">
    <script>
            $(function() {
                $("a,li input[type=button]" )
                .button();
               
                });
  </script>
   
    </head>
    <body>
        <div id="contenido">
            <div id="main">
        <div id="infoUsuario">
            <p>${sessionScope.nombre} ${sessionScope.apellido}</p>
            
        </div><a href="#" id="logout">Salir</a>
        
        <!-- LO NUEVO -->
        <div id="menus">
            <ul class="dropdown">
            <li>Usuarios
                <ul class="sub_menu">
                    <li><a id="crearUsuario" href="#">Crear</a></li>
                    <li><a id="modificarUsuario" href="#" >Modificar</a></li>
                    <li><a id="eliminarUsuario" href="#">Eliminar</a></li>
                    <li><a id="consultarUsuario" href="#">Consultar</a></li>
                </ul>
            </li>

            <li>Topicos
                <ul class="sub_menu">
                    <li><a id="crearTopico"href="#">Crear</a></li>
                    <li><a id="modificarTopico"href="#">Modificar</a></li>
                    <li><a id="eliminarTopico"href="#">Eliminar</a></li>
                    <li><a id="consultarTopico"href="#">Consultar</a></li>
                </ul>
            </li>

            <li>Preguntas
                <ul class="sub_menu">
                    <li><a id="crearPregunta"href="#">Crear</a></li>
                    <li><a id="modificarPregunta"href="#">Modificar</a></li>
                    <li><a id="eliminarPregunta"href="#">Eliminar</a></li>
                    <li><a id="consultarPregunta"href="#">Consultar</a></li>
                </ul>
            </li> 
            <li>Aplicaciones
                <ul class="sub_menu">
                    <li><a id="crearAplicacion" href="#">Crear</a></li>
                    <li><a id="modificarAplicacion" href="#">Modificar</a></li>
                    <li><a id="eliminarAplicacion" href="#">Eliminar</a></li>
                    <li><a id="consultarAplicacion" href="#">Consultar</a></li>
                </ul>
            </li>
            <li>Ejecutables
                <ul class="sub_menu">
                    <li><a id="crearEjecutable" href="#">Crear</a></li>
                    <li><a id="modificarEjecutable"href="#">Modificar</a></li>
                    <li><a id="eliminarEjecutable"href="#">Eliminar</a></li>
                    <li><a id="consultarEjecutable"href="#">Consultar</a></li>
                </ul>
            </li>
        
        
            <li>Nodos
                <ul class="sub_menu">
                    <li><a id="crearNodo" href="#">Crear</a></li>
                    <li><a id="modificarNodo"href="#">Modificar</a></li>
                    <li><a id="eliminarNodo"href="#">Eliminar</a></li>
                    <li><a id="consultarNodo"href="#">Consultar</a></li>
                </ul>
            </li>
</ul>
        </div>
        <div id="operaciones" class="col w10">
            <div id="resultado">
            </div>
        </div>
        <div id="opciones" class="col w2">
                        <a  href="index.jsp" class="content">Regresar</a>
                    </div> 
            </div>
            
        </div>
            <div id="footer"><p>Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p></div>
    </body>
</html>
