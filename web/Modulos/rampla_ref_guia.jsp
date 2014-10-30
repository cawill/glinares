<%@include file="conexion.jsp" %>
<%-- 
    Document   : rampla_ref_guia
    Created on : 22/03/2012, 10:41:37 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String valor = request.getParameter("valor");

            consulta = "select * from ramplas where idrampla;";
            PreparedStatement psr = conex.prepareStatement(consulta);
            ResultSet rsram = psr.executeQuery();
        %>

        <select id="rampla" name="txtIdRampla" onchange="llamarDatosRampla()">
            <option value="">Seleccione Rampla</option>
            <% while (rsram.next()) {%>
            <option value="<%=rsram.getString("idrampla")%>">
                <%=rsram.getString("placa")%>
            </option>
            <%}%>
            <option value="">
                Sin Rampla
            </option>
        </select>

    </body>
</html>
