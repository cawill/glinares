<%@include file="../conexion.jsp"%>
<%-- 
    Document   : FormCrt
    Created on : 21/12/2011, 04:51:41 PM
    Author     : william
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<%
    consulta = "SELECT cr.idcrt, cl.razonSocial,cr.numero_2,cr.detalle_transportista,cr.destinatario_4,cr.consignatario_6,cr.notificar_9,p.pais,"
            + "cr.lugarporteador_7,cr.lugarentrega_8,cr.fechaemision_5,cr.porteadorsucesivo_10,cr.detallebultos_11,cr.pesobruto_12,"
            + "cr.volumen_13,cr.valor_14,cr.moneda_14,cr.gastos_15,cr.remitente_15a,cr.remitente_15b,cr.montoremitente_15a,cr.montoremitente_15b,"
            + "cr.totalremitente_15,cr.moneda_15a,cr.destinatario_15a,cr.destinatario_15b,cr.monto_15a,cr.monto_15b,cr.totalmonto_15,cr.moneda_15b,"
            + "cr.valormercancia_16,cr.anexos_17,cr.instruccionesaduana_18,cr.montofleteextern_19,cr.montorembolso_20,"
            + "cr.nombrefirmaremitente_21,cr.fecha_21,cr.declaraciones_22,cr.nombreporteador_23,cr.fechaporteador_23,cr.nombrefirmadestin_24,cr.fechadestin_24,cr.idCliente,cr.idPais, cr.fechaport_7 "
            + "FROM crt cr INNER JOIN cliente cl ON cl.idcliente=cr.idcliente INNER JOIN pais p ON cr.idpais=p.idpais "
            + "WHERE cr.idcrt=?;"; //cadena de consulta
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idcrt"));
    rs = ps.executeQuery();
%>
<%
    consulta = "select razonSocial,idcliente from cliente";
    ps = conex.prepareStatement(consulta);
    ResultSet rst = ps.executeQuery();
%>
<%--DESTINATARIO 6--%>
<%
    consulta = "SELECT cr.idcrt,cl.razonsocial, cr.idCliente FROM crt cr "
            + "INNER JOIN cliente cl ON cl.idcliente=cr.destinatario_4 "
            + "WHERE cr.idcrt=?"; //cadena de consulta
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idcrt"));
    ResultSet rrs = ps.executeQuery();
%>
<%
    consulta = "select razonSocial,idcliente from cliente";
    ps = conex.prepareStatement(consulta);
    ResultSet rrst = ps.executeQuery();
%>
<%--CONSIGNATARIO 6--%>
<%
    consulta = "SELECT cr.idcrt,cl.razonsocial, cr.idCliente "
            + "FROM crt cr "
            + "INNER JOIN cliente cl ON cl.idcliente=cr.consignatario_6 "
            + "WHERE cr.idcrt=?"; //cadena de consulta
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idcrt"));
    ResultSet rrss = ps.executeQuery();
%>
<%
    consulta = "select razonSocial,idcliente from cliente";
    ps = conex.prepareStatement(consulta);
    ResultSet rrsst = ps.executeQuery();
%>
<%--NOTIFICAR 6--%>
<%
    consulta = " SELECT cr.idcrt,cl.razonsocial, cr.idCliente "
            + "FROM crt cr INNER JOIN cliente cl ON cl.idcliente=cr.notificar_9 "
            + "WHERE cr.idcrt=?"; //cadena de consulta
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idcrt"));
    ResultSet rrrss = ps.executeQuery();
%>
<%
    consulta = "select razonSocial,idcliente from cliente";
    ps = conex.prepareStatement(consulta);
    ResultSet rrrsst = ps.executeQuery();
%>

<%--PAIS 5--%>
<%
    consulta = "SELECT CONCAT(p.pais,'   ' ,' /','   ',p.ciudad) AS ubicacion, cr.idPais, cr.idcrt "
            + "FROM pais p "
            + "INNER JOIN crt cr ON p.idpais=cr.idpais "
            + "WHERE cr.idcrt=?"; //cadena de consulta
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idcrt"));
    ResultSet rs5 = ps.executeQuery();
