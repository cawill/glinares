<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        
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
 <meta http-equiv="refresh" content="1;URL=detalleGuia_list.jsp" />
    
 <%
String orden=request.getParameter("accion");
String idGuia=request.getParameter("idGuia");

if(orden.equals("activar")){

consulta="update guia_remision set estado='CORRECTO' where idGuia=?";
ps=conex.prepareStatement(consulta);
ps.setString(1, idGuia);
ps.executeUpdate();
}else if(orden.equals("anular")){

consulta="update guia_remision set estado='ANULADO' where idGuia=?";
ps=conex.prepareStatement(consulta);
ps.setString(1, idGuia);
ps.executeUpdate();
}
%>
    
    </body>
</html>
