<%-- 
    Document   : cliente_ref_guia
    Created on : 02/03/2012, 06:04:50 PM
    Author     : Pc 04
--%>
<%@include file="conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String valor = request.getParameter("valor");

    consulta = "select idCliente,razonSocial from cliente where estado='1'";
    PreparedStatement pscli = conex.prepareStatement(consulta);
    ResultSet rscli = pscli.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div id="clg"> 
            <select name="txtIdCliente" >
                <option selected value="">Seleccione Razon Social</option>
                <%while (rscli.next()) {%>
                <option value="<%=rscli.getString("idCliente")%>">
                    <%=rscli.getString("razonSocial")%>
                </option>
                <%}%>
            </select>               
        </div>
    </body>
</html>