%>
<%
    consulta = "SELECT CONCAT(pais,'   ' ,' /','   ',ciudad) AS ubicacion, idPais FROM pais";
    ps = conex.prepareStatement(consulta);
    ResultSet pais5 = ps.executeQuery();
%>
<%--PAIS 7--%>
<%
    consulta = "SELECT CONCAT(p.pais,'   ' ,' /','   ',p.ciudad) AS ubicacion, cr.idPais, cr.idcrt "
            + "FROM pais p "
            + "INNER JOIN crt cr ON p.idpais=cr.lugarporteador_7 "
            + "WHERE cr.idcrt=?"; //cadena de consulta
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idcrt"));
    ResultSet rs7 = ps.executeQuery();
%>
<%
    consulta = "SELECT CONCAT(pais,'   ' ,' /','   ',ciudad) AS ubicacion, idPais FROM pais";
    ps = conex.prepareStatement(consulta);
    ResultSet pais7 = ps.executeQuery();
%>
<%--PAIS 8--%>
<%
    consulta = "SELECT CONCAT(p.pais,'   ' ,' /','   ',p.ciudad) AS ubicacion, cr.idPais, cr.idcrt "
            + "FROM pais p "
            + "INNER JOIN crt cr ON p.idpais=cr.lugarentrega_8 "
            + "WHERE cr.idcrt=?"; //cadena de consulta
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idcrt"));
    ResultSet rs8 = ps.executeQuery();
