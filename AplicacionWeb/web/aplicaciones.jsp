<%-- 
    Document   : aplicaciones
    Created on : Aug 1, 2013, 1:50:33 PM
    Author     : hector
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
 <%@include file="conexionBD.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
            function aplicacionSeleccionada(check){
              
                
                var aplicacion = document.getElementById("aplicacion");
                for (var i=1;i<document.getElementById("count").value;i++){
                    var a = "";
                    var checkBox = document.getElementById(a.concat("aplicacion",i));
                    if ((checkBox.checked==true) && (checkBox!=check)){
                        checkBox.checked = false;
                        aplicacion.value = check.value;
                        return;
                        }
                        
                }
                aplicacion.value = check.value;
                return;
            }
        </script>
        <title>JSP Page</title>
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/Aplicacion">
            <sql:query dataSource="${localSource}" var="result"
                sql="SELECT a.id,a.nombre \"nombre\", t.categoria, t.nombre \"topico\" FROM aplicaciones a,topicos t where a.id_topico=t.id and t.id=${param.idTopico}"
            />
            <h1>${result.rows[0].categoria}</h1>
            <c:set var="count" value="1"/>
            <h2>Aplicaciones Disponibles para: ${result.rows[0].topico} </h2>
             <ul>
                 <c:forEach var="row" items="${result.rows}">
            
                <li> <p><input type="checkbox" name="aplicacion${count}" id="aplicacion${count}" value="${row.id}" onclick="aplicacionSeleccionada(aplicacion${count})"/>  ${row.nombre} </p></li>
                <c:set var="count" value="${count + 1}" scope="page"/>
                
        </c:forEach></ul>
                <input type="hidden" id="count" value="${count}"/>
                <input type="hidden" name="idTopico" value="${param.idTopico}"/>
                <input type="hidden" name="aplicacion" id="aplicacion" value="" />
        <input type="submit" value="Enviar"/><br/>
        <a href="topicos.jsp">Regresar</a>
        </form>
    </body>
</html>
