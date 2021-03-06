<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp" %>
<%@page import="utils.*;" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Lista de Facturas</title>
        <%-- <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"> --%>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../../Js/jquery.js" ></script>
        <script type="text/javascript">
            ver=function(direccion)
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
        <%
                consulta = "SELECT f.idFactura,c.razonSocial,f.serieFactura,f.login, f.numFactura, "
                        + "f.fechaFactura, CONCAT(f.moneda,' ',f.subtotal) AS subtotal, "
                        + "CONCAT(f.moneda,' ',f.igv) AS igv, CONCAT(f.moneda,' ',f.total) AS total,f.estado "
                        + " FROM cliente c "
                        + "INNER JOIN factura f ON c.idCliente=f.idCliente "
                        + "ORDER BY f.numFactura DESC;";
                ps = conex.prepareStatement(consulta);
                rs = ps.executeQuery();
        %>
        <%
                NumeroFactura nf = new NumeroFactura();
        %>
<%--
        <div align="center">
            <h3>FACTURA</h3>
            &nbsp;<a href="registrarVenta.jsp" title="Nueva Factura"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
            &nbsp;<a href="detalleFactura_list.jsp" title="Buscar Facturas"><img alt="" style="margin-bottom: -3px" src="../imagenes/icons/search.png" height="40" width="40"/></a>&nbsp;
            <br>
        </div>
--%>
    <div align="center">
            <form name="formBus" action="detalleFactura_list_search.jsp" method="get">
                <table id="rounded-corner">
                    <tr id="rounded-buscar"> 
                        <th colspan="2" class="rounded-company"></th>
                        <th colspan="2" class="rounded-q4"></th>
                    </tr>
                    <tr>
                        <th width="100">Buscar por :</th>
                        <th width="100">
                            <select name="opcionBusqueda">
                                <option value="1">Numero de Factura</option>
                                <option value="2">Fecha de Factura</option>
                                <option value="3">
                                Estado de Boleta(Cancelado-Por cancelar-Anulado)
                                </option>
                                <option value="4">Razon Social</option>
                            </select>
                        </th>
                        <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                        <th><button type="submit" title="Buscar"><img alt="" src="../../imagenes/icons/buscar.gif" height="16" width="16"/></button></th>
                    </tr>
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="2" class="rounded-foot-right"></th>
                    </tr>
                </table>
            </form>
            <form name="form_factura" action="factura_save.jsp" method="post">
                <table id="rounded-corner">
                    <tr>
                        <th class="rounded-company" colspan="4"></th>
                        <th colspan="2">
                            LISTA DE FACTURAS
                        </th>
                    </tr>
                    <tr>
                        <th>Id</th>
                        <th>Cliente</th>
                        <th>N�</th>
                        <th>Fecha</th>
                        <th>Sub Total</th>
                        <th>IGV</th>
                        <th>Total</th>
                        <th>Usuario</th>
                        <th>Estado</th>
                        <th>Opciones</th>
                    </tr>
                    <%while (rs.next()) {
                String idFactura = rs.getString("idFactura");%>
                    <tr>
                        <td><%=rs.getString("idFactura")%></td>
                        <td><%=rs.getString("razonSocial")%></td>
                        <td><%=rs.getString("serieFactura")%>&nbsp;&nbsp;&nbsp;<%=nf.customFormat("000000", rs.getInt("numFactura"))%></td>
                        <td><%=rs.getString("fechaFactura")%></td>
                        <td><%=rs.getString("subtotal")%></td>
                        <td><%=rs.getString("igv")%></td>
                        <td><%=rs.getString("total")%></td>
                        <td><%=rs.getString("login")%></td>
                        <td><%=rs.getString("estado")%></td>
    <td>
        <a href="factura_view.jsp?idFactura=<%=idFactura%>" title="Ver"><img alt="" src="../../imagenes/icons/view.gif"/></a>&nbsp;
        <a href="factura_save_opc.jsp?accion=cancelar&idFactura=<%=idFactura%>" title="Cancelar" onclick="return confirm('Va a Cancelar la Factura')"><img alt="" src="../../imagenes/icons/activo.gif"/></a>&nbsp;
        <a href="factura_save_opc.jsp?accion=anular&idFactura=<%=idFactura%>" title="Anular" onclick="return confirm('Va a Anular la Factura')"><img alt="" src="../../imagenes/icons/anular.gif"/></a>
        <a href="../reportes/reporte_factura.jsp?repfac=<%=rs.getString("idFactura")%>" title="Imprimir" onclick="return confirm('Imprimir')"><img alt="" src="../../imagenes/icons/print.gif"/></a>
    </td>


                    </tr>
                    <%}conex.close();%>
                </table>
            </form>

        </div>
        <br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br>
<%conex.close();%>
    </body>
</html>
