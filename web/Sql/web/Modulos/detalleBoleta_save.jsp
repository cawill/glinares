<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
    </head>
    <body>
    <%
    String orden=request.getParameter("accion");

    String idDetalleBoleta=request.getParameter("idDetalleBoleta");
    String idboleta=request.getParameter("idboleta");

    String cantidad=request.getParameter("txtCantidad")==null ? "" : request.getParameter("txtCantidad");
    String descripcion =request.getParameter("txtDescripcion");
    String importe =request.getParameter("txtImporte")==null ? "" : request.getParameter("txtImporte");

    if(orden.equals("edit")){
    consulta="update detalleBoleta set cantidad=?,descripcion=?," +
            "importe=? where idDetalleBoleta=?";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, cantidad);
    ps.setString(2, descripcion);
    ps.setString(3, importe);
    ps.setString(4, idDetalleBoleta);

    if(ps.executeUpdate()==1){
    %>
    <div align="center">
        <h1>Se realizó la actualizacion con éxito!</h1>
        <a href="boleta_edit_fm.jsp?idboleta=<%=idboleta%>"><button type="button">Regresar</button></a>
    </div>
    <%
    }
    }

    conex.close();
    %>

    </body>
</html>
