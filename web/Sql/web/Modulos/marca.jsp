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
            consulta = "SELECT t.idTracto,t.placa,t.idCliente,t.marca " +
                    "FROM tracto t " +
                    "inner join cliente c " +
                    "on t.idCliente=c.idCliente " +
                    "WHERE t.idtracto=?";
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

           
            <%while (rs.next()) {%>

            <input type="text" value="<%=rs.getString("marca")%>" size="21" name="doce_marca">

            <%}conex.close();%>

    </body>
</html>

