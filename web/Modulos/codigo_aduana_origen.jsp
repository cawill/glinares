<%-- 
    Document   : codigo_aduana_origen
    Created on : 29/02/2012, 02:18:06 PM
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
        consulta="SELECT DISTINCT pais,cod_pais "
                + "FROM pais "
                + "where idpais and cod_pais=?;";
        ps=conex.prepareStatement(consulta);
        ps.setString(1, valor);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <input name="veinsei_codmerca" value="<%=rs.getString("cod_pais")%>" type="text" size="10" maxlength="10" />
        <input name="veinsei_origenmerca" value="<%=rs.getString("pais")%>" type="text" hidden="hidden"/>
        <%}%>
    </body>
</html>
