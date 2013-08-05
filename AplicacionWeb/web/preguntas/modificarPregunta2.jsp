<%-- 
    Document   : modificarPregunta2
    Created on : Aug 5, 2013, 12:39:28 AM
    Author     : sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@include file="../conexionBD.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function validarUnicaRespuesta(check){
                for (var i=1;i<=4;i++){
                    var a = "";
                    var checkBox = document.getElementById(a.concat("checkbox",i));
                    if ((checkBox.checked==true) && (checkBox!=check)){
                        checkBox.checked = false;
                        checkBox.value = "NULL";
                        check.value ="'SI'";
                        return;
                        }
                        
                }
                check.value="'SI'";
                return;
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/ModificarPreguntaServlet2">
            <label>Enunciado: <input type="text" name="enunciado" value="${enunciado}"</label><br/>
            <label>Topico: <select name="topicos">
                     <sql:query dataSource="${localSource}" 
                    sql="SELECT id, nombre, categoria FROM topicos" 
	           var="result" />
        
                    <c:forEach var="row" items="${result.rows}">
                         <c:choose>
                                 <c:when test="${row.id == topico}">
                                      <option value="${row.id}" selected="selected">${row.categoria}: ${row.nombre} </option>
                                 </c:when>
                                  <c:otherwise>
                                      <option value="${row.id}">${row.categoria}: ${row.nombre} </option>
                                  </c:otherwise>
                             </c:choose>
                    
                    </c:forEach>
                         
                </select></label><br/>
             <c:set var="respuesta" value="SI"/>
             <c:set var="contadorPregunta" value="1"/>
             <c:forEach var="row" items="${preguntas}">
                <c:choose>
                    <c:when test="${row[1] == respuesta}">
                        <p>Respuesta ${contadorPregunta}: <input type="text" name="respuesta${contadorPregunta}" value="${row[0]}"/> Respuesta Correcta: <input type="checkbox" name="checkbox${contadorPregunta}" id="checkbox${contadorPregunta}" value="'SI'" checked="checked" onclick="validarUnicaRespuesta(checkbox${contadorPregunta})"/></p> 
                    </c:when>
                    <c:otherwise>
                        <p>Respuesta ${contadorPregunta}: <input type="text" name="respuesta${contadorPregunta}" value="${row[0]}"/> Respuesta Correcta: <input type="checkbox" name="checkbox${contadorPregunta}" id="checkbox${contadorPregunta}" value="NULL" onclick="validarUnicaRespuesta(checkbox${contadorPregunta})"/></p> 
                    </c:otherwise>
                </c:choose>
                        <input type="hidden" name="idRespuesta${contadorPregunta}" value="${row[2]}"/>
                      <c:set var="contadorPregunta" value="${contadorPregunta + 1}" scope="page"/>
            </c:forEach>
                    <input type="submit" value="Enviar"/>
                    <input type="hidden" name="id" value="${id}"/>
               
             </form>
    </body>
</html>
