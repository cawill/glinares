<%-- 
    Document   : codigo_aduana_destino
    Created on : 29/02/2012, 11:20:30 AM
    Author     : Josmarl
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
        consulta="select CONCAT(ciudad,' - ',pais) AS ciudad_pais,"
                + " cod_pais from pais where idpais=?";
        ps=conex.prepareStatement(consulta);
        ps.setString(1, valor);
        rs=ps.executeQuery();
            while(rs.next()){
        %>
        <input hidden="ciudad_pais" type="text" name="veicua_aduanadestino" value="<%=rs.getString("ciudad_pais")%>"/>
        <input name="veicua_codigoadu" value="<%=rs.getString("cod_pais")%>" type="text" size="10" maxlength="10"/>
        <%}%>
    </body>
</html>
