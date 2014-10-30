<%-- 
    Document   : codigo_camion_subs
    Created on : 29/02/2012, 05:55:53 PM
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
        consulta="select codigocli from cliente where razonSocial=?";
        ps=conex.prepareStatement(consulta);
        ps.setString(1, valor);
        rs=ps.executeQuery();
        
        while(rs.next()){
        %>
        <input type="text" name="diesei_codigo" size="4" value="<%=rs.getString("codigocli")%>"/>
        <%}%>
    </body>
</html>
