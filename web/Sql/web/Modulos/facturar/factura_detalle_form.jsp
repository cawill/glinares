<%-- 
    Document   : factura_form
    Created on : 09-jul-2012, 20:24:33
    Author     : magwi
--%>
<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@include file="../conexion.jsp" %>
<%@include file="../session_verifica.jsp" %>
<%@page import="com.gl.controlador.FacturaController" %>
<%@page import="utils.FechaSistema"%>
<%@page import="utils.Redondear" %>
<%@page import="utils.NumeroFactura" %>
<%@page import="utils.ConvertSLL" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
    ConvertSLL clet = new ConvertSLL();

    NumeroFactura nf = new NumeroFactura();

    FacturaController c = new FacturaController();

    FechaSistema fs = new FechaSistema();

    Redondear red = new Redondear();


    consulta = "SELECT (CASE WHEN moneda='US$' THEN 'DOLARES AMERICANOS' ELSE 'NUEVOS SOLES' END) AS monedaletra FROM factura "
            + " WHERE login = ? AND idfactura=(SELECT MAX(idfactura) FROM factura WHERE login = ? ) ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, session_login);
    ps.setString(2, session_login);
    ResultSet rsmoneda = ps.executeQuery();

    consulta = "SELECT  f.idfactura,f.numfactura,f.serieFactura,c.razonsocial,f.fechaFactura,f.subtotal,f.igv,f.total,f.moneda "
            + " FROM factura f INNER JOIN cliente c ON c.idcliente=f.idcliente "
            + " INNER JOIN detallecliente dc ON c.idcliente=dc.idcliente "
            + " WHERE f.login=? AND f.idfactura = (SELECT MAX(idfactura) FROM factura WHERE login = ?) ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, session_login);
    ps.setString(2, session_login);
    rs = ps.executeQuery();

    consulta = " SELECT SUM(df.importe) AS subtotal,(SELECT SUM(df.importe) * f.impuesto AS ff "
            + " FROM factura f INNER JOIN detalleFactura df ON f.idFactura = df.idFactura"
            + " WHERE f.login=? AND f.idfactura = (SELECT MAX(idfactura) FROM factura WHERE login = ?)"
            + " ) AS igv, ((SELECT SUM(df.importe) AS subtotal FROM factura f"
            + " INNER JOIN detalleFactura df ON f.idFactura = df.idFactura "
            + " WHERE f.login=? AND f.idfactura = (SELECT MAX(idfactura) FROM factura WHERE login = ?))"
            + " + ( SELECT SUM(df.importe) * f.impuesto AS ff FROM factura f"
            + " INNER JOIN detalleFactura df ON f.idFactura = df.idFactura "
            + " WHERE f.login=? AND f.idfactura = (SELECT MAX(idfactura) FROM factura WHERE login = ?)"
            + " )) AS total FROM factura f INNER JOIN detalleFactura df ON f.idFactura = df.idFactura"
            + " WHERE f.login=? AND f.idfactura = (SELECT MAX(idfactura) FROM factura WHERE login = ?) ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, session_login);
    ps.setString(2, session_login);
    ps.setString(3, session_login);
    ps.setString(4, session_login);
    ps.setString(5, session_login);
    ps.setString(6, session_login);
    ps.setString(7, session_login);
    ps.setString(8, session_login);
    ResultSet sit = ps.executeQuery();
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="recursos/css/layout.css" />
        <script type="text/javascript" src="recursos/js/jquery.min.js"></script>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <script src="recursos/js/facebox.js" type="text/javascript" ></script>
        <script type="text/javascript">
            jQuery(document).ready(function($) {
                $('a[rel*=facebox]').facebox({
                    loadingImage : 'recursos/img/loading.gif',
                    closeImage   : 'recursos/img/closelabel.gif'
                })
            })
        </script>
        <script language="JavaScript">
            function newWindow(pagina)
            {
                window.open(pagina, "work", "Menubar=no, status=no, resizable=yes, toolbar=no, scrollbars=yes, top=0, left=0 ");
                //			window.open("login.html", windowName, "Menubar=no, status=no, resizable=yes, toolbar=no, scrollbars=yes, top=0, left=0,width=" + w + ",height=" + h );
            }
        </script>
    </head>
    <body OnLoad="document.form1.cantidad.focus();">
        <div>
            <center>
                <form action="factura_save.jsp" method="POST">
                    <table border="1" >
                        <thead>
                            <tr>
                                <th colspan="4">FACTURACION</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%if (rs.next()) {%>
                            <tr>
                                <td></td>
                                <td></td>
                                <td colspan="2">
                                    <h3>RUC 20519906504</h3>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <th colspan="1">SERIE :</th>
                        <input type="hidden" name="idFactura" value="<%=rs.getString("idFactura")%>"/>
                        <td><%=rs.getString("serieFactura")%></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <th colspan="1">Nº FACTURA :</th>
                            <td><%=nf.nf().customFormat("000000", rs.getInt("numFactura"))%></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <th colspan="1">MONEDA :</th>
                            <td><%=rs.getString("moneda")%></td>
                        </tr>
                        <tr>
                            <th colspan="1">RAZON SOCIAL :</th>
                            <td><%=rs.getString("razonSocial")%></td>
                            <th colspan="1">FECHA</th>
                            <td><%=rs.getString("fechaFactura")%></td>
                        </tr>

                        <tr>
                            <%if (sit.next()) {%>
                            <th>SUSTOTAL : <input name="subtotal" type="text" value="<%=red.red().Redondear(sit.getDouble("subtotal"), 2)%>" style="text-align: right"/></th>
                            <th>IGV : <input name="igv" type="text" value="<%=red.red().Redondear(sit.getDouble("igv"), 2)%>" style="text-align: right"/></th>
                            <th>TOTAL : <input name="total" type="text" value="<%=red.red().Redondear(sit.getDouble("total"), 2)%>" style="text-align: right"/></th>
                        </tr>
                        <tr>
                            <td><input type="hidden" name="son"  value="<%=clet.csll().sullNro_Palabras(red.red().Redondear(sit.getDouble("total"), 2)).toUpperCase()%>"/></td>
                                <%}%>
                                <%if (rsmoneda.next()) {%>
                            <td><input type="hidden" name="monedaletra"  value="<%=rsmoneda.getString("monedaletra")%>"/></td>
                                <%}%>
                            <td colspan="2">
                                <input type="submit" name="guardar" value="Guardar"/> &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="factura_detalle_form.jsp" style="color: buttontext ">[&nbsp;REFRESH&nbsp;]&nbsp;&nbsp;</a>
                                <a href=javascript:newWindow("factura_view.jsp?idFactura=<%=rs.getString("idFactura")%>") style="color: blueviolet">[&nbsp;PREVIEW &nbsp;]&nbsp;&nbsp;</a>
                                <a href="../reportes/reporte_factura.jsp?repfac=<%=rs.getString("idFactura")%>" title="Imprimir" onclick="return confirm('Imprimir')" style="color: blueviolet">[&nbsp;PRINT&nbsp;]&nbsp;&nbsp;</a>
                                <a href="menupanel/menupanel.jsp" style="color: red" onclick="return confirm('Va a Salir de la Factura ?')">[&nbsp;EXIT&nbsp;]</a>
                            </td>
                        </tr>

                        </tbody>
                        <input type="hidden" name="accion" value="actualizar">
                        <input type="hidden" name="idFactura" value="<%=rs.getString("idFactura")%>"</td>
                    </table>  
                </form>


                <form name="form1" action="factura_save_detalle.jsp" method="POST">
                    <table>
                        <tr>
                            <th>CANTIDAD</th>
                            <th>DESCRIPCION</th>
                            <th>IMPORTE</th>
                            <th></th>
                        </tr>
                        <tr>
                            <td><input type="text" name="cantidad" maxlength="10" autocomplete="off" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" /></td>
                            <td><input type="text" name="descripcion" size="70" maxlength="60" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                            <td><input type="text" name="importe" maxlength="7" autocomplete="off" onKeypress="if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" /></td>
                            <td><input type="submit" name="agregar" value="agregar"/>
                                <input type="hidden" name="idFactura" value="<%=rs.getString("idFactura")%>"</td>
                        </tr>
                        <input type="hidden" name="accion" value="guardar">
                    </table>
                </form>


                <%}
                    conex.close();%>
                <br/>
                <iframe name="con" frameborder="0" height="300" width="1000" src="detalle_factura.jsp" style="border-radius: 10px">    
                <%-- <jsp:forward page="home.jsp"></jsp:forward> --%>
                </iframe> 
            </center>
        </div>
        <%conex.close();%>
    </body>
</html>