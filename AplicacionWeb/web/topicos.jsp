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
        <title>JSP Page</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script  type="text/javascript" src="scripts/jquery-ui-1.10.3.custom.js"></script>
        <!--<link rel="stylesheet" type="text/css" href="styles/general.css">
        <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
        
        <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css"> -->
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="css/footer.css">
       
    </head>
    <body> 
        <div id="contenido">
            <div class="container-fluid">
                <div id="main" class="row-fluid">
                <div id="titulo" class="span12"><h1 class="text-center">Topicos Disponibles</h1></div>
       <div class="row-fluid">
                    <div class="span2">
                            <ul class="breadcrumb">
                                <li><a href="index.jsp">Index</a> <span class="divider">/</span></li>
                             <li class="active">Tópicos</li>
                            </ul>
                    </div>
           <div class="row-fluid">
                <table class="table table-bordered table-hover span5 offset2"><tr><th><p class="text-center">Topico</p></th><th><p class="text-center">Aplicaciones</p></th></tr>
            <sql:query dataSource="${localSource}" sql="SELECT id,nombre FROM topicos where categoria='INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS'" var="result" />
            <tr><td><p class="text-center">Introducción a los Sistemas Distribuidos:</p></td>
                <td>
                    <ul>
                        <c:forEach var="row" items="${result.rows}">
                            <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                        </c:forEach>
                    </ul>
                </td>
            </tr>
            <sql:query dataSource="${localSource}" sql="SELECT id,nombre FROM topicos where categoria='COMUNICACION EN SISTEMAS DISTRIBUIDOS'" var="result" />
            <tr><td><p class="text-center">Comunicación en Sistemas Distribuidos:</p></td>
                <td><ul><c:forEach var="row" items="${result.rows}">
            <c:url value="aplicaciones.jsp" var="storeLink">
    <c:param name="idTopico" value="${row.id}"></c:param>
  </c:url>
    <li><a href="${storeLink}">${row.nombre}</a></li>
                        </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SINCRONIZACION EN AMBIENTES DISTRIBUIDOS'" 
	           var="result" />
        <tr><td><p class="text-center">Sincronización en Ambientes Distribuidos:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='REPLICACION'" 
	           var="result" />
        <tr><td><p class="text-center">Replicación:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SISTEMAS DE ARCHIVOS DISTRIBUIDOS'" 
	           var="result" />
        <tr><td><p class="text-center">Sistemas de Archivos Distribuidos:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS DE NOMBRE'" 
	           var="result" />
        <tr><td><p class="text-center">Servicios de Nombre:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='OBJETOS DISTRIBUIDOS'" 
	           var="result" />
        <tr><td><p class="text-center">Objetos Distribuidos:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS WEB'" 
	           var="result" />
        <tr><td><p class="text-center">Servicios Web:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
            </table>
           </div>
                    <div id="opciones">
                        <a  href="index.jsp" class="content">Regresar</a>
                    </div> 
            </div>
        </div>
            </div>
                    <div id="footer">
                <div class="container">
                    <p class="text-center">Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p> 
                </div>
            </div>

                     <script type="text/javascript" src="scripts/application.js"></script>
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
      <script type="text/javascript" src="scripts/bootstrap-typeahead.js"></script>
    </body>
</html>
