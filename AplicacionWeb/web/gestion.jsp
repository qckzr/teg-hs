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
        <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
   
    </head>
    <body>
        <div id="infoUsuario">
        <p>${sessionScope.nombre} ${sessionScope.apellido}</p>
        <a href="#" id="logout">Salir</a>
        </div>
        <div id="usuarios" class="col w2">
            <h1>Usuarios</h1>
            <ul>
                <li><a id="crearUsuario" href="#">Crear</a></li>
                <li><a id="modificarUsuario" href="#" >Modificar</a></li>
                <li><a id="eliminarUsuario" href="#">Eliminar</a></li>
                <li><a id="consultarUsuario" href="#">Consultar</a></li>
                     
            </ul>
        </div>
        <div id="topicos" class="col w2">
            <h1>Topicos</h1>
            <ul>
                <li><a id="crearTopico"href="#">Crear</a></li>
                <li><a id="modificarTopico"href="#">Modificar</a></li>
                <li><a id="eliminarTopico"href="#">Eliminar</a></li>
                <li><a id="consultarTopico"href="#">Consultar</a></li>
            </ul>
        </div>
        <div id="preguntas" class="col w2">
            <h1>Preguntas</h1>
            <ul>
                <li><a id="crearPregunta"href="#">Crear</a></li>
                <li><a id="modificarPregunta"href="#">Modificar</a></li>
                <li><a id="eliminarPregunta"href="#">Eliminar</a></li>
                <li><a id="consultarPregunta"href="#">Consultar</a></li>
                
            </ul>
        </div>
        <div id="aplicaciones" class="col w2">
            <h1>Aplicaciones</h1>
            <ul>
                <li><a id="crearAplicacion" href="#">Crear</a></li>
                <li><a id="modificarAplicacion" href="#">Modificar</a></li>
                <li><a id="eliminarAplicacion" href="#">Eliminar</a></li>
                <li><a id="consultarAplicacion" href="#">Consultar</a></li>
            </ul>
        </div>
        <div id="ejecutables" class="col w2">
            <h1>Ejecutables</h1>
            <ul>
                <li><a id="crearEjecutable" href="#">Crear</a></li>
                <li><a id="modificarEjecutable"href="#">Modificar</a></li>
                <li><a id="eliminarEjecutable"href="#">Eliminar</a></li>
                <li><a id="consultarEjecutable"href="#">Consultar</a></li>
            </ul>
        </div>
        <div id="nodos" class="col w1">
            <h1>Nodos</h1>
            <ul>
                <li><a id="crearNodo" href="#">Crear</a></li>
                <li><a id="modificarNodo"href="#">Modificar</a></li>
                <li><a id="eliminarNodo"href="#">Eliminar</a></li>
                <li><a id="consultarNodo"href="#">Consultar</a></li>
            </ul>
        </div>
        <div id="operaciones" class="col w10">
            <div id="resultado">
            </div>
        </div>
    </body>
</html>
