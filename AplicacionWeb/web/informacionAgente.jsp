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
        <script>function closeWin() {
                window.close();
            }</script>"
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>

        <div id="headers" >
            <img src="images/banner_peq.jpg"/>  
            <h4 class="text-center page-header">Informacion del Agente</h4>   
        </div>


        <dl class="dl-horizontal"> 
            <dt>Aplicacion Activa:</dt> <dd>${aplicacionActiva}</dd>
            <dt>Direccion ip:</dt> <dd>${direccionIp}</dd>
            <dt>Id Proceso:</dt> <dd>${idProceso}</dd>
            <dt> Memoria Disponible:</dt> <dd>${memoriaDisponible}</dd>
            <dt>Numero de Nodo:</dt> <dd>${numeroNodo}</dd>
            <dt>Procesos Activos:</dt> <dd>${procesosActivos}</dd>
            <dt>Puertos Disponibles:</dt> <dd>${puertosDisponibles}</dd>
            <dt>Uso de Cpu:</dt> <dd>${usoCpu}</dd>
        </dl>
        <div class="text-center">
            <input type="button" value="Cerrar"  class="btn text-center"onclick="closeWin()"/>
        </div>
    </body>
</html>
