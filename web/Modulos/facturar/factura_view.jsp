<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="../conexion.jsp" %>
<%@page import="utils.*;" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    String serie = "";
    int num = 0;
    String idFactura = "";
    String cliente = "";
    String ruc = "";
    String direccion = "";
    String fechaNum = "";
    String fechaLetras = "";
    String son = "";
    String subtotal = "";
    String igv = "";
    String total = "";
    String estdo = "";
    String fechaCancelLetras = "";
    String descFac = "";
    String descIgv = "";
    try {
        consulta = "SELECT DISTINCT f.idFactura AS IdFactura, "
                + "f.fechaFactura AS FechaFactura, "
                + "f.serieFactura AS SerieFactura, "
                + "f.numFactura AS NumFactura, "
                + "f.descFactura AS DescFactura, "
                + "c.razonSocial AS RazonSocial, "
                + "c.ruc AS Ruc, "
                + "det.direccion AS Direccion, "
                + "f.estado AS Estado, "
                + "f.fechaFactura AS FechaFactura, "
                + "f.son AS Son, "
                + "f.fechaLetras AS FechaLetras, "
                + "f.fechaCancelLetras AS FechaCancelLetras, "
                + "f.subtotal AS SubTotal, "
                + "f.igv AS Igv, "
                + "f.total AS Total, "
                + "f.descripcionigv AS DescIgv "
                + "FROM Factura AS f "
                + "INNER JOIN DetalleFactura AS d "
                + "ON f.idFactura = d.idFactura "
                + "INNER JOIN cliente AS c "
                + "ON f.idCliente=c.idCliente "
                + "INNER JOIN detalleCliente AS det "
                + "ON c.idCliente=det.idCliente "
                + "WHERE f.idFactura=?";
        ps = conex.prepareStatement(consulta);
        ps.setString(1, request.getParameter("idFactura"));
        rs = ps.executeQuery();

        while (rs.next()) {
            idFactura = rs.getString("IdFactura");
            fechaNum = rs.getString("FechaFactura");
            serie = rs.getString("SerieFactura");
            num = rs.getInt("NumFactura");
            cliente = rs.getString("RazonSocial");
            ruc = rs.getString("Ruc");
            direccion = rs.getString("Direccion");
            fechaLetras = rs.getString("FechaLetras");
            subtotal = rs.getString("SubTotal");
            igv = rs.getString("Igv");
            total = rs.getString("Total");
            son = rs.getString("Son");
            estdo = rs.getString("Estado");
            fechaCancelLetras = rs.getString("FechaCancelLetras");
            descFac = rs.getString("DescFactura");
            descIgv = rs.getString("DescIgv");

        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<%
    consulta = "SELECT d.descripcion,d.precioUnit,"
            + "d.cantidad, d.importe "
            + "FROM detalleFactura d "
            + "INNER JOIN factura f "
            + "ON f.idFactura=d.idFactura "
            + "WHERE f.idFactura=? ORDER BY d.idDetalleFactura";
    PreparedStatement psd = conex.prepareStatement(consulta);
    psd.setString(1, request.getParameter("idFactura"));
    ResultSet rsd = psd.executeQuery();
%>
<%
    NumeroFactura nf = new NumeroFactura();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />

    </head>
    <body>
        <center>
            <table id="rounded-corner-list_2">
                <tr>
                    <th colspan="1" class="rounded-company"></th>
                    <th colspan="2" style="padding: 7px">
                        <div align="right">
                            <b>FACTURA 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;
                            </b>
                        </div>
                    </th>
                    <th colspan="4" class="rounded-q4">

                    </th>
                </tr>
                <tr>
                    <th ><div align="center" >
                            
                        </div>                        </th>
                    <th  width="120" ><div align="center" >

                            <div align="left">
                                
                            </div>
                        </div>
                        <div align="center" class="style37">
                            <div align="left"></div>
                        </div>
                    </th>
                    <th  colspan="2">
                        <div align="right">
                            Serie:
                            <input name="txtSerieFactura" type="text" value="<%=serie%>" size="3">
                        </div>
                    </th>
                    <th  width="119" colspan="2" ><div align="center" >
                            <div align="left">N<b>°</b>
                                <input type="text" name="txtNumFactura"size="6" value="<%=nf.customFormat("000000", num)%>"/>
                            </div>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th  width="44" ><div align="center" >
                            <div align="right">Cliente:</div>
                        </div></th>
                    <th  width="219" ><div align="left">
                            <div>
                                <input type="text" size="50" value="<%=cliente%>">
                            </div>
                        </div>
                    </th >
                    <th  colspan="5">
                        Fecha:
                        <input name="txtFechaFactura" type="text" value="<%=fechaNum%>">
                    </th>
                </tr>
                <tr>
                    <th>
                        <div align="right">
                            Direccion:
                        </div>
                    </th>
                    <th>
                        <div id="dir">
                            <input type="text" size="50"  value="<%=direccion%>"/>
                        </div>
                    </th>

                    <th colspan="5" >
                        <div id="ruc">
                            <span><span>Ruc:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                <label>
                                    <input type="text" value="<%=ruc%>"/>
                                </label>
                            </span>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th><div align="center">Cant.</div></th>
                    <th colspan="3"><div align="center">Descripcion</div></th>
                    <th width="119"><div align="center">P. Unit. </div></th>
                    <th><div align="center">Importe</div></th>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <textarea  cols="44" rows="2" readonly><%=descFac%></textarea>
                    </td>
                    <td colspan="1"></td>
                    <td colspan="1"></td>
                </tr>
                <%
                    try {
                        while (rsd.next()) {
                %>
                <tr>
                    <td><%=rsd.getString("cantidad")%></td>
                    <td colspan="3"><span><%=rsd.getString("descripcion")%></span></td>
                    <td>&nbsp;</td>
                    <td><%=rsd.getString("importe")%></td>
                </tr>
                <%}
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }%>
                <tr>
                    <td colspan="1"></td>
                    <td colspan="3" align="left">
                        <input type="text" value="<%=descIgv%>" size="78"/>
                    </td>
                    <td colspan="1"></td>
                    <td colspan="1"></td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td colspan="3" align="right" ><span>Sub Total</span></td>
                    <td colspan="1" align="right"><div align="left" >

                            <input name="txtSubTotal" type="text" value="<%=subtotal%>" size="10" maxlength="10"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td colspan="3" align="right"><span >IGV&nbsp;</span></td>
                    <td colspan="1" align="right">
                        <div align="left" >
                            <input name="txtIgv" type="text" value="<%=igv%>" size="10" maxlength="10"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"></td>
                    <td colspan="3" align="right"><span>Total</span></td>
                    <td colspan="1" align="right" >
                        <div align="left" >
                            <input name="txtTotal" type="text"  value="<%=total%>" size="10" maxlength="10"/>
                        </div>
                    </td>
                </tr>

                <tr>
                    <th  colspan="7">
                        <div align="left">Son:
                            <input name="txtSon" type="text" value="<%=son%>" size="117" maxlength="117">
                        </div>
                    </th>
                </tr>
                <tr>
                    <th  colspan="2" align="left">
                        
                    </th>
                    <th  colspan="5">
                        
                    </th>
                </tr>
                
            </table>
            <%conex.close();%>
        </center>
    </body>
</html>
