<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp" %>
<%@page import="utils.*;" %>

<%
FechaSistema fs=new FechaSistema();
String orden=request.getParameter("accion");
String idFactura=request.getParameter("idFactura");
String fechaCancelLetras="";
String fechaCancel="";
if(orden.equals("cancelar")){
consulta="update factura set fechaCancelLetras=?,fechaCancel=?," +
        "estado='CANCELADO' " +
        "where idFactura=?;";

 fechaCancelLetras="Tacna, " + fs.diaEnNumeros() + " de " +
        fs.mesEnLetras() + " del " + fs.anioEnNumeros(fs.fecha());
fechaCancel=fs.fecha().toString();

ps=conex.prepareStatement(consulta);

ps.setString(1, fechaCancelLetras);
ps.setString(2, fechaCancel);
ps.setString(3, idFactura);

if(ps.executeUpdate()==1){
response.sendRedirect("detalleFactura_list.jsp");
}else{out.print("Es imposible cancelar...");}

//-----------------------------------------------

}else if(orden.equals("anular")){

consulta="update factura set fechaCancelLetras=?,fechaCancel=?, " +
        "estado='ANULADO' " +
        "where idFactura=?;";

    fechaCancelLetras="Tacna, " + fs.diaEnNumeros() + " de " +
   fs.mesEnLetras() + " del " + fs.anioEnNumeros(fs.fecha());
 fechaCancel=fs.fecha().toString();
ps=conex.prepareStatement(consulta);


ps.setString(1, fechaCancelLetras);
ps.setString(2, fechaCancel);
ps.setString(3, idFactura);

if(ps.executeUpdate()==1){
response.sendRedirect("detalleFactura_list.jsp");
}else{out.print("Es imposible anular");}
}

conex.close();
%>