<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<%

String accion = request.getParameter("accion");

String idgasto = request.getParameter("idgasto");
String nrocompro = request.getParameter("nrocompro");
String ruc = request.getParameter("ruc");
String fechacomp=request.getParameter("fechacomp");
String cantidad=request.getParameter("cantidad");
String descrip =request.getParameter("descrip");
String total=request.getParameter("total");

if(accion.equals("guardar")&&(nrocompro.length()>0))
    {
    consulta="insert into gastos(nrocompro, ruc, fechacomp, cantidad ,descrip ,total) "
            + "values(?,?,?,?,?,?);";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, nrocompro);
    ps.setString(2, ruc);
    ps.setString(3, fechacomp);
    ps.setString(4, cantidad);
    ps.setString(5, descrip);
    ps.setString(6, total);
    
    if(ps.executeUpdate()==1){response.sendRedirect("gasto_list.jsp");}
    else{out.print("No es posible guardar gastos");
    }
}
else if(accion.equals("actualizar")&&(idgasto.length()>0)&&(nrocompro.length()>0))
{
    consulta="update gastos set nrocompro=?, ruc=?, fechacomp=?, "
            + "cantidad=?, descrip=?,total=? where idgasto=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, nrocompro);
  
    ps.setString(2, ruc);
    ps.setString(3, fechacomp);
    ps.setString(4, cantidad);
    ps.setString(5, descrip);
    ps.setString(6, total);
    ps.setString(7, idgasto);
    if(ps.executeUpdate()==1){response.sendRedirect("gasto_list.jsp");}
    else{out.print("No es posible actualizar");}
}

else if(accion.equals("eliminar")){
    consulta="delete from gastos where idgasto=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idgasto);
        if(ps.executeUpdate()==1){response.sendRedirect("gasto_list.jsp");}
    else{out.print("No es posible eliminar");}

}else{
    out.print("Accion invalida...");
}

conex.close();
%>