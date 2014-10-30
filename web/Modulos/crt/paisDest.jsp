<%@include file="../conexion.jsp" %>
<%-- 
    Document   : paisRem
    Created on : 13/01/2012, 10:05:57 AM
    Author     : MAGWI
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
            String valor = request.getParameter("valor");
            consulta = "SELECT CONCAT(c.departamento,' / ', c.pais) pais , c.idcliente FROM detallecliente dc "
                    + "INNER JOIN cliente c ON dc.idcliente=c.idcliente "
                    + "WHERE c.idcliente=?";
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
        <select id="paisDest" >
                        <%while (rs.next()) {%>
            <option value="<%=rs.getString("idcliente")%>"> <%=rs.getString("pais")%>
            </option>
            <%}%>
        </select>
    </body>
</html>
