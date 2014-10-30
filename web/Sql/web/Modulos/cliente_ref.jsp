<%-- 
    Document   : cliente_ref
    Created on : 02/03/2012, 12:41:28 PM
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
        consulta="select*from cliente where estado='1'";
        ps=conex.prepareStatement(consulta);
        rs=ps.executeQuery();
        %>
        <div id="cli" align="left">
            <select name="idcliente" id="cliente" onchange="recogerDirRucPlacaofRol()">
                <option value=" ">Seleccione Cliente</option>
                <%while (rs.next()) {%>
                <option value="<%=rs.getString("idCliente")%>">
                    <%=rs.getString("razonSocial")%>                                            
                </option>
                <%}%>
            </select>
        </div>  
    </body>
</html>
