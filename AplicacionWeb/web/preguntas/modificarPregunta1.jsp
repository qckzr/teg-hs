<%-- 
    Document   : modificarPregunta1
    Created on : Aug 5, 2013, 12:39:18 AM
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
        <title>JSP Page</title>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarPreguntaServlet1">
              <h1 class="text-center pull-left page-header">Modificar Pregunta</h1>           
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label" for="preguntas">Pregunta:</label>
                <div class="controls">
                    <select name="preguntas" class="span10">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT p.id, p.enunciado, t.nombre FROM preguntas p,topicos t where p.id_topico=t.id" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.nombre}: ${row.enunciado} </option>
	</c:forEach>
        </select>
                </div>
            </div>
        <div class="controls">
            <input type="submit" value="Enviar" class="btn"/>
        </div>
             </div>
        </form>
        <div id="results"></div>
    </body>
</html>
