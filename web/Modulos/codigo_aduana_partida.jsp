<%-- 
    Document   : codigo_aduana_partida
    Created on : 29/02/2012, 03:03:42 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String valor=request.getParameter("valor");
        consulta="select CONCAT(cod_depar,cod_pais) AS codigos , "
                + " CONCAT(ciudad,' - ',pais) AS ciudad_pais from pais "
                + "where idpais=?";
        ps=conex.prepareStatement(consulta);
        ps.setString(1, valor);
        rs=ps.executeQuery();
        
        while(rs.next()){
        %>
        <input type="text" value="<%=rs.getString("codigos")%>" name="siet_codigo" />
        <input name="siet_aduanaciudad" value="<%=rs.getString("ciudad_pais")%>" type="text" hidden="hidden"/>
        <%}%>
    </body>
</html>
