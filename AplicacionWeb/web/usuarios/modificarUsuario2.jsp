<%-- 
    Document   : modificarUsuario2.jsp
    Created on : Jul 25, 2013, 10:19:29 PM
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
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/ModificarUsuarioServlet2">
            <label>Nombre: <input type="text" value="${nombre}" name="nombre"/></label><br/>
            <label>Apellido: <input type="text" value="${apellido}" name="apellido"/></label><br/>
            <label>Correo:<input type="text" value="${correo}" name="correo"/></label><br/>
            <label>Contrasena: <input type="text" value="${contrasena}" name="contrasena"/></label><br/>
            <input type="hidden" value="${id}" name="id"/>
            <input type="submit" value="Enviar"/> 
                
            
        </form>
    </body>
</html>
