<%-- 
    Document   : consultarPregunta2
    Created on : Jul 30, 2013, 1:34:14 AM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
          <label>Enunciado: ${enunciado}</label><br/>
             <label>Topico: ${topico}</label><br/>
             <c:set var="respuesta" value="SI"/>
             <c:forEach var="row" items="${preguntas}">
                <c:choose>
                    
                                 <c:when test="${row[1] == respuesta}">
                                     <p>Nombre: ${row[0]} - Respuesta Correcta</p> 
                                 </c:when>
                                  <c:otherwise>
                                      <p>Nombre: ${row[0]}</p> 
                                  </c:otherwise>
                             </c:choose>
              
            </c:forEach>
             <a href="preguntas/preguntas.jsp">Regresar</a>  
    </body>
</html>
