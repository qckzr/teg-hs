<%-- 
    Document   : modificarTopico2
    Created on : Jul 26, 2013, 2:25:33 PM
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
        <form method="POST" action="${pageContext.request.contextPath}/ModificarTopicoServlet2">
            <label>Nombre: <input type="text" value="${nombre}" name="nombre"/></label><br/>
            <label>Categoria: <select name="categoriaFinal">
                         <c:set var="categoriaTopico" value="${categoria}"/>
                         <c:forEach var="categorias" items="${categorias}">
                             <c:choose>
                                 <c:when test="${categorias == categoriaTopico}">
                                     <option value="${categorias}" selected="selected">${categorias}</option>
                                 </c:when>
                                  <c:otherwise>
                                      <option value="${categorias}">${categorias}</option>
                                  </c:otherwise>
                             </c:choose>
                         </c:forEach>
                </select></label><br/>
            <label>Descripcion:<textarea  name="descripcion">${descripcion}</textarea></label><br/>
            <label>Imagen: FALTA IMPLEMENTAR</label><br/>
            <select name="usuarios">
                 <c:set var="idUsuario" value="${idUsuario}"/>
                <c:forEach var="usuarios" items="${usuarios}">
                    
                    <c:choose>
                    <c:when test="${usuarios[0] == idUsuario}"> 
                        <option value="${usuarios[0]}" selected="selected">${usuarios[1]} ${usuarios[2]}</option>
                    </c:when>
                    <c:otherwise>
                            <option value="${usuarios[0]}" >${usuarios[1]} ${usuarios[2]}</option>
                            </c:otherwise>
                     </c:choose>
                </c:forEach>
            </select><br/>
            <input type="hidden" value="${id}" name="id"/>
            <input type="submit" value="Enviar"/>            
        </form>
    </body>
</html>
