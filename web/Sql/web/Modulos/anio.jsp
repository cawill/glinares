<%@include file="conexion.jsp" %>
<%--
    Document   : telefono
    Created on : 10/01/2012, 12:37:12 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String valor = request.getParameter("valor");
            consulta = "SELECT anio,idtracto FROM tracto WHERE idtracto=?";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, valor);
            rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

            
        <%while (rs.next()) {%>
        <input type="text" value="<%=rs.getString("anio")%>" size="21" name="cator_anio">
        <%}conex.close();%>
    </body>
</html>

