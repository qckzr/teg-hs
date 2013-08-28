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
        <link rel="stylesheet" type="text/css" href="styles/general.css">
        <link rel="stylesheet" type="text/css" href="styles/estilos-extras.css">
        
        <link rel="stylesheet" type="text/css" href="css/teg-theme/jquery-ui-1.10.3.custom.css">
       <script>
            $(function() {
                $( "a, input[type=button]" )
                .button()
               
                });
  </script>
    </head>
    <body id="body">
        <div id="titulo" class="col w10"><h1 class="content">Topicos Disponibles</h1></div>
        <div id="contenido" class="col w10">
            <table class="content"><tr><th>Topico</th><th>Aplicaciones</th></tr>
            <sql:query dataSource="${localSource}" sql="SELECT id,nombre FROM topicos where categoria='INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS'" var="result" />
            <tr><td><p>Introducción a los Sistemas Distribuidos:</p></td>
                <td>
                    <ul>
                        <c:forEach var="row" items="${result.rows}">
                            <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                        </c:forEach>
                    </ul>
                </td>
            </tr>
            <sql:query dataSource="${localSource}" sql="SELECT id,nombre FROM topicos where categoria='COMUNICACION EN SISTEMAS DISTRIBUIDOS'" var="result" />
            <tr><td><p>Comunicación en Sistemas Distribuidos:</p></td>
                <td><ul><c:forEach var="row" items="${result.rows}">
            <c:url value="aplicaciones.jsp" var="storeLink">
    <c:param name="idTopico" value="${row.id}"></c:param>
  </c:url>
    <li><a href="${storeLink}">${row.nombre}</a></li>
                        </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SINCRONIZACION EN AMBIENTES DISTRIBUIDOS'" 
	           var="result" />
        <tr><td><p>Sincronización en Ambientes Distribuidos:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='REPLICACION'" 
	           var="result" />
        <tr><td><p>Replicación:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SISTEMAS DE ARCHIVOS DISTRIBUIDOS'" 
	           var="result" />
        <tr><td><p>Sistemas de Archivos Distribuidos:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS DE NOMBRE'" 
	           var="result" />
        <tr><td><p>Servicios de Nombre:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='OBJETOS DISTRIBUIDOS'" 
	           var="result" />
        <tr><td><p>Objetos Distribuidos:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS WEB'" 
	           var="result" />
        <tr><td><p>Servicios Web:</p></td>
            <td><ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                    </c:forEach></ul></td></tr>
            </table>
        </div>
                    <div id="opciones">
                        <a href="index.jsp">Regresar</a>
                    </div>
        <div id="footer"><p>Realizado por: Héctor Félix Sam Colina. Universidad Cátolica Andrés Bello 2013.</p></div>

    </body>
</html>
