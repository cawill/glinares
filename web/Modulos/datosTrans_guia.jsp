<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
    
<%
String valor=request.getParameter("valor");
        consulta = "select c.ruc,c.departamento,c.pais,d.direccion" +
                " from cliente c " +
                "inner join detalleCliente d " +
                "on c.idCliente=d.idCliente " +
                "where c.idcliente=?";
        ps=conex.prepareStatement(consulta);
        ps.setString(1, valor);
        rs=ps.executeQuery();
        while(rs.next()){
%>
<label>Direccion</label><br>
<input type="text" value="<%=rs.getString("direccion")%>" size="60"><br><br>
<label>Ciudad-Pais</label><br>
<input type="text" value="<%=rs.getString("departamento")%>-<%=rs.getString("pais")%>"><br><br>
<label>RUC</label><br>
<input type="text" value="<%=rs.getString("ruc")%>"><br>
<%}conex.close();%>

    
    
    </body>
</html>
