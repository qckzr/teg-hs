<%-- 
    Document   : newjsp
    Created on : Aug 1, 2013, 3:55:25 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@include file="conexionBD.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monitoreo y Control</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/enviarInstruccion.js"></script>
        <script src="scripts/mostrarEscenario.js"></script>
    </head>
    <body>
        <div id="informacionAplicacion">
         <label>Nombre: ${nombre}</label><br/>
             <label>Fecha Creacion: ${fecha_actualizacion}</label><br/>
             <label>Instrucciones:  ${instrucciones}</label><br/>
        </div>
             <div id="escenarios">
                 <p>Escenarios</p>
                 <c:set var="escenario" value="1"/>
                <c:forEach var="row" items="${escenarios}">
                    <ul>
                        <li><a href="#" class="linkEscenario" id="${escenario}">Escenario${escenario}</a></li>
                    </ul>
                    <form id="${escenario}">
                    <input type="hidden" class="nombreEscenario"  id="${escenario}" value="${row[0]}"/>
                    <input type="hidden" class="descripcionEscenario" id="${escenario}" value="${row[1]}"/>
                    <input type="hidden" class="imagenEscenario" id="${escenario}" value="${row[2]}"/>
                    </form>
                    <c:set var="escenario" value="${escenario + 1}" scope="page"/>
                </c:forEach>
            </div>
                <c:set var="ejec" value="1"/>
                <div id="nodos">
             <c:forEach var="ejecutable" items="${ejecutables}">
                 <div id="nombreNodo">
                     <p>Nodo${ejecutable[3]}</p>
                 </div>
                 <div id="ejecutable${ejec}">
                     <p> "Monitoreo"</p>
                 </div>
                 
                 <div id="botones${ejec}">
                     <input type="button" class="informacion" id="${ejecutable[0]}" value="Informacion"/>
                     <input type="button"  class="detener" id="${ejecutable[0]}" value="Detener"/>
                     <input type="button" class="iniciar" id="${ejecutable[0]}" value="Iniciar"/>
                     <label>Mensaje: <input type="text" id="mensaje${ejecutable[0]}"/></label>
                     <input type="button" class="enviar" id="${ejecutable[0]}" value="Enviar"/>
                 </div>
                 <c:set var="ejec" value="${ejec + 1}" scope="page"/>
             </c:forEach> 
                </div>
             <div id="footer"><a href="aplicaciones.jsp?idTopico=${idTopico}">Volver</a></div>

    </body>
</html>
