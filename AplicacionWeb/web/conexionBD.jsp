<%-- 
    Document   : conexionBD
    Created on : Jul 25, 2013, 1:10:30 AM
    Author     : hector
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" 
           uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource driver="oracle.jdbc.driver.OracleDriver"
     				   url="jdbc:oracle:thin:@192.168.1.200:1521:XE"
     				   var="localSource" 
     				   user="hector"  
     				   password="passw0rd"/>