<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<%
String igv=request.getParameter("txtigv");
String nombreIgv="";
String descripcionIgv="";
if(igv.equals("0.19")){
nombreIgv="19%";
descripcionIgv="IGV ACTIVO 19%";
}
if(igv.equals("0.18")){
nombreIgv="18%";
descripcionIgv="IGV ACTIVO 18%";
}
if(igv.equals("0.00")){
nombreIgv=" 0% ";
descripcionIgv="IGV ACTIVO 0% POR EXONERACION";
}
if(igv.equals("1")){
nombreIgv="Seleccione IGV...!";
descripcionIgv="ACTIVE UN IGV POR FAVOR(IGV POR DEFECTO 18%)";
igv="0.18";
}

    consulta="UPDATE impuestoGeneralVentas SET igv=?,nombreIgv=?,descripcionIgv=?" +
            " where idIgv=1";
    ps=conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("txtigv"));
    ps.setString(2, nombreIgv);
    ps.setString(3, descripcionIgv);
    ps.executeUpdate();

    response.sendRedirect("registrarVenta.jsp");

conex.close();
%>