<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp" %>
<%@include file="../session_verifica.jsp" %>

<%

String accion = request.getParameter("accion");

String idFactura = request.getParameter("idFactura");
String cantidad = request.getParameter("cantidad");
String descripcion = request.getParameter("descripcion");
String importe = request.getParameter("importe");
String idDetalleFactura = request.getParameter("idDetalleFactura");

if(accion.equals("guardar")&&(idFactura.length()>0))
    {
    consulta="insert into detallefactura(idFactura, cantidad, descripcion,importe) values(?,?,?,?);";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idFactura);
    ps.setString(2, cantidad);
    ps.setString(3, descripcion);
    ps.setString(4, importe);
    
    if(ps.executeUpdate()==1){response.sendRedirect("factura_detalle_form.jsp");}
   else{out.print("No es posible guardar conductor");}
}
else if(accion.equals("actualizar"))
{
    consulta="update detallefactura set cantidad=?,descripcion=?,importe=? "
            + "where idDetalleFactura=?;";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, cantidad);
    ps.setString(2, descripcion);
    ps.setString(3, importe);
    ps.setString(4, idDetalleFactura);
    ps.executeUpdate();
  
    if(ps.executeUpdate()==1){response.sendRedirect("detalle_factura.jsp");}
    else{out.print("No es posible actualizar");}
}

else if(accion.equals("eliminar")){
    consulta="delete from detallefactura where idDetalleFactura=?;";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, idDetalleFactura);
        if(ps.executeUpdate()==1){response.sendRedirect("detalle_factura.jsp");}
    else{out.print("No es posible eliminar");}

}else{
    out.print("Accion invalida...");
}

conex.close();
%>