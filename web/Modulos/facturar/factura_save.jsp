<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp" %>

<%

String accion = request.getParameter("accion");

String idFactura = request.getParameter("idFactura");
String idCliente = request.getParameter("idCliente");
String serieFactura = request.getParameter("serieFactura");
String numFactura = request.getParameter("numFactura");
String fechaFactura = request.getParameter("fechaFactura");
String login=request.getParameter("login");
String guias=request.getParameter("guias");
String moneda=request.getParameter("moneda");
String impuesto=request.getParameter("impuesto");
String descFactura=request.getParameter("descFactura");
String descripcionigv=request.getParameter("descripcionigv");
String subtotal=request.getParameter("subtotal");
String igv=request.getParameter("igv");
String total=request.getParameter("total");
String son=request.getParameter("son");
String estado=request.getParameter("estado");
String monedaletra=request.getParameter("monedaletra");

if(accion.equals("guardar")&&(idCliente.length()>0))
    {
    consulta="insert into factura(idCliente,serieFactura,numFactura,fechaFactura,login,guias,moneda,impuesto,descFactura,descripcionigv,estado) values(?,?,?,?,?,?,?,?,?,?,?);";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idCliente);
    ps.setString(2, serieFactura);
    ps.setString(3, numFactura);
    ps.setString(4, fechaFactura);
    ps.setString(5, login);
    ps.setString(6, guias);
    ps.setString(7, moneda);
    ps.setString(8, impuesto);
    ps.setString(9, descFactura);
    ps.setString(10, descripcionigv);
    ps.setString(11, estado);

    if(ps.executeUpdate()==1){response.sendRedirect("factura_detalle_form.jsp");}
   else{out.print("No es posible guardar conductor");}
}
else if(accion.equals("actualizar"))
{
    consulta="update factura set subtotal=?,igv=?,total=?,son=?,monedaletra=? where idFactura=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, subtotal);
    ps.setString(2, igv);
    ps.setString(3, total);
    ps.setString(4, son);
    ps.setString(5, monedaletra);
    ps.setString(6, idFactura);
    ps.executeUpdate();
    
    if(ps.executeUpdate()==1){out.print("No es posible actualizar"); 
    response.sendRedirect("factura_detalle_form.jsp");}
    else{out.print("No es posible actualizar");}
}

else if(accion.equals("eliminar")){
    consulta="delete from conductor where idConductor=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idFactura);
        if(ps.executeUpdate()==1){response.sendRedirect("conductor_list.jsp");}
    else{out.print("No es posible eliminar");}

}else{
    out.print("Accion invalida...");
}

conex.close();
%>