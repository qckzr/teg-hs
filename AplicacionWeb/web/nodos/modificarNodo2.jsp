<%-- 
    Document   : modificarNodo2
    Created on : Jul 31, 2013, 12:02:36 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarNodoServlet2">
            <h1 class="text-center pull-left page-header">Modificar Nodo</h1>
             <div class="row-fluid pull-left">
            <div class="control-group">
                <label class="control-label">IP:</label> 
                <div class="controls">
                    <input type="text" name="ip" value="${ip}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Nombre Usuario: </label>
                <div class="controls">
                    <input type="text" name="usuario" value="${nombre}"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">Contrasena: </label> 
                <div class="controls">
                    <input type="password" name="contrasena" value="${contrasena}"/>
                </div>
            </div>
                <div class="controls">
             <input type="hidden" name="id" value="${id}"/>
             <input type="submit" value="Enviar" class="btn"/>
                </div>
             </div>
        </form>
             <div id="results"></div>
    </body>
</html>
