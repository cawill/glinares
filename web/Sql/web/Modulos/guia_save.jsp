<%@include file="conexion.jsp" %>
<%-- 
    Document   : guia_save
    Created on : 25/03/2012, 01:50:34 AM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <title>Edicion de Guia</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <%
            String orden = request.getParameter("accion");

            String idGuia = request.getParameter("idGuia");
            String serie = request.getParameter("txtSerie");
            String nroGuia = request.getParameter("txtNroGuia");
            String puntoPartida = request.getParameter("txtPuntoPartida");
            String puntoLlegada = request.getParameter("txtPuntoLlegada");
            String idpais = request.getParameter("txtIdpais");
            String ciudadA = request.getParameter("txtCiudadA");
            String idCliente = request.getParameter("txtIdCliente");
            String rSocialDestinatario = request.getParameter("txtrSocialDestinatario");

            String fechaTraslado = request.getParameter("txtFechaTraslado");
            String costoMinimo = request.getParameter("txtCostoMinimo");
            String totCantidad = request.getParameter("txtTotCantidad");
            String totBulto = request.getParameter("txtTotBulto");
            String totPesoTot = request.getParameter("txtTotPesoTot");
            String estado = request.getParameter("txtEstado");
            String idtracto = request.getParameter("txtIdTracto");
            String idrampla = request.getParameter("txtIdRampla");
            String idconductor = request.getParameter("txtIdConductor");
            String datosTransportista = request.getParameter("txtDatosTransportista");

            if(orden.equals("actualizar"))
                              
            {
                consulta="update guia_remision set serie=?,nroGuia=?,"
                        + "puntoPartida=?,puntoLlegada=?,idpais=?,"
                        + "ciudadA=?,idCliente=?,rSocialDestinatario=?,"
                        + "fechaTraslado=?,costoMinimo=?,totCantidad=?,"
                        + "totBulto=?,totPesoTot=?,estado=?,idtracto=?,"
                        + "idrampla=?,idconductor=?,datosTransportista=? "
                        + " where idGuia=?";
                ps=conex.prepareStatement(consulta);
                ps.setString(1, serie);
                ps.setString(2, nroGuia);
                ps.setString(3, puntoPartida);
                ps.setString(4, puntoLlegada);
                ps.setString(5, idpais);
                ps.setString(6, ciudadA);
                ps.setString(7, idCliente);
                ps.setString(8, rSocialDestinatario);
                ps.setString(9, fechaTraslado);
                ps.setString(10, costoMinimo);
                ps.setString(11, totCantidad);
                ps.setString(12, totBulto);
                ps.setString(13, totPesoTot);
                ps.setString(14, estado);
                ps.setString(15, idtracto);
                ps.setString(16, idrampla);
                ps.setString(17, idconductor);
                ps.setString(18, datosTransportista);
                ps.setString(19, idGuia);
                if(ps.executeUpdate()==1){
                %>
                <h1 align="center">LA ACTUALIZACIÓN SE REALIZÓ CON ÉXITO </h1><br/>
                <div align="center">
                <a href="guia_edit_fm.jsp?idGuia=<%=idGuia%>"><button type="button">Volver</button></a>
                </div>
                <%
                }
            }
/*

            out.println(idGuia);
            out.print("<br>");
            out.println(serie);
            out.print("<br>");
            out.println(nroGuia);
            out.print("<br>");
            out.println(puntoPartida);
            out.print("<br>");
            out.println(puntoLlegada);
            out.print("<br>");
            out.println(idpais);
            out.print("<br>");
            out.println(ciudadA);
            out.print("<br>");
            out.println(idCliente);
            out.print("<br>");
            out.println(rSocialDestinatario);
            out.print("<br>");

            out.println(fechaTraslado);
            out.print("<br>");
            out.println(costoMinimo);
            out.print("<br>");
            out.println(totCantidad);
            out.print("<br>");
            out.println(totBulto);
            out.print("<br>");
            out.println(totPesoTot);
            out.print("<br>");
            out.println(estado);
            out.print("<br>");
            out.println(idtracto);
            out.print("<br>");
            out.println(idrampla);
            out.print("<br>");
            out.println(idconductor);
            out.print("<br>");
            out.println(datosTransportista);
            out.print("<br>");
*/
        %>

    </body>
</html>
