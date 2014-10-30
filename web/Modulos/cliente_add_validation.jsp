<%-- 
    Document   : cliente_add_validation
    Created on : 01-ago-2012, 12:18:49
    Author     : magwi
--%>
<%@include file="../Modulos/conexion.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String nombre=request.getParameter("nombre")== null ? "":request.getParameter("nombre");
    String stylo="display:normal";
%>
<%
consulta = "SELECT (CASE WHEN ruc='"+nombre+"' THEN 'YA EXISTEN LOS DATOS' "
        + " ELSE 'REGISTRO DISPONIBLE' END) AS ruc FROM cliente "
        + " WHERE ruc = '"+nombre+"'";
        ps = conex.prepareStatement(consulta);
        rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (rs.next()) {%>
        <%=rs.getString("ruc")%>
        <%}%>
    </body>
</html>
