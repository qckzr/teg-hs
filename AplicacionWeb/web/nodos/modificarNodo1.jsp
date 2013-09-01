<%-- 
    Document   : modificarNodo1
    Created on : Jul 31, 2013, 12:02:29 PM
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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarNodoServlet1">
            <h1 class="text-center pull-left page-header">Modificar Nodo</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label">Nodos: </label>
                <div class="controls">
                    <select name="nodos">
                        <sql:query dataSource="${localSource}" 
                            sql="SELECT id, ip FROM nodos" 
                            var="result" />

                    <c:forEach var="row" items="${result.rows}">

                        <option value="${row.id}">${row.ip}</option>
                    </c:forEach>
                    </select></div>
            </div>
                    <div class="controls">
                        <input type="submit" value="Enviar" class="btn"/>
                    </div>
             </div>
        </form>
        <div id="results"></div>
    </body>
</html>
