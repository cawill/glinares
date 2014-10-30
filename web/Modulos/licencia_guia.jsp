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
    consulta="select licenciaconductor from conductor where idconductor=?";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, valor);
    rs=ps.executeQuery();
    while(rs.next()){
    %>
    <br>
    <label>Licencia</label><br>
    <input type="text" value="<%=rs.getString("licenciaconductor")%>" size="22"/>
    <%}conex.close();%>
    
    
    
    </body>
</html>
