<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
    </head>
    <body>
    <%
String idboleta=request.getParameter("idboleta");
String orden=request.getParameter("accion");



String txtFechaBoleta=request.getParameter("txtFechaBoleta");
String txtSerieBoleta=request.getParameter("txtSerieBoleta");
int txtNumBoleta=Integer.parseInt(request.getParameter("txtNumBoleta"));
String txtFechaLetras=request.getParameter("txtFechaLetras");
String txtDescripcionBoleta=request.getParameter("txtDescripcionBoleta");
double txtTotal=Double.parseDouble(request.getParameter("txtTotal"));
String txtSon=request.getParameter("txtSon");
String txtEstado=request.getParameter("txtEstado");
String txtFechaCancelLetras=request.getParameter("txtFechaCancelLetras");
String txtIdCliente=request.getParameter("txtIdCliente");

if(orden.equals("edit")){

    consulta="update boleta set fechaelaboleta=?,serieboleta=?," +
            "numboleta=?,fechaLetras=?,descripcionboleta=?," +
            "total=?,son=?,estado=?,fechaCancelLetras=?,idCliente=? " +
            "where idboleta=?;";
    ps=conex.prepareStatement(consulta);

    ps.setString(1, txtFechaBoleta);
    ps.setString(2, txtSerieBoleta);
    ps.setInt(3, txtNumBoleta);
    ps.setString(4, txtFechaLetras);
    ps.setString(5, txtDescripcionBoleta);
    ps.setDouble(6, txtTotal);
    ps.setString(7, txtSon);
    ps.setString(8, txtEstado);
    ps.setString(9, txtFechaCancelLetras);
    ps.setString(10, txtIdCliente);
    ps.setString(11, idboleta);

    if(ps.executeUpdate()==1){
%>
<div align="center">
<h1>La actualización se realizó con éxito!</h1>
<a href="boleta_edit_fm.jsp?idboleta=<%=idboleta%>"><button type="button">Regresar</button></a>
</div>
<%
    }
}
conex.close();
%>
    
    
    
    
    </body>
</html>
