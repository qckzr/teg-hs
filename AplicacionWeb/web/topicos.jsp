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
    </head>
    <body>
        <h1>Topicos Disponibles:</h1>
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='INTRODUCCION A LOS SISTEMAS DISTRIBUIDOS'" 
	           var="result" />
            <p>Introducción a los Sistemas Distribuidos:</p>
            <ul>
        <c:forEach var="row" items="${result.rows}">
             
            <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
	</c:forEach>
            </ul>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='COMUNICACION EN SISTEMAS DISTRIBUIDOS'" 
	           var="result" />
            <p>Comunicación en Sistemas Distribuidos:</p>
            <ul><c:forEach var="row" items="${result.rows}">
            <c:url value="aplicaciones.jsp" var="storeLink">
    <c:param name="idTopico" value="${row.id}"></c:param>
  </c:url>
    <li><a href="${storeLink}">${row.nombre}</a></li>
                   <%-- <a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a> --%>
	</c:forEach></ul>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SINCRONIZACION EN AMBIENTES DISTRIBUIDOS'" 
	           var="result" />
            <p>Sincronización en Ambientes Distribuidos:</p>
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                </c:forEach></ul>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='REPLICACION'" 
	           var="result" />
            <p>Replicación:</p>
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
                </c:forEach></ul>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SISTEMAS DE ARCHIVOS DISTRIBUIDOS'" 
	           var="result" />
            <p>Sistemas de Archivos Distribuidos:</p>
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
	</c:forEach></ul>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS DE NOMBRE'" 
	           var="result" />
            <p>Servicios de Nombre:</p>
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
	</c:forEach></ul>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='OBJETOS DISTRIBUIDOS'" 
	           var="result" />
            <p>Objetos Distribuidos:</p>
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
	</c:forEach></ul>
        <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos where categoria='SERVICIOS WEB'" 
	           var="result" />
            <p>Servicios Web:</p>
            <ul><c:forEach var="row" items="${result.rows}">
            
                    <li><a href="aplicaciones.jsp?idTopico=${row.id}"> ${row.nombre} </a></li>
	</c:forEach></ul>

    </body>
</html>
