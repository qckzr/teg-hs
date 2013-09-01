<%-- 
    Document   : crearPregunta
    Created on : Jul 28, 2013, 3:40:22 PM
    Author     : hector
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
        <script src="scripts/validarUnicaRespuesta.js"></script>
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/CrearPreguntaServlet">
             <h1 class="text-center pull-left page-header">Crear Pregunta</h1>           
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label" for="enunciado">Enunciado:</label>
                <div class="controls">
                    <textarea name="enunciado" cols="50" rows="3" class="span6"></textarea>
                </div>
            </div>
                 <div class="control-group">
                     <label class="control-label" for="topicos">Tópicos:</label>
                     <div class="controls">
                         <select name="topicos" class="span6">
                            <sql:query dataSource="${localSource}" 
                            sql="SELECT id, nombre, categoria FROM topicos" 
                            var="result" />

                    <c:forEach var="row" items="${result.rows}">

                        <option value="${row.id}">${row.categoria}: ${row.nombre} </option>
                    </c:forEach>
                        </select>
                     </div>
                 </div>
                <div class="control-group">
                    <label class="control-label" for="opcion1">Opcion: </label>
                    <div class="controls">
                        <input type="text" name="opcion1"/>
                    </div>
                    <label class="control-label" for="checkbox1">¿Respuesta correcta?</label>
                    <div class="controls">
                        <input type="checkbox" name="checkbox1" id="checkbox1" onclick="validarUnicaRespuesta(checkbox1)"/>
                    </div>
                </div>
         <div class="control-group">
                    <label class="control-label" for="opcion2">Opcion: </label>
                    <div class="controls">
                        <input type="text" name="opcion2"/>
                    </div>
                     <label class="control-label" for="checkbox2">¿Respuesta correcta?</label>
                     <div class="controls">
                         <input type="checkbox" name="checkbox2" id="checkbox2" onclick="validarUnicaRespuesta(checkbox2)"/>
                     </div>
         </div>
        <div class="control-group">
                    <label class="control-label" for="opcion3">Opcion: </label>
                    <div class="controls">
                        <input type="text" name="opcion3"/>
                    </div>
                     <label class="control-label" for="checkbox3">¿Respuesta correcta?</label>
                     <div class="controls">
                         <input type="checkbox" name="checkbox3" id="checkbox3" onclick="validarUnicaRespuesta(checkbox3)"/>
                     </div>
        </div>
        <div class="control-group">
                    <label class="control-label" for="opcion4">Opcion: </label>
                    <div class="controls">
                        <input type="text" name="opcion4"/>
                    </div>
                         <label class="control-label" for="checkbox4">¿Respuesta correcta?</label>
                         <div class="controls">
                             <input type="checkbox" name="checkbox4" id="checkbox4" onclick="validarUnicaRespuesta(checkbox4)"/>
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
