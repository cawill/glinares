<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<%

String accion = request.getParameter("accion");

String idConductor = request.getParameter("idConductor");
String dniconductor = request.getParameter("dniconductor");
String licenciaconductor = request.getParameter("licenciaconductor");
String nombreconductor = request.getParameter("nombreconductor");
String apellidoPconductor=request.getParameter("apellidoPconductor");
String apellidoMconductor=request.getParameter("apellidoMconductor");
String ciudadconductor =request.getParameter("ciudadconductor");
String paisconductor=request.getParameter("paisconductor");
String estado=request.getParameter("estado");
String idCliente = request.getParameter("idCliente");

if(accion.equals("guardar")&&(dniconductor.length()>0))
    {
    consulta="insert into conductor(dniconductor,licenciaconductor,nombreconductor,apellidoPconductor," +
            "apellidoMconductor,ciudadconductor,paisconductor,estado,idCliente) values(?,?,?,?,?,?,?,?,?);";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, dniconductor);
    ps.setString(2, licenciaconductor);
    ps.setString(3, nombreconductor);
    ps.setString(4, apellidoPconductor);
    ps.setString(5, apellidoMconductor);
    ps.setString(6, ciudadconductor);
    ps.setString(7, paisconductor);
    ps.setString(8, estado);
    ps.setString(9, idCliente);

    if(ps.executeUpdate()==1){response.sendRedirect("conductor_list.jsp");}
    else{out.print("No es posible guardar conductor");
    }
}
else if(accion.equals("actualizar")&&(idConductor.length()>0)&&(dniconductor.length()>0))
{
    consulta="update conductor set dniconductor=?,licenciaconductor=?,nombreconductor=?," +
            "apellidoPconductor=?,apellidoMconductor=?,ciudadconductor=?,paisconductor=?,estado=?,idCliente=?" +
            " where idConductor=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, dniconductor);
    ps.setString(2, licenciaconductor);
    ps.setString(3, nombreconductor);
    ps.setString(4, apellidoPconductor);
    ps.setString(5, apellidoMconductor);
    ps.setString(6, ciudadconductor);
    ps.setString(7, paisconductor);
    ps.setString(8, estado);
    ps.setString(9, idCliente);
    ps.setString(10, idConductor);
    if(ps.executeUpdate()==1){response.sendRedirect("conductor_list.jsp");}
    else{out.print("No es posible actualizar");}
}

else if(accion.equals("eliminar")){
    consulta="delete from conductor where idConductor=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idConductor);
        if(ps.executeUpdate()==1){response.sendRedirect("conductor_list.jsp");}
    else{out.print("No es posible eliminar");}

}else{
    out.print("Accion invalida...");
}

conex.close();
%>