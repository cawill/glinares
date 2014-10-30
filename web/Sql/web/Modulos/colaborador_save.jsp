<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<%

String accion = request.getParameter("accion");

String idcolab = request.getParameter("idcolab");
String nombreape = request.getParameter("nombreape");
String telf = request.getParameter("telf");
String cell = request.getParameter("cell");
String cell2=request.getParameter("cell2");
String nextel=request.getParameter("nextel");
String anexo =request.getParameter("anexo");
String email=request.getParameter("email");
String email2=request.getParameter("email2");
String idCliente = request.getParameter("idCliente");

if(accion.equals("guardar")&&(nombreape.length()>0))
    {
    consulta="insert into colaborador(nombreape,telf,cell,cell2," +
            "nextel,anexo,email,email2,idCliente) values(?,?,?,?,?,?,?,?,?);";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, nombreape);
    ps.setString(2, telf);
    ps.setString(3, cell);
    ps.setString(4, cell2);
    ps.setString(5, nextel);
    ps.setString(6, anexo);
    ps.setString(7, email);
    ps.setString(8, email2);
    ps.setString(9, idCliente);

    if(ps.executeUpdate()==1){response.sendRedirect("colaborador_list.jsp");}
    else{out.print("No es posible guardar colaborador");
    }
}
else if(accion.equals("actualizar")&&(idcolab.length()>0)&&(nombreape.length()>0))
{
    consulta="update colaborador set nombreape=?,telf=?,cell=?," +
            "cell2=?,nextel=?,anexo=?,email=?,email2=?,idCliente=?" +
            " where idcolab=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, nombreape);
    ps.setString(2, telf);
    ps.setString(3, cell);
    ps.setString(4, cell2);
    ps.setString(5, nextel);
    ps.setString(6, anexo);
    ps.setString(7, email);
    ps.setString(8, email2);
    ps.setString(9, idCliente);
    ps.setString(10, idcolab);
    if(ps.executeUpdate()==1){response.sendRedirect("colaborador_list.jsp");}
    else{out.print("No es posible actualizar");}
}

else if(accion.equals("eliminar")){
    consulta="delete from colaborador where idcolab=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, idcolab);
        if(ps.executeUpdate()==1){response.sendRedirect("colaborador_list.jsp");}
    else{out.print("No es posible eliminar");}

}else{
    out.print("Accion invalida...");
}

conex.close();
%>