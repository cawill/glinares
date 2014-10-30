<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp"%>


<%
String accion=request.getParameter("accion");

String idTracto=request.getParameter("idTracto");
String placa=request.getParameter("placa");
String marca=request.getParameter("marca");
String ejes=request.getParameter("ejes");
String modelo=request.getParameter("modelo");
String capacidad=request.getParameter("capacidad");
String anio=request.getParameter("anio");
String nroConstancia=request.getParameter("nroConstancia");
String configuracion=request.getParameter("configuracion");
String color=request.getParameter("color");
String chasis=request.getParameter("chasis");
String estado=request.getParameter("estado");
String idCliente=request.getParameter("idCliente");

if(accion.equals("guardar")&&(placa.length()>0)){
    consulta="insert into tracto(placa,marca,ejes,modelo,capacidad,anio," +
            "nroConstancia,configuracion,color,chasis,estado,idCliente) " +
            "values(?,?,?,?,?,?,?,?,?,?,?,?)";

    ps=conex.prepareStatement(consulta);

    ps.setString(1,placa);
    ps.setString(2,marca);
    ps.setString(3,ejes);
    ps.setString(4,modelo);
    ps.setString(5,capacidad);
    ps.setString(6,anio);
    ps.setString(7,nroConstancia);
    ps.setString(8,configuracion);
    ps.setString(9,color);
    ps.setString(10,chasis);
    ps.setString(11,estado);
    ps.setString(12,idCliente);

    if(ps.executeUpdate()==1){response.sendRedirect("tracto_list.jsp");}
    else{out.print("No es posible guardar tracto");}
    
}

else if(accion.equals("actualizar")&&(idTracto.length()>0))
    {
    consulta="update tracto set placa=?,marca=?,ejes=?,modelo=?,capacidad=?," +
            "anio=?,nroConstancia=?,configuracion=?,color=?,chasis=?,estado=?," +
            "idCliente=? where idTracto=?;";
    
     ps=conex.prepareStatement(consulta);

    ps.setString(1,placa);
    ps.setString(2,marca);
    ps.setString(3,ejes);
    ps.setString(4,modelo);
    ps.setString(5,capacidad);
    ps.setString(6,anio);
    ps.setString(7,nroConstancia);
    ps.setString(8,configuracion);
    ps.setString(9,color);
    ps.setString(10,chasis);
    ps.setString(11,estado);
    ps.setString(12,idCliente);
    ps.setString(13, idTracto);

    if(ps.executeUpdate()==1){response.sendRedirect("tracto_list.jsp");}
    else{out.print("No es posible actualizar tracto");}

}
if(accion.equals("eliminar")){
    consulta="delete from tracto where idTracto=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idTracto);

    if(ps.executeUpdate()==1){response.sendRedirect("tracto_list.jsp");}
    else{out.print("No es posible eliminar tracto");}

}
else{out.print("Accion invalida...");
}

conex.close();
%>