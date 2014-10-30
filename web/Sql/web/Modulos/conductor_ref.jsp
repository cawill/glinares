<%-- 
    Document   : conductor_ref
    Created on : 01/03/2012, 05:20:03 PM
    Author     : Josmarl
--%>
<%@include file="conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<select  id="chofer" name="idconductor" onchange="llamarAjaxGETlicencia()">
    <option value="">Seleccione Chofer</option>
    <%
    String valor=request.getParameter("valor");
    consulta="select*from conductor where idconductor";
    PreparedStatement psch=conex.prepareStatement(consulta);
    ResultSet rsch=psch.executeQuery();
    while(rsch.next()){
    %>
    <option value="<%=rsch.getString("idconductor")%>">
        <%=rsch.getString("nombreconductor")%>
        <%=rsch.getString("apellidopconductor")%>
        <%=rsch.getString("apellidomconductor")%>
    </option>
    <%}%>
</select>
    </body>
</html>
