<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
String valor=request.getParameter("valor");
           consulta = "select c.ruc from cliente c where c.idCliente=?;";
           ps = conex.prepareStatement(consulta);
           ps.setString(1, valor);
           rs = ps.executeQuery();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        
           <%while(rs.next()){%>
           <div class="style37">
           Ruc:
           &nbsp;&nbsp;&nbsp;<input value="<%=rs.getString("ruc")%>" type="text"/>
            <%}conex.close();%>
        
</div>


    </body>
</html>
