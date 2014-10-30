<%@include file="../conexion.jsp"%>
<%-- 
    Document   : direccionRem
    Created on : 13/01/2012, 09:03:32 AM
    Author     : MAGWI
--%>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
            String valor = request.getParameter("valor");
            consulta = "SELECT * FROM detallecliente WHERE idcliente=?";
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
        <select id="direccionDest" onchange="llamarAjaxGETpaisDest()">
            <option>Seleccione direccion</option>
                        <%while (rs.next()) {%>
            <option value="<%=rs.getString("iddetallecliente")%>"> <%=rs.getString("direccion")%>
            </option>
            <%}%>
        </select>
    </body>
</html>
