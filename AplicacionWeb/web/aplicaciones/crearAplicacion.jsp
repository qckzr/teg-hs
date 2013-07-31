<%-- 
    Document   : crearAplicacion
    Created on : Jul 30, 2013, 9:30:10 PM
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

   function escenariosAplicaciones(sel) {
    
        var myNode = document.getElementById("Escenarios");
        while (myNode.firstChild)
            myNode.removeChild(myNode.firstChild);
            
        
             
        for (var i=1;i<=sel;i++){
            var text = document.createElement("input");
            text.type = "text";
            var nombre = "nombre";           
            text.name = nombre.concat("",i.toString());
            var textArea = document.createElement("textarea");
            var descripcion = "descripcion";
            textArea.name = descripcion.concat("",i.toString());
            var foo = document.getElementById("Escenarios");
            var labelNombre = document.createElement("Label");
            labelNombre.innerHTML = "Nombre:";
            var labelDescripcion = document.createElement("Label");
            var imagen = document.createElement("input");
            imagen.type = "file";
            var nombreImagen = "imagen"
            imagen.name =  nombreImagen.concat("",i.toString());
            labelDescripcion.innerHTML = "Descripcion:";
            var labelImagen = document.createElement("Label");
            labelImagen.innerHTML = "Imagen (Opcional):"
            foo.appendChild(labelNombre);
            foo.appendChild(text);
            foo.appendChild(labelDescripcion);
            foo.appendChild(textArea);
            foo.appendChild(labelImagen);
            foo.appendChild(imagen);
            }
        var valor = document.getElementById("cantidadEscenarios");
        valor.value = i.toString();
    }


</script>
    </head>
    <body>
        
        <form method="POST" action="${pageContext.request.contextPath}/CrearAplicacionServlet">
            
            <label>Nombre: </label><input type="text" name="nombre"/>
            <label>Instrucciones: </label><textarea name="instrucciones"></textarea>
            <label>Topico:</label><select name="topicos">
            <sql:query dataSource="${localSource}" 
	           sql="SELECT id,nombre FROM topicos" 
	           var="result" />
            <c:forEach var="row" items="${result.rows}">
                <option value="${row.id}">${row.nombre}</option>
            </c:forEach>
            </select>
             <label>Escenarios:</label><select onchange="escenariosAplicaciones(this.value);">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    </select> 
            <span id="Escenarios"></span><br/>
            <input type="hidden" id="cantidadEscenarios" name="cantidadEscenarios"/>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
