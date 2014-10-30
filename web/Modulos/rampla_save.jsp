<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>


<%
String accion=request.getParameter("accion");

String idRampla=request.getParameter("idRampla");
String tipo=request.getParameter("tipo");
String ejes=request.getParameter("ejes");
String placa=request.getParameter("placa");
String nroConstancia=request.getParameter("nroConstancia");
String configuracion=request.getParameter("configuracion");
String clase=request.getParameter("clase");
String descripcion=request.getParameter("descripcion");
String estado=request.getParameter("estado");
String idCliente=request.getParameter("idCliente");

if(accion.equals("guardar")&&(tipo.length()>0))
{
    consulta="insert into ramplas(tipo,ejes,placa,nroConstancia," +
            "configuracion," +
            "clase,descripcion,estado,idCliente)" +
            " values(?,?,?,?,?,?,?,?,?)";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, tipo);
    ps.setString(2, ejes);
    ps.setString(3, placa);
    ps.setString(4, nroConstancia);
    ps.setString(5, configuracion);
    ps.setString(6, clase);
    ps.setString(7, descripcion);
    ps.setString(8, estado);
    ps.setString(9, idCliente);
    
    if(ps.executeUpdate()==1){response.sendRedirect("rampla_list.jsp");}
    else{out.print("No se puede guardar rampla");}
    
}
else if(accion.equals("actualizar")&&(tipo.length()>0))
{
    consulta="update ramplas set tipo=?,ejes=?,placa=?,nroConstancia=?," +
            "configuracion=?,clase=?,descripcion=?,estado=?,idCliente=? " +
            "where idRampla=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, tipo);
    ps.setString(2, ejes);
    ps.setString(3, placa);
    ps.setString(4, nroConstancia);
    ps.setString(5, configuracion);
    ps.setString(6, clase);
    ps.setString(7, descripcion);
    ps.setString(8, estado);
    ps.setString(9, idCliente);
    ps.setString(10, idRampla);

    if(ps.executeUpdate()==1){response.sendRedirect("rampla_list.jsp");}
    else{out.print("No se puede actualizar rampla");}
}
else if(accion.equals("eliminar"))
    {
    consulta="delete from ramplas where idRampla=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idRampla);

    if(ps.executeUpdate()==1){response.sendRedirect("rampla_list.jsp");}
    else{out.print("No se puede eliminar rampla");}
}
else{
    out.print("Accion invalida...");
}

conex.close();
%>
