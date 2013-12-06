<%-- 
    Document   : newjsp
    Created on : Aug 1, 2013, 3:55:25 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@include file="conexionBD.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aplicacion Sistemas Distribuidos</title>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script  type="text/javascript" src="scripts/jquery-ui-1.10.3.custom.js"></script>
        <script type="text/javascript" src="scripts/enviarInstruccion.js"></script>
        <script type="text/javascript" src="scripts/mostrarEscenario.js"></script>
        <script type="text/javascript" src="scripts/monitorearEjecutable.js"></script>
        <script type="text/javascript" src="scripts/volver.js"></script>
        <script type="text/javascript" src="scripts/prueba.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <link rel="stylesheet" type="text/css" href="css/console.css">
        <link rel="stylesheet" type="text/css" href="css/general.css">

        <script>
            $(document).ready(function() {
                $("#preguntas").click(function() {
                    var idTopico = $("#idTopico").val();
                    $.post('GenerarPreguntaServlet', {idTopico: idTopico}, function(responseText) {
                        $("#archivoPreguntas").html(responseText);
                        return;
                    });
                });
                $("#preguntasPdf").click(function() {
                    $("#archivoPreguntas").empty();
                    alert("asd");
                });

                function  botton1() {
                    $('.iniciar.1').click();
                    $('.iniciar.1').attr("disabled", true);
                }
                ;
                function  botton2() {
                    $('.iniciar.2').click();
                    $('.iniciar.2').attr("disabled", true);
                }
                ;
                function  botton3() {
                    $('.iniciar.3').click();
                    $('.iniciar.3').attr("disabled", true);
                }
                ;
                function  botton4() {
                    $('.iniciar.4').click();
                    $('.iniciar.4').attr("disabled", true);
                }
                ;
                window.setTimeout(botton1, 1000);
                window.setTimeout(botton2, 4000);
                window.setTimeout(botton3, 7000);
                window.setTimeout(botton4, 10000);
            });

        </script>
    </head>


    <body>
        <div id="wrap">
            <div id="contenido" class="container-fluid">
                <div id="main">
                    <div class="row-fluid">
                        <div id="headers" class="page-header">
                            <img  class="text-center" src="images/banner_final.jpg"/>  
                            <h2 class="text-center">${nombre}</h2>
                        </div>
                        <div class="span12">
                            <ul class="pager">
                                <li class="previous">
                                    <a href="#" class="volver">&larr; Regresar</a>
                                </li>
                            </ul>
                        </div>
                        <div id="informacionAplicacion" class="span9">
                            <div class="accordion" id="accordion2">
                                <div class="accordion-group">
                                    <div class="accordion-heading">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
                                            Descripción Tópico
                                        </a>
                                    </div>
                                    <div id="collapseOne" class="accordion-body collapse">
                                        <div class="accordion-inner">
                                            ${descripcionTopico}

                                            <center><img src="${imagenTopico}"/> </center>

                                        </div>
                                    </div>
                                </div>
                                <div class="accordion-group">
                                    <div class="accordion-heading">
                                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
                                            Instrucciones
                                        </a>
                                    </div>
                                    <div id="collapseTwo" class="accordion-body collapse in">
                                        <div class="accordion-inner">
                                            <p class="text-justify">Fecha Creación: ${fecha_actualizacion}</p><br/>
                                            ${instrucciones}
                                            <c:set var="ejec" value="1"/>
                                            <c:if test="${(idTopico == 24)  || (idTopico == 26)}">
                                                <c:set var="ejec" value="2"/>
                                            </c:if>
                                            <div class="row-fluid">  
                                                <div id="nodos" class="span12">
                                                    <c:forEach var="ejecutable" items="${ejecutables}">
                                                        <c:if test="${(ejec== 1)  || (ejec == 3)}">
                                                            <div class="row-fluid">
                                                            </c:if>
                                                            <div class="span5 pull-left" style="min-width: 500px">

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
                                                                                    Nodo${ejecutable[3]}-${ejecutable[2]}
                                                                                </div>
                                                                                <div class="bubble">
                                                                                    <div class="shine"></div>
                                                                                    <div class="glow"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="monitoreo" id="${ejecutable[0]}"></div>	
                                                                    </div>
                                                                </div>

                                                                <div class="row-fluid">
                                                                    <div id="botones${ejec}" class="span12 offset2 form-inline">
                                                                        <sql:query dataSource="${localSource}" var="result" 
                                                                                   sql="select e.nombre, e.pathscript from eventos e where e.id in (select e.id_evento from ejecutable_evento e where e.id_ejecutable=${ejecutable[0]})"/>
                                                                        <input type="button" class="informacion button btn" id="${ejecutable[3]}" value="Informacion"/>
                                                                        <c:forEach var="row" items="${result.rows}">
                                                                            <c:set var="evento1" value="INICIAR"/> 
                                                                            <c:set var="evento2" value="DETENER"/>
                                                                            <c:set var="evento3" value="MENSAJE"/> 
                                                                            <c:choose>
                                                                                <c:when test="${row.nombre == evento1}">
                                                                                    <input type="button" class="iniciar ${ejec} button btn" id="${ejecutable[0]}" value="Iniciar"/>
                                                                                </c:when>
                                                                                <c:when test="${row.nombre == evento2}">
                                                                                    <input type="button"  class="detener button btn" id="${ejecutable[0]}" value="Detener"/><br/>
                                                                                </c:when>
                                                                                <c:when test="${row.nombre == evento3}">
                                                                                    <br/><input type="text" placeholder="Mensaje" class="mensaje input-small span7" id="mensaje${ejecutable[0]}"/>
                                                                                    <input type="button" class="enviar btn" id="${ejecutable[0]}" value="Enviar"/>
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="button" class="${row.nombre}" id="${ejecutable[0]}" value="${row.nombre}"/>
                                                                                    <script type="text/javascript" src="${row.pathscript}"></script>
                                                                                </c:otherwise>
                                                                            </c:choose>

                                                                        </c:forEach>
                                                                    </div>
                                                                </div> 
                                                             


                                                            </div>
                                                            <c:if test="${(ejec== 2  || ejec == 4) && (fn:length(ejecutables) >= 2)}">
                                                              
                                                            </div>
                                                            </c:if>
                                                            <c:if test="${(ejec== 3)  && (fn:length(ejecutables) == 3 )}">
                                                                </div>
                                                            </c:if>
                                                                           <c:set var="ejec" value="${ejec + 1}" scope="page"/>
                                                    </c:forEach>
                                                </div>   

                                            </div>
                                        </div>
                                    </div>
                                </div>            
                            </div>
                        </div>
                    

                    <div id="escenarios" class="span2 pull-left">
                        <fieldset> 
                            <legend>Escenarios</legend>
                            <c:set var="escenario" value="1"/><ul>
                                <c:forEach var="row" items="${escenarios}">
                                    <li><a href="#a" class="linkEscenario text-center " id="${escenario}">${row[0]}</a></li>
                                    <form id="${escenario}">
                                        <input type="hidden" class="nombreEscenario"  id="${escenario}" value="${row[0]}"/>
                                        <input type="hidden" class="descripcionEscenario" id="${escenario}" value="${row[1]}"/>
                                        <input type="hidden" class="imagenEscenario" id="${escenario}" value="${row[2]}"/>
                                    </form>
                                    <c:set var="escenario" value="${escenario + 1}" scope="page"/>
                                </c:forEach></ul>
                        </fieldset>
                        <br/><br/><fieldset>
                            <legend>Preguntas</legend>
                            <input type="button" id="preguntas" class="btn text-center" value="Generar Preguntas"/>
                            <br/><br/><div id="archivoPreguntas"></div>
                        </fieldset><br/><br/>
                        <fieldset>
                            <legend>Otras opciones</legend>
                            <input type="button"  id="eliminarTodo" class="btn" value="Eliminar Todos"/>
                        </fieldset>
                    </div>
                                </div>
                </div>

                <div class="container-fluid">
                    <div class="span12">
                        <ul class="pager">
                            <li class="previous">
                            </li>
                        </ul>
                        <input type="hidden" id="idTopico" value="${idTopico}"/>
                    </div>
                </div>
            </div>

            <div id="push"></div>
        </div>

        <div id="footer" > 
            <div class="container"> 
                <p class="text-center">Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p>
            </div>
        </div>

        <script type="text/javascript" src="scripts/bootstrap-affix.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-alert.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-button.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-carousel.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-collapse.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-dropdown.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-modal.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-scrollspy.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-tab.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-tooltip.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-transition.js"></script>
        <script type="text/javascript" src="scripts/bootstrap-typeahead.js"></script>
    </body>
</html>
