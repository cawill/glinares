<%-- 
    Document   : factura_form
    Created on : 09-jul-2012, 20:24:33
    Author     : magwi
--%>
<%@include file="../conexion.jsp" %>
<%@include file="../session_verifica.jsp" %>
<%@page import="com.gl.controlador.FacturaController" %>
<%@page import="utils.FechaSistema"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    FacturaController c = new FacturaController();
%>
<%
    FechaSistema fs = new FechaSistema();
%>
<%
    consulta = "SELECT c.idcliente, c.razonsocial, c.ruc, dc.direccion "
            + "  FROM cliente c "
            + " INNER JOIN detallecliente dc ON c.idcliente = dc.idcliente "
            + "where ruc = ?;";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("ruc"));
    rs = ps.executeQuery();
%>

<%
    consulta = "SELECT LAST_INSERT_ID(numFactura) +1 "
            + "AS ProximoIdAInsertar "
            + "FROM factura "
            + "ORDER BY numFactura "
            + "DESC LIMIT 1";
    PreparedStatement psn = conex.prepareStatement(consulta);
    ResultSet rsn = psn.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Factura</title>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <script src="../../Js/datapicker/jquery.tools.min.js"></script>
        <script>
            $( function() {
                if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
                    $("#fecha").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#form1").validator();
                }
            } );
        </script>
        <link rel="stylesheet" type="text/css" href="../../Js/datapicker/skin1.css" />
        <style type="text/css">
            <!--
            .style4 {color: #000000; font-weight: bold; }
            .style5 {font-style: italic}
            .style6 {color: #000000; font-weight: bold; font-style: italic; }
            -->
        </style>
    </head>
    <body>
        <div>
            <center>
                <form name="formBus" action="factura_form_search.jsp" method="get">
                    <table id="rounded-corner">
                        <thead>
                        <center><th>CLIENTES</th></center>
                        </thead>
                        <tr>
                            <th width="100">Buscar por : </th>
                            <th width="100">
                                <select name="opcionBusqueda">
                                    <option value="1">Razon Social</option>
                                    <option value="2">Ruc</option>
                                </select>                        </td>
                            <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                            <th><button type="submit" title="Buscar"><img alt="" src="../../imagenes/icons/buscar.png" height="30" width="30"/></button>
                                &nbsp;&nbsp;
                                <a href="../cliente_add_fm.jsp" title="Nuevo Cliente"> <img alt="" src="../../imagenes/icons/file_add.png" height="35" width="35"/></a>&nbsp;</span></th>
                        </tr>
                    </table>
                </form>
                <form action="factura_save.jsp" method="POST" id="form1">
                    <table border="1" >
                        <thead>
                            <tr>
                                <th colspan="4">FACTURACION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td></td><td></td>
                                <td colspan="2" style=" border-radius: 5px; background-color: moccasin ">
                                    <h3>RUC 20519906504</h3>
                                </td>
                            </tr>
                            <tr>
                                <td></td><td></td>
                                <th>SERIE:</th>
                                <td><input type="text" name="serieFactura" value="001"/></td>
                            </tr>
                            <tr>
                                <td></td><td></td>
                                <th>Nº FACTURA :</th>
                                <td><%if (rsn.next()) {%>
                                    <input type="text" name="numFactura" value="<%=c.nf().customFormat("000000", rsn.getInt("ProximoIdAInsertar"))%>">
                                    <%} else {%>
                                    <input type="text" name="numFactura" value="<%=c.nf().customFormat("000000", 1)%>">
                                    <%}%></td>
                            </tr>
                            <tr>
                                <td></td><td></td>
                                <th>USUARIO :</th>
                                <td><input type="text" name="login" value="<%=session_login%>" readonly/></td>
                            </tr>
                            <tr><th>RAZON SOCIAL</th>
                        <input type="hidden" name="idCliente"  size="50"/>
                        <td><input type="text" name="razonsocial"  size="70"/></td>
                        <th>FECHA</th>
                        <td>
                            <%-- <input type="text" name="fechaFactura" value="" /> --%>
                            <input type="month" name="fechaFactura" id="fecha" placeholder="dia-mes-año" value="<%=fs.fs().fecha()%>">
                        </td>
                        </tr>
                        <tr>
                            <th>DIRECCION</th>
                            <td><input type="text" name="direccion"  size="70"/></td>
                            <th>RUC</th>
                            <td><input type="text" name="ruc"  /></td>
                        </tr>

                        <tr>
                            <th>Nº GUIA :</th>
                            <td><input type="text" name="guias" value="" size="40" maxlength="17"</td>
                            <th>TIPO MONEDA: 
                                <select name="moneda">
                                    <option value="US$">US$</option>
                                    <option value="S/.">S/.</option>
                                </select>
                            </th>
                            <th>IMPUESTO :
                                <select name="impuesto">
                                    <option value="0.18">18%</option>
                                    <option value="0.19">19%</option>
                                    <option value="0.00">0 %</option>
                                </select>
                            </th>
                        </tr>
                        <tr>
                            <th>TIPO DE SERV.</th>
                            <td>
                                <textarea cols="60" rows="2" name="descFactura" placeholder="POR EL SERVICIO DE:" maxlength="100" onChange="javascript:this.value=this.value.toUpperCase();" ></textarea>
                            </td>
                            <th>TIPO DETRACCION:<br/><br/><br/>CONDICION:
                            </th>
                            <td>
                                <select name="descripcionigv">
                                    <option value="">--Ninguno--</option>
                                    <option value="Operación Sujeta al Sistema de Pago de Obligaciones Tributarias Con el Gobierno Central Cta. De detracción Banco de la Nación Nº 00-157-000020">Detracción</option>
                                    <option value="EXONERADO DEL IGV D.S. 055-99-EF APÉNDICE II NUMERAL TRES">Exonerado</option>
                                </select><br/><br/>
                                <select name="estado">
                                    <option value="EN ESPERA">En Espera</option>
                                    <option value="CANCELADO">Cancelado</option>
                                    <option value="ANULADO">Anulado</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="4" style="text-align: right"><input type="submit" value="Siguiente" name="confirmar"/></th>
                        </tr>
                        </tbody>
                        <input type="hidden" name="accion" value="guardar">
                    </table>
                </form>
                <br/>
            </center>
        </div>
        <%conex.close();%>
    </body>
</html>