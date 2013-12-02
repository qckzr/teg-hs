<%-- 
    Document   : crearNodo
    Created on : Jul 31, 2013, 11:29:32 AM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/CrearNodoServlet">
            <h1 class="text-center pull-left page-header">Crear Nodo</h1>
            <div class="row-fluid pull-left">
                <div class="control-group">
                    <label class="control-label">Ip:</label>
                    <div class="controls">
                        <input type="text" name="ip"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Usuario:</label>
                    <div class="controls">
                        <input type="text" name="usuario"/>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label">Contrasena:</label>
                    <div class="controls">
                        <input type="password" name="contrasena"/>
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
