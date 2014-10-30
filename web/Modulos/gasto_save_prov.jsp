<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<%

String accion = request.getParameter("accion");

String ruc = request.getParameter("ruc");
String razonsocial = request.getParameter("razonsocial");
String direccion=request.getParameter("direccion");

if(accion.equals("guardar")&&(ruc.length()>0))
    {
    consulta="insert into proveedor (ruc, razonsocial, direccion) "
            + "values(?,?,?);";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, ruc);
    ps.setString(2, razonsocial);
    ps.setString(3, direccion);
    
    if(ps.executeUpdate()==1){response.sendRedirect("gasto_list.jsp");}
    else{out.print("No es posible guardar proveedor");
    }
}
else if(accion.equals("actualizar")&&(ruc.length()>0))
{
    consulta="update proveedor set  razonsocial=?,  direccion=? where ruc=?;";
    ps=conex.prepareStatement(consulta);

    
    ps.setString(1, razonsocial);
    ps.setString(2, direccion);
    ps.setString(3, ruc);
    if(ps.executeUpdate()==1){response.sendRedirect("gasto_list.jsp");}
    else{out.print("No es posible actualizar");}
}

else if(accion.equals("eliminar")){
    consulta="delete from proveedor where ruc=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, ruc);
        if(ps.executeUpdate()==1){response.sendRedirect("gasto_list.jsp");}
    else{out.print("No es posible eliminar");}

}else{
    out.print("Accion invalida...");
}

conex.close();
%>