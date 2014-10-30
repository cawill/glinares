<%-- 
    Document   : codigo_bulto
    Created on : 29/02/2012, 09:48:57 AM
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
        consulta="select codigo from tipo_carga where glosa=?";
        ps=conex.prepareStatement(consulta);
        ps.setString(1, valor);
        rs=ps.executeQuery();
        while(rs.next()){
        %>
        <input type="text"  name="trein_numero" value="<%=rs.getString("codigo")%>" size="5" />
        <%}%>
    </body>
</html>
