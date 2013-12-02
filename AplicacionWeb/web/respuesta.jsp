<%-- 
    Document   : respuesta
    Created on : Jul 24, 2013, 5:42:57 PM
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
        <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    </head>
    <body>
        <form class="form-horizontal">
            <h1 class="page-header text-center pull-left">${mensaje}</h1>
            <div class="row-fluid pull-left">
                <input type="button" id="regresar" value="Regresar" class="btn"/>
            </div>
        </form>
    </body>
</html>
