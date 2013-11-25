<%-- 
    Document   : aplicaciones
    Created on : Aug 1, 2013, 1:50:33 PM
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
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/footer.css">
        <!--<script  type="text/javascript" src="scripts/jquery-ui-1.10.3.custom.js"></script>
        <link rel="stylesheet" type="text/css" href="styles/general.css">
        <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
        <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css"> -->
        <script>
            function aplicacionSeleccionada(check){
              
                
                var aplicacion = document.getElementById("aplicacion");
                for (var i=1;i<document.getElementById("count").value;i++){
                    var a = "";
                    var checkBox = document.getElementById(a.concat("aplicacion",i));
                    if ((checkBox.checked==true) && (checkBox!=check)){
                        checkBox.checked = false;
                        aplicacion.value = check.value;
                        return;
                        }
                        
                }
                aplicacion.value = check.value;
                return;
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <div id="contenido">
            <div class="container-fluid">
            <div id="main">
        <form method="POST" action="${pageContext.request.contextPath}/Aplicacion">
            <sql:query dataSource="${localSource}" var="result"
                sql="SELECT a.id,a.nombre \"nombre\", t.categoria, t.nombre \"topico\" FROM aplicaciones a,topicos t where a.id_topico=t.id and t.id=${param.idTopico}"
            />
            <div class="row-fluid">
          <!--  <div id="titulo" class="span12"><h1 class="text-center">${result.rows[0].categoria}</h1></div> -->
            <c:set var="count" value="1"/>
            </div>
           <!-- <div id="aplicaciones" class="span12"> -->
           <div class="row-fluid">
        <!--   <div class="span3">
                            <ul class="breadcrumb">
                                <li><a href="index.jsp">Index</a> <span class="divider">/</span></li>
                                <li><a href="topicos.jsp">Tópicos</a> <span class="divider">/</span></li>
                                <li class="active">Aplicaciones</li>
                            </ul>
                    </div> -->
           </div>
               <div class="row-fluid">
                   <table class="table table-bordered"><caption><h3 class="text-center">Aplicaciones Disponibles para: ${result.rows[0].topico} </h3></caption><tr><td class="span1" >Aplicación:</td><td ><ul class="inline">
                 	 <c:forEach var="row" items="${result.rows}">
            
                           <li> <p><input type="checkbox" name="aplicacion${count}" id="aplicacion${count}" value="${row.id}" onclick="aplicacionSeleccionada(aplicacion${count})"/>  ${row.nombre} </p></li>
                	<c:set var="count" value="${count + 1}" scope="page"/>
                
			</c:forEach></ul></td></tr>
                    </table>
                         
           </div>
                        <div class="row-fluid">
                            <input type="submit" class="btn offset5" value="Enviar"/>
                        </div>
		<!--</div> -->
                <input type="hidden" id="count" value="${count}"/>
                <input type="hidden" name="idTopico" value="${param.idTopico}"/>
                <input type="hidden" name="aplicacion" id="aplicacion" value="" />
            
          <!--      <div id="opciones" class="span12">
                    <ul class="pager">
			<li class="previous">
				<a href="topicos.jsp" class="volver">&larr; Regresar</a>
			</li>
			</ul>
                </div> -->
            
                
        
                
        </form>
            </div>
<!--<div id="push"></div> -->
            </div>
        </div><!--<div id="footer">
                <div class="container">
                    <p class="text-center">Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p> 
                </div>
            </div> -->
          <!--      <script type="text/javascript" src="scripts/application.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-affix.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-alert.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-button.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-carousel.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-collapse.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-dropdown.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-modal.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-popover.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-scrollspy.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-tab.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-tooltip.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-transition.js"></script>
                <script type="text/javascript" src="scripts/bootstrap-typeahead.js"></script> -->
    </body>
</html>
