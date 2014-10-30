<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
            consulta = "SELECT g.idGuia,g.serie,g.nroGuia,g.puntoPartida, " +
                    "g.puntoLlegada,g.fechaTraslado,g.costoMinimo, " +
                    "g.totCantidad,g.totBulto,g.totPesoTot,g.estado, " +
                    "CONCAT(pp.ciudad,' ' ,' -',' ',pp.pais) AS pais_partida, " +
                    "CONCAT(pl.ciudad,' ' ,' -',' ',pl.pais) AS pais_llegada, " +
                    "cr.razonSocial AS remitente, " +
                    "cd.razonSocial AS destiantario, " +
                    "cdt.razonSocial AS transportista, " +
                    "t.marca AS marca_tracto, " +
                    "t.placa AS placa_tracto, " +
                    "r.placa AS placa_rampla, " +
                    "t.configuracion AS configuracion_tracto," +
                    "t.nroconstancia as constancia, " +
                    "CONCAT(co.nombreconductor,' ',co.apellidopconductor,' ',co.apellidomconductor) AS conductor, " +
                    "co.licenciaconductor, " +
                    "dc.direccion, " +
                    "cdt.pais, " +
                    "cdt.departamento, " +
                    "cdt.ruc " +
                    "FROM guia_remision g " +
                    "INNER JOIN pais pp ON pp.idpais=g.ciudadA " +
                    "INNER JOIN pais pl ON pl.idpais=g.idpais " +
                    "INNER JOIN cliente cr ON cr.idCliente=g.idCliente " +
                    "INNER JOIN cliente cd ON cd.idCliente=g.rSocialDestinatario " +
                    "INNER JOIN cliente cdt ON cdt.idCliente=g.datosTransportista " +
                    "INNER JOIN tracto t ON t.idtracto=g.idtracto " +
                    "INNER JOIN detalleCliente dc ON g.datosTransportista=dc.idCliente " +
                    "INNER JOIN ramplas r ON r.idRampla=g.idRampla " +
                    "INNER JOIN conductor co ON co.idconductor=g.idconductor " +
                    "where g.idGuia=?; ";

            ps = conex.prepareStatement(consulta);
            ps.setString(1, request.getParameter("idGuia"));
            rs = ps.executeQuery();
%>

<%
consulta="SELECT*FROM detalleguiaremision WHERE idGuia=? ORDER BY idDetalleGuia";
PreparedStatement psd=conex.prepareStatement(consulta);
psd.setString(1, request.getParameter("idGuia"));
ResultSet rsd=psd.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>

        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        <br>
        
