<%-- 
    Document   : cargarEjecutable
    Created on : Jul 28, 2013, 8:56:49 PM
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
        <script type="text/javascript">


    function parametrosAplicaciones(sel) {
    
        var myNode = document.getElementById("Parametros");
        while (myNode.firstChild)
            myNode.removeChild(myNode.firstChild);
            
        
             
        for (var i=1;i<=sel;i++){
            var element1 = document.createElement("input");
            element1.setAttribute("type", "text");
            var nombreParametro = "nombreParametro";
            var nombreP = nombreParametro.concat("",i.toString());
            element1.setAttribute("name",nombreP);
            element1.setAttribute("value",nombreP);
            var element = document.createElement("input");
            element.setAttribute("type", "text");
            var parametro = "parametro";
            var nombre = parametro.concat("",i.toString());
            element.setAttribute("name",nombre);
            element.setAttribute("value",nombre);
            var foo = document.getElementById("Parametros");
            foo.appendChild(element1);
            foo.appendChild(element);
            }
        var valor = document.getElementById("cantidadParametros");
        valor.value = i.toString();
    }


</script>
    </head>
    <body>
        <form method="POST" action="${pageContext.request.contextPath}/CrearEjecutableServlet" enctype="multipart/form-data">
            
            <label>Ejecutable: </label><input type="file" name="nombreEjecutable"/>
            <label>Tipo de Ejecutable: </label><select name="tipoEjecutable">
                <option value="CLIENTE">Cliente</option>
                <option value="SERVIDOR">Servidor</option>
            </select>
            <label>Aplicacion:</label><select name="aplicacion">
        
            
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM aplicaciones" 
	           var="result" />
        
        <c:forEach var="row" items="${result.rows}">
           
            <option value="${row.id}">${row.nombre}</option>
	</c:forEach>
        </select>
            <label>Parametros:</label><select onchange="parametrosAplicaciones(this.value);">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    </select> 
            <span id="Parametros"></span><br/>
            <input type="hidden" id="cantidadParametros" name="cantidadParametros"/>
            
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
