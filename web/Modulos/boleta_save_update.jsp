<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
    String idboleta=request.getParameter("ProximoIdAInsertar");
    String orden=request.getParameter("accion");

    if(orden.equals("update")){
    consulta="update detalleboleta set importe='' " +
        "where idboleta=? and importe='0.00';";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, idboleta);
    ps.executeUpdate();
    response.sendRedirect("detalleBoleta_list.jsp");
    }
    %>
    
    
    
    
    </body>
</html>
