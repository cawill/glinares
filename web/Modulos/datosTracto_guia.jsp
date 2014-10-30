<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
String valor=request.getParameter("valor");
consulta="select marca,configuracion,nroconstancia " +
        "from tracto where idtracto=?";
ps=conex.prepareStatement(consulta);
ps.setString(1, valor);
rs=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <%while(rs.next()){%>
        Marca Tracto<br>
        <input type="text" value="<%=rs.getString("marca")%>" size="22"><br><br>
        Nro de Constancia Tracto<br>
        <input type="text" value="<%=rs.getString("nroconstancia")%>" size="22"><br><br>
        Configuraci&oacute;n Tracto<br>
        <input type="text" value="<%=rs.getString("configuracion")%>" size="22"><br>
        <%} conex.close();%>
    
    
    
    </body>
</html>
