<%@include file="conexion.jsp" %>
<%--
    Document   : telefono
    Created on : 10/01/2012, 12:37:12 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            String valor = request.getParameter("valor");
            consulta = "SELECT t.idtracto,t.placa,t.idCliente,c.ruc " +
                    "FROM tracto t " +
                    "inner join cliente c " +
                    "on t.idCliente=c.idCliente " +
                    "WHERE c.idCliente=?";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, valor);
            rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <select id="placa" name="idtracto" onchange="recogerMarNumCapAnOfPlaca()">
            <option>Seleccione Placa</option>
            <%while (rs.next()) {%>
            <option value="<%=rs.getString("idtracto")%>">
                <%=rs.getString("placa")%>
            </option>
            <%}conex.close();%>
        </select>
    </body>
</html>

