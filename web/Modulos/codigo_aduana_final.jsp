<%-- 
    Document   : codigo_aduana_final
    Created on : 29/02/2012, 05:23:30 PM
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
        consulta="select cod_pais, CONCAT(ciudad,' - ',pais) AS ciudad_pais "
                + "from pais "
                + "where idpais=?";
        ps=conex.prepareStatement(consulta);
        ps.setString(1, valor);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <input type="text" name="ocho_codigo" value="<%=rs.getString("cod_pais")%>"/>
        <input type="text" name="ocho_destino" value="<%=rs.getString("ciudad_pais")%>" hidden="hidden"/>
        <%}%>
    </body>
</html>
