<%-- 
    Document   : cliente_ref_factura
    Created on : 02/03/2012, 05:05:59 PM
    Author     : Pc 04
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
        <%
        String valor=request.getParameter("valor");                                      
            consulta = "select*from cliente where estado='1'";
            ps = conex.prepareStatement(consulta);
            rs = ps.executeQuery();
        %>
        <div id="cli">
            <select id="cliente" name="txtIdCliente"  onchange="recogerDirAndRuc()">
                <option value="">---------------Seleccione Cliente---------------</option>
                <%while (rs.next()) {%>
                <option value="<%=rs.getString("idCliente")%>">
                    <%=rs.getString("razonSocial")%>
                </option>
                <%}%>
            </select>
        </div>

    </body>
</html>
