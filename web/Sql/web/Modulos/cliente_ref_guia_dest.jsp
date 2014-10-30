<%-- 
    Document   : cliente_ref_guia_dest
    Created on : 02/03/2012, 06:39:18 PM
    Author     : Pc 04
--%>
<%@include file="conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String valor = request.getParameter("valor");
    consulta = "select idCliente,razonSocial from cliente where estado='1'";
    PreparedStatement psclid = conex.prepareStatement(consulta);
    ResultSet rsclid = psclid.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="clg_d">
            <select name="txtrSocialDestinatario" >
                <option value="">Seleccione Razon Social</option>
                <%while (rsclid.next()) {%>
                <option value="<%=rsclid.getString("idCliente")%>">
                    <%=rsclid.getString("razonSocial")%>
                </option>
                <%}%>
            </select>
        </div>
    </body>
</html>
