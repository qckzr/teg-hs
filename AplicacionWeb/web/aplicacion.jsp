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
        <title>JSP Page</title>
    </head>
    <body>
         <label>Nombre: ${nombre}</label><br/>
             <label>Fecha Actualizacion: ${fecha_actualizacion}</label><br/>
             <label>Instrucciones:  ${instrucciones}</label><br/>
             
             <c:forEach var="row" items="${escenarios}">
           
                 <p>Escenario ${row[0]} - Descripcion: ${row[1]}</p> 
            </c:forEach>
    <select name="ejec" id="ejec">
             <c:forEach var="ejecutable" items="${ejecutables}">
                 <option value="${ejecutable[0]}">${ejecutable[1]} (${ejecutable[2]})</option>
             </c:forEach>
    </select>
    </body>
</html>
