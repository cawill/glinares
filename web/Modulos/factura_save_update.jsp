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
String idFactura=request.getParameter("ProximoIdAInsertar");
String orden=request.getParameter("accion");
out.print(idFactura);
if(orden.equals("update")){
consulta="update detallefactura set importe='' " +
        "where idfactura=? and importe='0.00';";
ps=conex.prepareStatement(consulta);
ps.setString(1, idFactura);
ps.executeUpdate();
response.sendRedirect("detalleFactura_list.jsp");

}

conex.close();
%>
    
    
    
    
    </body>
</html>