%>
<%
    consulta = "SELECT CONCAT(pais,'   ' ,' /','   ',ciudad) AS ubicacion, idPais FROM pais";
    ps = conex.prepareStatement(consulta);
    ResultSet pais8 = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../../css/ultimate.css" type="text/css" media="all"/>
        <link rel="stylesheet" type="text/css" href="../../recursos/css/stylelp1.css" />

        <link href="/css/CssCrt.css" type="text/css" rel="stylesheet" />
        <script src="../../Js/datapicker/jquery.tools.min.js"></script>
        <script>
            $( function () {
                if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
                    $("#fechaemision_5").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#fecha_21").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#fechaporteador_23").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#fechadestin_24").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#form1").validator();
                }
            } );
        </script>

        <link rel="stylesheet" type="text/css" href="../../Js/datapicker/skin1.css" />
        <link  rel="stylesheet" href="../../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>

        <br/><br/>
        <div align="center">
            <form action="crt_save.jsp" method="post" enctype="Application/x-www-form-urlencoded" name="form1" id="form1">


                <table id="rounded-corner" width="887" border="0" align="center">
                    <%--CABECERA --%>
                    <% if (rs.next()) {%>
                    <tr>
                        <th colspan="1" class="rounded-company"></th>
                        <th colspan="5" class="rounded-q4"> <h2>CRT</h2>
                    <br/>
                    CARTA DE PORTE INTERNACIONAL POR CARRETERA <br />
                    CONHECIMIENTO DE TRASPORTE INTERNACIONAL DE RODOVIO
                    <br/><br/>
                    <input name="Submit" type="submit"  value="Guardar"/>
                    &nbsp;&nbsp;&nbsp;
                    <input name="Submit23" type="reset"  value="Cancelar"/>      </th>
                    </tr>
                    <%--FIN CABECERA --%>

                    <tr>

                        <td colspan="5">
                            <p><span class="style14">1 Nombre y domicilio del remitente </span> </p>      <p>
                                <%--1 NOMBRE DOMICILIO DEL REMITENTE --%>
                                <select name="idcliente" class="textImput" id="idcliente" disabled="disabled">
                                    <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idcliente")%>" selected="">
                                        <%=rs.getString("razonSocial")%></option>

                                    <%while (rst.next()) {%>
                                    <option label="<%=rst.getString("razonSocial")%>" value="<%=rst.getString("idcliente")%>">
                                        <%=rst.getString("razonSocial")%></option>
                                        <%}%>
                                </select>
                                <br />
                                <br />
                            </p></td>
                        <td><div align="left"><span class="style14">2 N&uacute;mero </span></div>      <center>
                        <p>
                            <input name="numero_2" type="text" class="textImput" id="numero_2" value="<%=rs.getString("numero_2")%>" size="50" />
                        </p>
                        <p>
                            <textarea name="detalle_transportista" cols="40" rows="4" class="textImput" id="detalle_transportista"  ><%=rs.getString("detalle_transportista")%></textarea>
                        </p>
                    </center></td>
                    </tr>

                    <tr>
                        <td colspan="5">
                            <p><span class="style14">4 Nombre y domicilio del destinatario </span></p>      <p>
                                <label>
                                    <select name="destinatario_4" size="1" class="textImput" id="destinatario_4" disabled="disabled">

                                        <% if (rrs.next()) {%>
                                        <option label="<%=rrs.getString("razonSocial")%>" value="<%=rrs.getString("idcliente")%>" selected="selected">
                                            <%=rrs.getString("razonSocial")%>             </option>
                                            <%}%>
                                            <%while (rrst.next()) {%>
                                        <option label="<%=rrst.getString("razonSocial")%>" value="<%=rrst.getString("idcliente")%>">
                                            <%=rrst.getString("razonSocial")%></option>
                                            <%}%>
                                    </select>
                                </label>
                                <br />
                                <br />
                            </p></td>
                        <td rowspan="3"><p>5 Lugar y pais de emisi&oacute;n </p>
                            <p>
                                <select name="idpais" size="1" class="textImput" id="idpais" disabled="disabled">
                                    <% if (rs5.next()) {%>
                                    <option label="<%=rs5.getString("ubicacion")%>" value="<%=rs5.getString("idpais")%>" selected="selected"> <%=rs5.getString("ubicacion")%> </option>
                                    <%}%>
                                    <%while (pais5.next()) {%>
                                    <option label="<%=pais5.getString("ubicacion")%>" value="<%=pais5.getString("idpais")%>"> <%=pais5.getString("ubicacion")%></option>
                                    <%}%>
                                </select>
                                <input name="fechaemision_5" type="text" class="textImput"  value="<%=rs.getString("fechaemision_5")%>" id="fechaemision_5"  placeholder="yyyy-mm-dd" size="20" />
                            </p>
                            <p><span class="style14">7 Lugar, pa&iacute;s y fecha en que el portador se hace cargo del as mecancias </span> </p>
                            <p>
                                <select name="lugarporteador_7" size="1" class="textImput" id="lugarporteador_7" disabled="disabled">
                                    <% if (rs7.next()) {%>
                                    <option label="<%=rs7.getString("ubicacion")%>" value="<%=rs7.getString("idpais")%>" selected="selected"> <%=rs7.getString("ubicacion")%> </option>
                                    <%}%>
                                    <%while (pais7.next()) {%>
                                    <option label="<%=pais7.getString("ubicacion")%>" value="<%=pais7.getString("idpais")%>"> <%=pais7.getString("ubicacion")%></option>
                                    <%}%>
                                </select>
                                <input name="fechaport_7" type="text" class="textImput"  value="<%=rs.getString("fechaport_7")%>" id="fechaport_7"  placeholder="yyyy-mm-dd" size="20" />
                            </p>
                            <p>8 Lugar, pa&iacute;s y plazo de entrega </p>
                            <p>
                                <select name="lugarentrega_8" size="1" class="textImput" id="lugarentrega_8" disabled="disabled">
                                    <% if (rs8.next()) {%>
                                    <option label="<%=rs8.getString("ubicacion")%>" value="<%=rs8.getString("idpais")%>" selected="selected"> <%=rs8.getString("ubicacion")%> </option>
                                    <%}%>
                                    <%while (pais8.next()) {%>
                                    <option label="<%=pais8.getString("ubicacion")%>" value="<%=pais8.getString("idpais")%>"> <%=pais8.getString("ubicacion")%></option>
                                    <%}%>
                                </select>
                            </p>
                            <p><span class="style14">10 Porteadores sucesivos </span> </p>      <p>
                                <input name="porteadorsucesivo_10" type="text" class="textImput" id="porteadorsucesivo_10" value="<%=rs.getString("porteadorsucesivo_10")%>" size="50" />    
                            </p></td>
                    </tr>

                    <tr>
                        <td colspan="5">
                            <p><span class="style14">6 Nombre y domicilio del Consignatario</span></p>      <p>
                                <label>
                                    <select name="consignatario_6" size="1" class="textImput" id="consignatario_6" disabled="disabled">
                                        <% if (rrss.next()) {%>
                                        <option label="<%=rrss.getString("razonSocial")%>" value="<%=rrss.getString("idcliente")%>" selected="selected">
                                            <%=rrss.getString("razonSocial")%>             </option>
                                            <%}%>
                                            <%while (rrsst.next()) {%>
                                        <option label="<%=rrsst.getString("razonSocial")%>" value="<%=rrsst.getString("idcliente")%>">
                                            <%=rrsst.getString("razonSocial")%></option>
                                            <%}%>
                                    </select>
                                </label>
                                <br />
                                <br />
                            </p></td>
                    </tr>



                    <tr>
                        <td height="74" colspan="5">
                            <p><span class="style14">9 Notificar a: </span></p>      <p>
                                <label>
                                    <select name="notificar_9" size="1" class="textImput" id="notificar_9" disabled="disabled">
                                        <% if (rrrss.next()) {%>
                                        <option label="<%=rrrss.getString("razonSocial")%>" value="<%=rrrss.getString("idcliente")%>" selected="selected">
                                            <%=rrrss.getString("razonSocial")%>             </option>
                                            <%}%>
                                            <%while (rrrsst.next()) {%>
                                        <option label="<%=rrrsst.getString("razonSocial")%>" value="<%=rrrsst.getString("idcliente")%>">
                                            <%=rrrsst.getString("razonSocial")%></option>
                                            <%}%>
                                    </select>
                                </label>
                                <br />
                                <br />
                            </p></td>
                    </tr>


                    <%--11 DETALLES --%>
                    <%--11 DETALLES --%>
                    <%--11 DETALLES --%>
                    <%--11 DETALLES --%>
                    <tr>
                        <td colspan="5" rowspan="3"><p><span class="style14">11 Cantidad y clase de bultos, marcas y n&uacute;meros tipo de mercanc&iacute;as, contenedores y accesorios </span> </p>        <p>
                                <textarea name="detallebultos_11" cols="80" rows="20" class="textImput" id="detallebultos_11"><%=rs.getString("detallebultos_11")%></textarea>
                            </p></td>
                        <td><center>
                        <p align="left"><span class="style14">12. Peso</span> </p>
                        <p>
                            <input name="pesobruto_12" type="text" class="textImput" id="pesobruto_12" value="<%=rs.getString("pesobruto_12")%>" size="25" />
                        </p>
                    </center></td>
                    <tr>
                        <td height="25"><center>
                        <p align="left"><span class="style14">13. Vol&uacute;men</span> </p>
                        <p>
                            <input name="volumen_13" type="text" class="textImput" id="volumen_13" value="<%=rs.getString("volumen_13")%>" size="25" />
                        </p>
                    </center></td>
                    <tr>
                        <td height="129"><center>
                        <p align="left"><span class="style14">14. Valor</span> </p>
                        <p>
                            <input name="valor_14" type="text" class="textImput" value="<%=rs.getString("valor_14")%>"  size="25" />
                            <br>
                            <br>
                            <input name="moneda_14" type="text" class="textImput" value="<%=rs.getString("moneda_14")%>"  size="25" />
                        </p>
                    </center></td>
                    <tr>
                        <td width="178"><span class="style14">15. Gastos a pagar </span></td>
                        <td width="119"><div align="center"><span class="style17">Monto remitente </span></div></td>
                        <td width="62"><div align="center"><span class="style17">Moneda</span></div></td>
                        <td width="141"><div align="center"><span class="style17">Monto destinatario </span></div></td>
                        <td width="54" col><div align="center"><span class="style17">Modeda</span></div></td>
                        <td><span class="style14">16. Declaracion del valor de las mercancias </span></td>
                    </tr>
                    <tr>
                        <td height="147" rowspan="2"><p>
                                <input name="gastos_15" type="text" class="textImput" id="gastos_15" value="<%=rs.getString("gastos_15")%>" size="15" />
                            </p>
                            <p>Otros:</p></td>
                        <td rowspan="2">
                            <textarea name="remitente_15a" cols="15" rows="2" class="textImput" id="remitente_15a"><%=rs.getString("remitente_15a")%></textarea>
                            <textarea name="remitente_15b" cols="15" rows="2" class="textImput" id="remitente_15b"><%=rs.getString("remitente_15b")%></textarea>
                            <input name="montoremitente_15a" type="text" class="textImput" id="montoremitente_15a" value="<%=rs.getString("montoremitente_15a")%>" size="15" />
                            <input name="montoremitente_15b" type="text" class="textImput" id="montoremitente_15b" value="<%=rs.getString("montoremitente_15b")%>" size="15" /></td>
                        <td rowspan="2">
                            <input name="monedaA1" type="text" id="monedaA1" value="NOT"  size="10" />
                            <input name="monedaA2" type="text" id="monedaA2" value="NOT" size="10" />      </td>
                        <td rowspan="2"><p>
                                <textarea name="destinatario_15a" cols="15" rows="2" class="textImput" id="destinatario_15a"><%=rs.getString("destinatario_15a")%></textarea>
                                <textarea name="destinatario_15b" cols="15" rows="2" class="textImput" id="destinatario_15b"><%=rs.getString("destinatario_15b")%></textarea>
                                <input name="monto_15a" type="text" class="textImput" id="monto_15a" value="<%=rs.getString("monto_15a")%>" size="15" />
                                <input name="monto_15b" type="text" class="textImput" id="monto_15b" value="<%=rs.getString("monto_15b")%>" size="15" />
                            </p>      </td>
                        <td rowspan="2"><input name="monedaB1" type="text" id="monedaB1" value="NOT" size="6" />
                            <input name="monedaB2" type="text" id="monedaB2" value="NOT" size="6" /></td>

                        <td height="34"><input name="valormercancia_16" type="text" class="textImput" id="valormercancia_16" value="<%=rs.getString("valormercancia_16")%>" size="25" /></td>
                    </tr>
                    <tr>
                        <td><p><span class="style14">17. Documento anexos </span>
                            </p>        <p>
                                <textarea name="anexos_17" cols="40" rows="3" class="textImput" id="anexos_17"><%=rs.getString("anexos_17")%></textarea>
                            </p></td>
                    </tr>

                    <tr>
                        <td>Total</td>
                        <td><input name="totalremitente_15" type="text" class="textImput" id="totalremitente_15" value="<%=rs.getString("totalremitente_15")%>" size="15" /></td>
                        <td><input name="moneda_15a" type="text" class="textImput" id="moneda_15a" value="<%=rs.getString("moneda_15a")%>" size="10" /></td>
                        <td><input name="totalmonto_15" type="text" class="textImput" id="totalmonto_15" value="<%=rs.getString("totalmonto_15")%>" size="15" /></td>
                        <td><input name="moneda_15b" type="text" class="textImput" id="moneda_15b" value="<%=rs.getString("moneda_15b")%>" size="6" /></td>
                        <td><span class="style14">18. Insurecciones sobre formalidades de aduana </span></td>
                    </tr>
                    <tr>
                        <td height="23" colspan="5">
                            <p><span class="style14">19 Monto del flete externo</span> </p>          <p>
                                <input name="montofleteextern_19" type="text" class="textImput" id="montofleteextern_19" value="<%=rs.getString("montofleteextern_19")%>" size="25" />
                            </p>
                            <p><span class="style14">20 Monto de rembolso contra entrega </span> </p>
                            <p>
                                <input name="montorembolso_20" type="text" class="textImput" value="<%=rs.getString("montorembolso_20")%>" size="80" />
                            </p></td>
                        <td rowspan="2">
                            <textarea name="instruccionesaduana_18" cols="40" rows="5" class="textImput" id="instruccionesaduana_18"><%=rs.getString("instruccionesaduana_18")%></textarea></td>
                    </tr>

                    <tr>
                        <td colspan="5" rowspan="2">
                            <p><span class="style14">1 Nombre y firma del remitente o su representante </span></p>        </td>
                    </tr>

                    <tr>
                        <td height="35"><span class="style14">22 Declaraciones y observaciones</span></td>
                    </tr>
                    <tr>
                        <td height="93" colspan="5"><p>
                                <textarea name="nombrefirmaremitente_21" cols="65" rows="3" class="textImput" id="nombrefirmaremitente_21"><%=rs.getString("nombrefirmaremitente_21")%></textarea>
                            </p>
                            <p><span class="style14">Fecha</span><span class="style27">:</span>
                                <span class="style27">
                                    <input name="fecha_21" type="text" class="textImput" id="fecha_21"  placeholder="yyyy-mm-dd" value="<%=rs.getString("fecha_21")%>" size="30" />
                                </span></p></td>
                        <td rowspan="2">
                            <textarea name="declaraciones_22" cols="40" rows="5" class="textImput" id="declaraciones_22"><%=rs.getString("declaraciones_22")%></textarea></td>
                    </tr>

                    <tr>
                        <td colspan="5" rowspan="3">
                            <p><span class="style14">23 Nombre, firma y sello del porteador o su representante </span> </p>          <p>
                                <textarea name="nombreporteador_23" cols="65" rows="3" class="textImput" id="nombreporteador_23"><%=rs.getString("nombreporteador_23")%></textarea>
                            </p></td>
                    </tr>

                    <tr>
                        <td height="31"><span class="style14">24 Nombre y firma del destinatario o su representante </span></td>
                    </tr>
                    <tr>
                        <td height="89">
                            <textarea name="nombrefirmadestin_24" cols="40" rows="5" class="textImput" id="nombrefirmadestin_24"><%=rs.getString("nombrefirmadestin_24")%></textarea></td>
                    </tr>
                    <tr>
                        <td height="23" colspan="5"><span class="style14">Fecha:
                                <input name="fechaporteador_23" type="text" class="textImput" id="fechaporteador_23" placeholder="yyyy-mm-dd" value="<%=rs.getString("fechaporteador_23")%>" size="30" />
                            </span></td>
                        <td width="291" height="23">
                            <span class="style14">Fecha/date:
                            <input name="fechadestin_24" type="text" class="textImput" id="fechadestin_24"  placeholder="yyyy-mm-dd" value="<%=rs.getString("fechadestin_24")%>" size="30" /></td>
                    </tr>
                    <tr>
                        <td height="23" colspan="6">

                            <div align="center">

                                <input name="Submit2" type="submit" class="style26" value="Guardar CRT"/>
                                -:-
                                <input name="Submit22" type="reset" class="style26" value="Cancelar"/>
                            </div></td>
                    </tr>
                    <% }%>
                </table>

                <input type="hidden" name="accion" value="actualizar">
                <input type="hidden" name="idcrt" value="<%=rs.getString("idcrt")%>">

            </form>        
        </div>
    </body>
</html>
