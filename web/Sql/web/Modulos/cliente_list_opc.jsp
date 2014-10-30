<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="refresh" content="1; URL=cliente_list.jsp">
        <title>JSP Page</title>
    </head>
    <body bgcolor="white">
        <img alt=" " src="../imagenes/icons/spinner.gif"
             style="
             margin-bottom:250px;
             margin-left:600px;
             margin-right:300px;
             margin-top:250px"
             height="45" width="45">
    
    <%
    String orden=request.getParameter("accion");
    String idCliente=request.getParameter("idCliente");

    if(orden.equals("activar")){
    consulta="update cliente set estado='1' where idCliente=?";
    ps=conex.prepareStatement(consulta);
    ps.setString(1,idCliente);
    ps.executeUpdate();
    } else  if(orden.equals("desactivar")){
    consulta="update cliente set estado='0' where idCliente=?";
    ps=conex.prepareStatement(consulta);
    ps.setString(1,idCliente);
    ps.executeUpdate();
    }
    %>
    
    
    
    </body>
</html>
