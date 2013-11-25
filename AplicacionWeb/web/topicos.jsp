<%-- 
    Document   : topicos.jsp
    Created on : Jul 24, 2013, 3:46:57 PM
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
        <title>Topicos Sistemas Distribuidos</title>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script  type="text/javascript" src="scripts/jquery-ui-1.10.3.custom.js"></script>
        <!--<link rel="stylesheet" type="text/css" href="styles/general.css">
        <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
        
        <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css"> -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        <script>
            $(document).ready(function(){
                $("#topicos a").click(function(){
                    $("#apps").load("aplicaciones.jsp?idTopico="+this.id);   
                });
                
                $(".nav a").click(function(){
                    var myNode = document.getElementById("apps");
                    while (myNode.firstChild)
                        myNode.removeChild(myNode.firstChild);
                }); 
            });
        </script>
    </head>
    <body> 
        <div id="contenido">
            <div class="container-fluid">
                <div id="main" class="row-fluid">
                <div id="titulo" class="span12 page-header" align="center">
                    <img src="images/banner_.jpg"/>
                    <h2 class="text-center"> Topicos Disponibles</h2>
                </div>
       <div class="row-fluid">
           <div class="span12">
                    <div class="span2">
                            <ul class="breadcrumb">
                                <li><a href="index.jsp">Index</a> <span class="divider">/</span></li>
                             <li class="active">Tópicos</li>
                            </ul>
                    </div>
           </div>
           <div class="row-fluid span12 pull-left" >
            
               
               <div class="tabbable tabs-left">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab1" data-toggle="tab" >Introducción a los Sistemas Distribuidos</a></li>
    <li><a href="#tab2" data-toggle="tab">Comunicación en Sistemas Distribuidos</a></li>
    <li><a href="#tab3" data-toggle="tab">Sincronización en Ambientes Distribuidos</a></li>
    <li><a href="#tab4" data-toggle="tab">Replicación:</a></li>
    <li><a href="#tab5" data-toggle="tab">Sistemas de Archivos Distribuidos</a></li>
    <li><a href="#tab6" data-toggle="tab">Servicios de Nombre</a></li>
    <li><a href="#tab7" data-toggle="tab">Objetos Distribuidos</a></li>
    <li><a href="#tab8" data-toggle="tab">Servicios Web</a></li>
    </ul>
                   <div class="tab-content span6" style="height:500px;"  id="topicos">
            <div class="tab-pane active" id="tab1">
                    <sql:query dataSource="${localSource}" sql="SELECT id,nombre FROM topicos where categoria='INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS'" var="result" />
                    <ul>
                        <c:forEach var="row" items="${result.rows}">
                            <li><a  href="#" id="${row.id}"> ${row.nombre} </a></li>
                        </c:forEach>
                    </ul>
            </div>
            <div class="tab-pane" id="tab2">
                    <sql:query dataSource="${localSource}" sql="SELECT id,nombre FROM topicos where categoria='COMUNICACION EN SISTEMAS DISTRIBUIDOS'" var="result" />
                <ul><c:forEach var="row" items="${result.rows}">
                    <li><a  href="#" id="${row.id}">${row.nombre}</a></li>
                            </c:forEach></ul>
            </div>
            <div class="tab-pane" id="tab3">
                <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SINCRONIZACION EN AMBIENTES DISTRIBUIDOS'" 
	           var="result" />
                    <ul><c:forEach var="row" items="${result.rows}">
                        <li> <a  href="#" id="${row.id}">${row.nombre}</a></li>
                        </c:forEach></ul>
                              
            </div>
            <div class="tab-pane" id="tab4">
                <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='REPLICACION'" 
	           var="result" />
                    <ul><c:forEach var="row" items="${result.rows}">
                    <li><a href="#" id="${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul>
            </div>
            <div class="tab-pane" id="tab5">
                <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SISTEMAS DE ARCHIVOS DISTRIBUIDOS'" 
	           var="result" />
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="#" id="${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul>
            </div>
            <div class="tab-pane" id="tab6">
                <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS DE NOMBRE'" 
	           var="result" />
        
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="#" id="${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul>
                   
            </div>
            <div class="tab-pane" id="tab7">
                <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='OBJETOS DISTRIBUIDOS'" 
	           var="result" />
                <ul><c:forEach var="row" items="${result.rows}">
                    <li><a href="#" id="${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul>
            </div>
            <div class="tab-pane" id="tab8">
                 <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS WEB'" 
	           var="result" />
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="#" id="${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul>
                    
            </div>
                    <div id="apps"  ></div>              
        </div>
              
    </div>
                    
                   
               </div>
       
                    
           </div>
                    <div id="opciones">
                       <ul class="pager">
			<li class="previous">
				<a href="index.jsp" class="volver">&larr; Regresar</a>
			</li>
			</ul>
 
                    </div> 
            </div>
        </div>
<div id="push"></div>
            </div>
                    <div id="footer">
                <div class="container">
                    <p class="text-center">Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p> 
                </div>
            </div>

            <!--         <script type="text/javascript" src="scripts/application.js"></script> -->
      <script type="text/javascript" src="scripts/bootstrap-affix.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-alert.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-button.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-carousel.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-collapse.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-dropdown.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-modal.js"></script>
      <!-- <script type="text/javascript" src="scripts/bootstrap-popover.js"></script> -->
      <script type="text/javascript" src="scripts/bootstrap-scrollspy.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-tab.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-tooltip.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-transition.js"></script>
      <script type="text/javascript" src="scripts/bootstrap-typeahead.js"></script>
    </body>
</html>
