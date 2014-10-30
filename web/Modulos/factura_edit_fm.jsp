<%@page import="java.awt.image.RescaleOp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>
<%@page import="utils.*;" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    String serie = "";
    int num = 0;
    String id = "";
    String idDetalle = "";
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
    String moneda = "";
    String monedaletra = "";
    String idCliente = "";
    try {
        consulta = "SELECT DISTINCT f.idFactura AS IdFactura, "
                + "f.fechaFactura AS FechaFactura, "
                + "f.idCliente AS IdCliente, "
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
                + "f.descripcionigv AS DescIgv, "
                + "f.moneda as Moneda, "
                + "f.monedaletra as Monedaletra "
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
            id = rs.getString("IdFactura");
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
            moneda = rs.getString("moneda");
            monedaletra = rs.getString("monedaletra");
            idCliente = rs.getString("IdCliente");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
<%
    consulta = "SELECT d.descripcion,d.precioUnit,"
            + "d.idDetalleFactura, "
            + "f.idFactura, "
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
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">

        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script language="javascript" type="text/javascript" src="../Js/AjaxForFactura.js"></script>  
        <script type="text/javascript">
            editar=function(direccion)
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:direccion,
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");

                    }
                });

            }


        </script>
    </head>
    <body>


        <div align="center">
            <h3>FACTURA</h3>
            &nbsp;<a href="registrarVenta.jsp" title="Nueva Factura"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
                <%--            &nbsp;<a href="factura_list.jsp" title="Listar Facturas"><img alt="" src="../imagenes/icons/gastos.png" height="40" width="40"/></a>&nbsp;--%>
            &nbsp;<a href="detalleFactura_list.jsp" title="Buscar Facturas"><img alt="" style="margin-bottom: -3px" src="../imagenes/icons/search.png" height="40" width="40"/></a>&nbsp;
            <br><br>
        </div>

        <div align="center">
            <br>
            <form action="factura_save.jsp" method="post">
                <div  id="contenedor" style="display:none" ></div>
                <table id="rounded-corner-list_2" align="center">
                    <tr>
                        <th class="rounded-company" colspan="2"></th>
                        <th colspan="5" class="rounded-q4"><div align="left">
                                <b>
                                    FACTURA                                
                                </b>
                            </div>                        
                        </th>
                    </tr>
                    <tr>
                        <th><div align="center" >
                                <div align="right"></div>
                            </div>                        <label></label></th>
                        <th width="120" ><div align="center" >

                                <div align="left"></div>
                            </div>
                            <div align="center" class="style37">
                                <div align="left"></div>
                            </div>                        
                        </th>
                        <th  colspan="2">
                            <div align="right">
                                Serie:
                                <input name="txtSerieFactura" type="text" value="<%=serie%>" size="3">
                            </div>                        </th>
                        <th  width="119" colspan="3" ><div align="center" >
                                <div align="left">N<b>°</b>
                                    <input type="text" name="txtNumFactura"size="6" value="<%=nf.customFormat("000000", num)%>"/>
                                </div>
                            </div>                        </th>
                    </tr>
                    <tr>
                        <th  width="44" ><div align="center" >
                                <div align="right">Cliente:</div>
                            </div></th>
                        <th  width="219" >
                            <div align="left">



                                <select name="txtIdCliente" id="cliente" onchange="recogerDirAndRuc()">
                                    <%
                                        consulta = "select*from cliente where idCliente=?";
                                        PreparedStatement psc = conex.prepareStatement(consulta);
                                        psc.setString(1, idCliente);
                                        ResultSet rsc = psc.executeQuery();
                                        if (rsc.next()) {
                                    %>
                                    <option value="<%=rsc.getString("idCliente")%>">
                                        <%=rsc.getString("razonSocial")%>  
                                    </option>
                                    <%}
                                        consulta = "select*from cliente";
                                        PreparedStatement psc1 = conex.prepareStatement(consulta);
                                        ResultSet rsc1 = psc1.executeQuery();
                                        while (rsc1.next()) {
                                    %>
                                    <option value="<%=rsc1.getString("idCliente")%>">
                                        <%=rsc1.getString("razonSocial")%>
                                    </option>
                                    <%}%>
                                </select>


                            </div>                        </th>
                        <th  colspan="5">
                            Fecha:
                            <input name="txtFechaLetras" type="hidden" size="55" value="<%=fechaLetras%>"/>
                            <input name="txtFechaFactura" type="text" value="<%=fechaNum%>"></th>
                    </tr>
                    <tr>
                        <th>
                            <div align="center">
                                <label>
                                    Direccion:                                
                                </label>
                            </div>                        
                        </th>

                        <th>
                            <div id="dir">
                                <input disabled type="text" size="50 " name="txtDireccion" value="<%=direccion%>" readonly/>
                            </div>                        
                        </th>

                        <th colspan="5" >
                            <div id="ruc">
                                <span><span>Ruc:&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <label>
                                        <input disabled type="text" name="txtRuc"value="<%=ruc%>" readonly/>
                                    </label>
                                </span>                            
                            </div>                        
                        </th>
                    </tr>
                    <tr>
                        <th colspan="7" align="center"><input type="submit" value="Actualizar"></th>
                    </tr>
                    <tr>
                        <th><div align="center">Cant.</div></th>
                        <th colspan="3"><div align="center">Descripcion</div></th>
                        <th width="119"><div align="center">P. Unit. </div></th>
                        <th><div align="center">Importe</div></th>
                        <th>Editar</th>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3"><textarea name="txtDescFactura"cols="60" rows="2"><%=descFac%></textarea></td>
                        <td colspan="1"></td>
                        <td colspan="1"></td>
                        <td colspan="1"></td>
                    </tr>

                    <%
                        try {
                            while (rsd.next()) {
                    %>

                    <tr>
                        <td><%=rsd.getString("cantidad")%></td>
                        <td colspan="3">
                            <%=rsd.getString("descripcion")%>                        </td>
                        <td>&nbsp;</td>
                        <td><%=rsd.getString("importe")%></td>
                        <td>
                            <a href="#" onclick="editar('detalleFactura_edit_fm.jsp?accion=editar&idDetalleFactura=<%=rsd.getString("idDetalleFactura")%>&idFactura=<%=rsd.getString("idFactura")%>')">
                                <input type="button" value="Editar"/>
                            </a>                        </td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
                        }%>
                    <tr>
                        <td colspan="1"></td>
                        <td colspan="3" align="left">
                            <input type="text" value="<%=descIgv%>" size="78" name="txtDescripcionIgv"/>                        </td>
                        <td colspan="1"></td>
                        <td colspan="1"></td>
                        <td colspan="1"></td>
                    </tr>

                    <tr> <td colspan="5"align="right" ><span>Sub Total</span></td>
                        <td colspan="2" align="right"><div align="left" >

                                <input name="txtSubTotal" type="text" value="<%=subtotal%>" size="10" maxlength="10"/>
                            </div>                        </td>
                    </tr>
                    <tr>
                        <td colspan="5"align="right"><span >IGV&nbsp;</span></td>
                        <td colspan="2" align="right">
                            <div align="left" >
                                <input name="txtIgv" type="text" value="<%=igv%>" size="10" maxlength="10"/>
                            </div>                        </td>
                    </tr>
                    <tr>
                        <td colspan="5"align="right"><span>
                                <input name="txtMoneda" value="<%=moneda%>"type="text" size="5" maxlength="5">                        
                                Total</span></td>
                        <td colspan="2" align="right" >
                            <div align="left" >

                                <input name="txtTotal" type="text"  value="<%=total%>" size="10" maxlength="10"/>
                            </div>                        </td>
                    </tr>

                    <tr>
                        <th  colspan="7">
                            <div align="left">Son:
                                <input name="txtSon" type="text" value="<%=son%>" size="80" maxlength="100">
                                &nbsp;&nbsp;
                                <input name="txtMonedaletra" type="text" value="<%=monedaletra%>" size="20" maxlength="20">
                            </div>                        </th>
                    </tr>
                    <tr>
                        <th  colspan="2" align="left">
                            <div>
                                <span>Estado:</span>
                                <label>
                                    <input type="text" value="<%=estdo%>" name="txtEstado">
                                </label>
                            </div>                        </th>
                        <th  colspan="5">
                            <div id="fechCL">
                                <label>
                                    <input name="txtFechaCancelLetras" value="<%=fechaCancelLetras%>" type="text" size="62" maxlength="63" >
                                </label>
                            </div>                        </th>
                    </tr>
                    <tr align="center">
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="5" align="left" class="rounded-foot-right"><input type="submit" value="Actualizar"></th>
                    </tr>
                </table>
                <input type="hidden" name="accion" value="edit"/>
                <input  type="hidden" name="idFactura"value="<%=id%>"/>

                <%conex.close();%>
        </div>  
    </form>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
</body>
</html>
