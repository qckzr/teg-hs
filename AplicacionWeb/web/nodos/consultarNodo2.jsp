<%-- 
    Document   : consultarNodo2
    Created on : Jul 31, 2013, 11:55:18 AM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="scripts/jquery-1.10.2.min.js"></script>
        <script src="scripts/respuesta.js"></script>
    </head>
    <body>
        <form class="form-horizontal">
            <h1 class="text-center pull-left page-header">Consultar Nodo</h1>
            <div class="row-fluid pull-left">
                <div class="control-group">
                    <div class="span4">
                        <dl class="dl-horizontal"> 
                            <dt>IP:</dt> <dd><p class="text-justify">${ip}</p></dd>
                            <dt>Nombre Usuario:</dt> <dd><p class="text-justify">${nombre}</p></dd>
                            <dt>Contrasena:</dt> <dd><p class="text-justify">${contrasena}</p></dd>
                        </dl>
                    </div>
                </div>
                <div class="controls">
                    <input type="button" id="regresar" class="btn" value="Regresar"/>
                </div>
            </div>

        </form>
    </body>
</html>
