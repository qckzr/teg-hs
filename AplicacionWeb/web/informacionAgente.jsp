<%-- 
    Document   : informacionAgente
    Created on : Aug 22, 2013, 7:21:04 PM
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>function closeWin() { window.close(); }</script>"
    </head>
    <body>
        <p>Aplicacion Activa: ${aplicacionActiva}
        <p>Direccion ip: ${direccionIp}</p>
        <p>Id Proceso: ${idProceso}</p>
    <p> Memoria Disponible: ${memoriaDisponible}</p>
<p>Numero de Nodo: ${numeroNodo}</p>
<p>Procesos Activos: ${procesosActivos}</p>
<p>Puertos Disponibles: ${puertosDisponibles}</p>
<p>Uso de Cpu: ${usoCpu}</p>
<input type="button" value="Cerrar" onclick="closeWin()"/>
    </body>
</html>
