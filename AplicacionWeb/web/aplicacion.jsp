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
        <script  type="text/javascript" src="scripts/jquery-ui-1.10.3.custom.js"></script>
        <script type="text/javascript" src="scripts/enviarInstruccion.js"></script>
        <script type="text/javascript" src="scripts/mostrarEscenario.js"></script>
        <script type="text/javascript" src="scripts/monitorearEjecutable.js"></script>
        <script type="text/javascript" src="scripts/volver.js"></script>
        <script type="text/javascript" src="scripts/prueba.js"></script>
        
        <link rel="stylesheet" type="text/css" href="styles/aplicacion.css">
        <link rel="stylesheet" type="text/css" href="styles/console.css" />
        <link rel="stylesheet" type="text/css" href="styles/general.css">
        <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css">
        <script>
            $(function() {
                $( "a, input[type=submit],input[type=button]" )
                .button()
               
                });
  </script>
    </head>
    <body>
        <div id="contenido">
        <div id="titulo"><h1>${nombre}</h1></div>
        <div id="informacionAplicacion">
            
             <p>Fecha Creacion: ${fecha_actualizacion}</p><br/>
             <p>Instrucciones:  ${instrucciones}</p><br/>
        </div>
             <div id="escenarios">
                 <p>Escenarios</p>
                 <c:set var="escenario" value="1"/>
                <c:forEach var="row" items="${escenarios}">
                    
                        <a href="#" class="linkEscenario" id="${escenario}">Escenario${escenario}</a>
                    
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
                <div class="nodo">
                 <div class="nombreNodo">
                     <p>Nodo${ejecutable[3]}</p>
                 </div>
                 <div id="ejecutable${ejec}">
                     <input type="hidden" id="${ejec}" value="${ejecutable[3]}"/>
                     <div class="informacion"></div>
                    <div  class="window">
                            <div class="toolbar">
                                    <div class="top">
                                            <div class="lights">
                                                    <div class="light red">
                                                            <div class="glyph">X</div>
                                                            <div class="shine"></div>
                                                            <div class="glow"></div>
                                                    </div>				
                                                    <div class="light yellow">
                                                            <div class="glyph">-</div>
                                                            <div class="shine"></div>
                                                            <div class="glow"></div>
                                                    </div>
                                                    <div class="light green">
                                                            <div class="glyph">+</div>
                                                            <div class="shine"></div>
                                                            <div class="glow"></div>
                                                    </div>
                                            </div>
                                            <div class="title">
                                                    <div class="folder">
                                                            <div class="tab"></div>
                                                            <div class="body"></div>
                                                    </div>
                                                    RaspberryPi
                                            </div>
                                            <div class="bubble">
                                                    <div class="shine"></div>
                                                    <div class="glow"></div>
                                            </div>
                                    </div>
                            </div>
                            <div class="monitoreo"></div>	
                        </div>
                    
                 </div>
                 
                     <div id="botones${ejec}" class="botones">
                            <sql:query dataSource="${localSource}" var="result" sql="select e.nombre, e.pathscript from eventos e where e.id in (select e.id_evento from e_e e where e.id_ejecutable=${ejecutable[0]})"/>
                            <input type="button" class="informacion button" id="${ejecutable[0]}" value="Informacion"/>
                            <c:forEach var="row" items="${result.rows}">
                                <c:set var="evento1" value="INICIAR"/> 
                                <c:set var="evento2" value="DETENER"/>
                                <c:set var="evento3" value="ENVIAR"/> 
                                    <c:choose>
                                        <c:when test="${row.nombre == evento1}">
                                            <input type="button" class="iniciar button" id="${ejecutable[0]}" value="Iniciar"/>
                                        </c:when>
                                        <c:when test="${row.nombre == evento2}">
                                            <input type="button"  class="detener button" id="${ejecutable[0]}" value="Detener"/>
                                        </c:when>
                                        <c:when test="${row.nombre == evento3}">
                                                <label>Mensaje: <input type="text" id="mensaje${ejecutable[0]}"/></label>
                                                <input type="button" class="enviar button" id="${ejecutable[0]}" value="Enviar"/>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="buton" class="${row.nombre}" id="${ejecutable[0]}" value="${row.nombre}"/>
                                            <script type="text/javascript" src="${row.pathscript}"></script>
                                        </c:otherwise>
                                    </c:choose>
                     
                            </c:forEach>
                    </div>
                 <c:set var="ejec" value="${ejec + 1}" scope="page"/>
                 
                     
            </div>
             </c:forEach>
                
                
                </div>
                 <div id="opciones">
                 <input type="button" id="volver" class="button" value="Volver"/>
                     <input type="hidden" id="idTopico" value="${idTopico}"/>
                 </div>
        </div>
                 <div id="footer">
                     
            <p>Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p>
                 </div>

    </body>
</html>
