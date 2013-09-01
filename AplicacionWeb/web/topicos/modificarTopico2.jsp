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
        <script type="text/javascript" src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="scripts/formularios.js"></script>
    </head>
    <body>
        <form class="formularios form-horizontal" method="POST" action="${pageContext.request.contextPath}/ModificarTopicoServlet2" enctype="multipart/form-data">
             <h1 class="text-center pull-left page-header">Modificar Topico</h1>           
             <div class="row-fluid pull-left">
                
            <div class="control-group">
                <label class="control-label" for="nombre">Nombre:</label>
                <div class="controls">
                    <input type="text" value="${nombre}" name="nombre"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="Categoria">Categoria:</label>
                    <div class="controls">
                        <select name="categoriaFinal" class="span6">
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
                    </select>
                    </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="descripcion">Descripcion:</label>
                <div class="controls">
                    <textarea  name="descripcion" cols="60" rows="5">${descripcion}</textarea>
                </div>
            </div>
                <div class="control-group">
                    <label class="control-label" for="imagen">Imagen: ${imagen}</label>
                    <div class="controls">
                        <input type="file" name="imagen"/>
                    </div>
                </div>
                    <div class="control-group">
                        <label class="control-label" for="usuarios">Usuario:</label>
                        <div class="controls">
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
                            </select>
                        </div>
                    </div>
            <div class="controls">
                    <input type="hidden" value="${id}" name="id"/>
                    <input type="submit" value="Enviar" class="btn"/>            
           
            </div>
            </div>
        </form>
            <div id="results"></div>
    </body>
</html>