<%if(rs.next()){%>
<table align="center" id="rounded-corner-comp">
    <tr>
        <th class="rounded-company" colspan="1"></th>
        <th colspan="4" style="padding: 7px">
            <div align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <b>GUIA DE REMISION</b>
            </div>
        </th>
        <th class="rounded-q4" colspan="2"></th>
    </tr>
    <tr>
        <th colspan="3">
            <div align="right">
                Serie
                <input name="txtSerie" value="<%=rs.getString("serie")%>"type="text" size="5">
            </div>
        </th>
        <th colspan="4">N°
            <label>
                <input name="txtNroGuia" value="<%=rs.getString("nroGuia")%>"type="text" size="7">
            </label>
        </th>
    </tr>
    <tr>
        <th colspan="2"><div align="center">Punto de Partida </div></th>
        <th colspan="5"><div align="center">Punto de Llegada </div></th>
    </tr>
    <tr>
        <td colspan="2">
            <textarea name="txtPuntoPartida" cols="45" rows="4"><%=rs.getString("puntoPartida")%>
            </textarea>
        </td>
        <td colspan="5">
            <textarea name="txtPuntoLlegada" cols="45" rows="4"><%=rs.getString("puntoLlegada")%>
            </textarea>
        </td>
    </tr>
    <tr>
        <th colspan="2">Ciudad/Pais</th>
        <th colspan="5">Ciudad/Pais</th>
    </tr>
    <tr>
        <td  colspan="2">
            <input name="txtIdpais" type="text" value="<%=rs.getString("pais_partida")%>" size="50"/>
        </td>
        <td colspan="5">
            <input name="txtCiudadA" type="text" value="<%=rs.getString("pais_llegada")%>" size="50"/>
        </td>
    </tr>
    <tr>
        <th colspan="2"><div align="center">Nombre o Razon Social del Remitente </div></th>
        <th colspan="5" ><div align="center">Nombre o Razon Social del Destinatario</div></th>
    </tr>
    <tr>
        <td  colspan="2">
            <label>
                <input name="txtIdCliente" value="<%=rs.getString("remitente")%>" type="text" size="50"/>
            </label>
        </td>
        <td colspan="5">
            <label>
                <input name="txtrSocialDestinatario" value="<%=rs.getString("destiantario")%>" size="50"/>
            </label>
        </td>
    </tr>
    <tr>
        <th colspan="2">
            <label><div align="center" >Fecha de Inicio de Traslado </div></label>
        </th>
        <th colspan="5">
            <div align="center" >Costo Minimo U$S </div>
        </th>
    </tr>
    <tr>
        <th>
            <div align="right">Fecha</div>
        </th>
        <td>
            <label><input name="txtFechaTraslado"value="<%=rs.getString("fechaTraslado")%>" type="text" ></label>
        </td>
        <th colspan="3">
            <label><div align="right">Costo</div></label>
        </th>
        <td colspan="3"><input name="txtCostoMinimo" type="text" value="<%=rs.getString("costoMinimo")%>"/></td>
    </tr>
    <tr>
        <th><div align="center" >Codigo</div></th>
        <th colspan="3" ><div align="center" >Descripcion</div></th>
        <th><div align="center">Cantidad</div></th>
        <th><div align="center">Unidad de Medida</div></th>
        <th><div align="center">Peso Total </div></th>
    </tr>

<%while(rsd.next()){%>
<tr align="left">
        <td><%=rsd.getString("codigo")%></td>
        <td colspan="3" ><%=rsd.getString("descripcion")%></td>
        <td><%=rsd.getString("cantidad")%></td>
        <td><%=rsd.getString("unidMedida")%></td>
        <td><%=rsd.getString("pesoTotal")%></td>
    </tr>
<%}%>

<tr align="left">
        <td colspan="4">&nbsp;<label >TOTALES:</label></td>
        <td>
            <input name="txtTotCantidad" value="<%=rs.getString("totCantidad")%>"  type="text" size="10" >
        </td>
        <td>

            <input name="txtTotBulto" value="<%=rs.getString("totBulto")%>" type="text"  size="10"/>
        </td>
        <td colspan="1" >
            <input name="txtTotPesoTot" type="text"  value="<%=rs.getString("totPesoTot")%>" size="10" />
        </td>
    </tr>

    <tr>
        <th colspan="8"><div> Estado:
                <label>
                    <input name="txtEstado" value="<%=rs.getString("estado")%>" type="text"/>
                </label>
            </div></th>
    </tr>
    <tr>
        <th colspan="2">Datos de la Unidad de Transporte </th>
        <th colspan="6">Datos de la Empresa Sub Contratada </th>
    </tr>
    <tr>
        <th colspan="2" valign="top">
            Marca&nbsp;
            <input type="text" value="<%=rs.getString("marca_tracto")%>" name=""/>
            <br><br>
            Tracto&nbsp;
                <input name="txtIdTracto" value="<%=rs.getString("placa_tracto")%>" type="text"/>

            Rampla
            <input name="txtIdRampla" type="text" value="<%=rs.getString("placa_rampla")%>"/>
            <br><br>

            Configuracion Vehicular&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" value="<%=rs.getString("configuracion_tracto")%>" name=""/>
            <br><br>

            Constancia de Inscripcion MTC N°&nbsp;
            <input type="text" value="<%=rs.getString("constancia")%>" name=""/>

            <br><br>
            Chofer&nbsp;&nbsp;&nbsp;
            <input name="txtIdConductor" type="text" value="<%=rs.getString("conductor")%>" size="45">
            <br><br>

            Licencia&nbsp;
            <input type="text" value="<%=rs.getString("licenciaconductor")%>" />

        </th>
        <th colspan="6" valign="top">
            Razon Social&nbsp;
            <input name="txtDatosTransportista" value="<%=rs.getString("transportista")%>" type="text" size="45"/>
                    <br><br>
                    Direccion&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" value="<%=rs.getString("direccion")%>" size="45"/>
                    <br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" value="<%=rs.getString("departamento")%> - <%=rs.getString("pais")%>"  size="45"/>
                    <br><br>
                    Ruc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="text" value="<%=rs.getString("ruc")%>" size="45"/>
        </th>
    </tr>
    <tr>
        <th colspan="1" class="rounded-foot-left"></th>
        <th colspan="6" class="rounded-foot-right">
            <div align="right">
                <input name="btnVenta" type="submit"  value="Registrar Venta"/>
            </div>
        </th>
    </tr>
</table>
<%}%>

<%conex.close();%>

</body>
</html>
