<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    consulta = "SELECT * from guia_remision where idGuia=?; ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("idGuia"));
    rs = ps.executeQuery();
%>

<%
    consulta = "SELECT*FROM detalleguiaremision WHERE idGuia=? ORDER BY idDetalleGuia";
    PreparedStatement psd = conex.prepareStatement(consulta);
    psd.setString(1, request.getParameter("idGuia"));
    ResultSet rsd = psd.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script type="text/javascript">
            edit=function(direccion)
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
        <script language="javascript" type="text/javascript" src="../Js/AjaxForFactura.js"></script>
        <script language="javascript" type="text/javascript" src="../Js/AjaxForGuia.js"></script>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        <script src="../Js/datapicker/jquery.tools.min.js"></script>
        <!-- Add the dateinput and validator tools to the form (except for iOS devices) -->
        <script>
            $( function () {
                if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
                    $("#txtFechaTraslado").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#form1").validator();
                }
            } );
        </script>

        <!-- For styling the dateinput field and calendar -->
        <link rel="stylesheet" type="text/css" href="../Js/datapicker/skin1.css" />
    </head>
    <body>
        <div align="center" >
            <h3 >GUIA DE REMISION</h3>
            &nbsp;<a href="registrarVentaGuia.jsp" title="Nueva Guia de Remision"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
            &nbsp;<a href="detalleGuia_list.jsp" title="Buscar Guias de Remision"><img alt="" src="../imagenes/icons/search.png" style="margin-bottom: -3px" height="40" width="40"/></a>&nbsp;

            <br><br>

        </div>
        <br>
        <div align="center">
            <div class="style1" id="contenedor" style="display:none" ></div>
            <form id="form1" action="guia_save.jsp" method="post">
                <%if (rs.next()) {%>
                <table align="center" id="rounded-corner-comp">
                    <tr>
                        <th class="rounded-company" colspan="1"></th>
                        <th colspan="5" style="padding: 7px">
                            <div align="center">

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
                        <th colspan="5">N°
                            <label>
                                <input name="txtNroGuia" value="<%=rs.getString("nroGuia")%>"type="text" size="7">
                            </label>
                        </th>
                    </tr>
                    <tr>
                        <th colspan="2"><div align="center">Punto de Partida </div></th>
                        <th colspan="6"><div align="center">Punto de Llegada </div></th>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea name="txtPuntoPartida" cols="45" rows="4"><%=rs.getString("puntoPartida")%>
                            </textarea>
                        </td>
                        <td colspan="6">
                            <textarea name="txtPuntoLlegada" cols="45" rows="4"><%=rs.getString("puntoLlegada")%>
                            </textarea>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">Ciudad/Pais</th>
                        <th colspan="6">Ciudad/Pais</th>
                    </tr>
                    <tr>
                        <td  colspan="2">

                            <select name="txtIdpais">
                                <%
                                    consulta = "select*from pais where idpais=?;";
                                    PreparedStatement psp = conex.prepareStatement(consulta);
                                    psp.setString(1, rs.getString("idpais"));
                                    ResultSet rsp = psp.executeQuery();
                                    while (rsp.next()) {
                                %>
                                <option value="<%=rs.getString("idpais")%>">
                                    <%=rsp.getString("ciudad")%>-<%=rsp.getString("pais")%> 
                                </option>
                                <%
                                    }
                                    consulta = "select*from pais where idpais;";
                                    PreparedStatement psp1 = conex.prepareStatement(consulta);
                                    ResultSet rsp1 = psp1.executeQuery();
                                    while (rsp1.next()) {
                                %>
                                <option value="<%=rsp1.getString("idpais")%>">
                                    <%=rsp1.getString("ciudad")%>-<%=rsp1.getString("pais")%>  
                                </option>
                                <%}%>
                            </select>
                        </td>
                        <td colspan="6">

                            <select name="txtCiudadA">
                                <%
                                    consulta = "select*from pais where idpais=?;";
                                    PreparedStatement psp2 = conex.prepareStatement(consulta);
                                    psp2.setString(1, rs.getString("ciudadA"));
                                    ResultSet rsp2 = psp2.executeQuery();
                                    while (rsp2.next()) {
                                %>
                                <option value="<%=rs.getString("ciudadA")%>">
                                    <%=rsp2.getString("ciudad")%>-<%=rsp2.getString("pais")%> 
                                </option>
                                <%
                                    }
                                    consulta = "select*from pais where idpais;";
                                    PreparedStatement psp3 = conex.prepareStatement(consulta);
                                    ResultSet rsp3 = psp3.executeQuery();
                                    while (rsp3.next()) {
                                %>
                                <option value="<%=rsp3.getString("idpais")%>">
                                    <%=rsp3.getString("ciudad")%>-<%=rsp3.getString("pais")%>  
                                </option>
                                <%}%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2"><div align="center">Nombre o Razon Social del Remitente </div></th>
                        <th colspan="6" ><div align="center">Nombre o Razon Social del Destinatario</div></th>
                    </tr>
                    <tr>
                        <td  colspan="2">
                            <label>

                                <select name="txtIdCliente">
                                    <%
                                        consulta = "select*from cliente where idcliente=?;";
                                        PreparedStatement psc = conex.prepareStatement(consulta);
                                        psc.setString(1, rs.getString("idcliente"));
                                        ResultSet rsc = psc.executeQuery();
                                        while (rsc.next()) {
                                    %>
                                    <option value="<%=rs.getString("idcliente")%>">
                                        <%=rsc.getString("razonSocial")%>
                                    </option>
                                    <%
                                        }
                                        consulta = "select*from cliente where idcliente;";
                                        PreparedStatement psc1 = conex.prepareStatement(consulta);
                                        ResultSet rsc1 = psc1.executeQuery();
                                        while (rsc1.next()) {
                                    %>
                                    <option value="<%=rsc1.getString("idcliente")%>">
                                        <%=rsc1.getString("razonSocial")%>
                                    </option>
                                    <%}%>
                                </select>
                            </label>
                        </td>
                        <td colspan="6">
                            <label>

                                <select name="txtrSocialDestinatario">
                                    <%
                                        consulta = "select*from cliente where idcliente=?;";
                                        PreparedStatement psc2 = conex.prepareStatement(consulta);
                                        psc2.setString(1, rs.getString("rSocialDestinatario"));
                                        ResultSet rsc2 = psc2.executeQuery();
                                        while (rsc2.next()) {
                                    %>
                                    <option value="<%=rs.getString("rSocialDestinatario")%>">
                                        <%=rsc2.getString("razonSocial")%>
                                    </option>
                                    <%
                                        }
                                        consulta = "select*from cliente where idcliente;";
                                        PreparedStatement psc3 = conex.prepareStatement(consulta);
                                        ResultSet rsc3 = psc3.executeQuery();
                                        while (rsc3.next()) {
                                    %>
                                    <option value="<%=rsc3.getString("idcliente")%>">
                                        <%=rsc3.getString("razonSocial")%>
                                    </option>
                                    <%}%>
                                </select>
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <label><div align="center" >Fecha de Inicio de Traslado </div></label>
                        </th>
                        <th colspan="6">
                            <div align="center" >Costo Minimo U$S </div>
                        </th>
                    </tr>
                    <tr>
                        <td>
                            <div align="right">Fecha</div>
                        </td>
                        <td>
                            <label><input id="txtFechaTraslado" name="txtFechaTraslado" value="<%=rs.getString("fechaTraslado")%>" type="text" ></label>
                        </td>
                        <td colspan="3">
                            <label><div align="right">Costo</div></label>
                        </td>
                        <td colspan="3"><input name="txtCostoMinimo" type="text" value="<%=rs.getString("costoMinimo")%>"/></td>
                    </tr>
                    <tr>
                        <th><div align="center" >Codigo</div></th>
                        <th colspan="3" ><div align="center" >Descripcion</div></th>
                        <th><div align="center">Cantidad</div></th>
                        <th><div align="center">Unidad de Medida</div></th>
                        <th><div align="center">Peso Total </div></th>
                        <th align="center">Editar</th>
                    </tr>

                    <%while (rsd.next()) {%>
                    <tr align="left">
                        <td><%=rsd.getString("codigo")%></td>
                        <td colspan="3" ><%=rsd.getString("descripcion")%></td>
                        <td><%=rsd.getString("cantidad")%></td>
                        <td><%=rsd.getString("unidMedida")%></td>
                        <td><%=rsd.getString("pesoTotal")%></td>
                        <td>
                            <a href="#" onclick="edit('detalleGuia_edit_fm.jsp?idGuia=<%=rsd.getString("idGuia")%>&idDetalleGuia=<%=rsd.getString("idDetalleGuia")%>')">
                                <button type="button">Editar</button>
                            </a>
                        </td>
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
                        <td colspan="2" >
                            <input name="txtTotPesoTot" type="text"  value="<%=rs.getString("totPesoTot")%>" size="10" />
                        </td>
                    </tr>

                    <tr>
                        <th colspan="8"><div> Estado:
                                <label>

                                    <select name="txtEstado">
                                        <option>
                                            <%=rs.getString("estado")%>
                                        </option>
                                        <option>CORRECTO</option>
                                        <option>ANULADO</option>
                                    </select>
                                </label>
                            </div></th>
                    </tr>
                    <tr>
                        <th colspan="2">Datos de la Unidad de Transporte </th>
                        <th colspan="6">Datos de la Empresa Sub Contratada </th>
                    </tr>
                    <tr>
                        <th colspan="2" valign="top" ><span>Tracto</span>&nbsp;



                            <%
                                String valor = request.getParameter("valor");
                                consulta = "select c.idcliente,t.placa,t.marca,t.idtracto "
                                        + "from cliente c "
                                        + "inner join tracto t "
                                        + "on c.idcliente=t.idcliente "
                                        + "where c.idcliente=?";
                                PreparedStatement pst = conex.prepareStatement(consulta);
                                pst.setString(1, rs.getString("datosTransportista"));
                                ResultSet rst = pst.executeQuery();
                            %>
                            <div id="tracto">

                                <div id="rtrac">
                                    <select name="txtIdTracto" id="trac" onchange="llamarDatosTracto()">
                                        <%
                                            consulta = "select*from tracto where idtracto=?";
                                            PreparedStatement pst2 = conex.prepareStatement(consulta);
                                            pst2.setString(1, rs.getString("idtracto"));
                                            ResultSet rst2 = pst2.executeQuery();
                                            while (rst2.next()) {
                                        %>
                                        <option value="<%=rst2.getString("idtracto")%>">
                                            <%=rst2.getString("placa")%>
                                        </option>
                                        <%}%>
                                        <%while (rst.next()) {%>
                                        <option value="<%=rst.getString("idtracto")%>">
                                            <%=rst.getString("placa")%>
                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                            </div>

                            <br>
                            <label>Rampla</label><br>
                            <%
                                consulta = "select * from ramplas where idrampla;";
                                PreparedStatement psr = conex.prepareStatement(consulta);
                                ResultSet rsram = psr.executeQuery();
                            %>
                            <div id="rram">
                                <select id="rampla" name="txtIdRampla" onchange="llamarDatosRampla()">
                                    <%
                                        consulta = "select*from ramplas where idrampla=?";
                                        PreparedStatement psr1 = conex.prepareStatement(consulta);
                                        psr1.setString(1, rs.getString("idrampla"));
                                        ResultSet rsr1 = psr1.executeQuery();
                                        while (rsr1.next()) {
                                    %>
                                    <option value="<%=rs.getString("idrampla")%>">
                                        <%=rsr1.getString("placa")%>
                                    </option>
                                    <%}%>

                                    <% while (rsram.next()) {%>
                                    <option value="<%=rsram.getString("idrampla")%>">
                                        <%=rsram.getString("placa")%>
                                    </option>
                                    <%}%>
                                    <option value="">
                                        Sin Rampla
                                    </option>
                                </select>
                            </div>

                            <div>
                                <a href="rampla_list.jsp" target="../" title="Busca Ramplas(Puedes buscar y actualizar los campos de las ramplas que te convenga)">
                                    <img alt="" src="../imagenes/icons/search.png" height="25" width="25"/>
                                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="rampla_add_fm.jsp" target="../" title="Insertar Ramplas(Redirecciona directamente a un formulario que te permitira ingresar una nueva Rampla)">
                                    <img alt="" src="../imagenes/icons/add.png" height="25" width="25"/>
                                </a>&nbsp;
                                <button title="Refrescar(Luego de haber actualizado o ingresado una nueva Rampla, presione este boton para asegurarse que los cambios se han realizado en la Guia de Remisión)" onclick="llamarRefreshRamplaGuia()" type="button" style="background-color: #60c8f2;border: 0px;">
                                    <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25"/>
                                </button>                                    
                            </div>

                            <div id="ram">
                                <br>
                                <label>Nro de Constancia Rampla</label>
                                <br>
                                <%
                                    consulta = "select*from ramplas where idrampla=?";
                                    PreparedStatement psrc = conex.prepareStatement(consulta);
                                    psrc.setString(1, rs.getString("idrampla"));
                                    ResultSet rsrc = psrc.executeQuery();
                                    while (rsrc.next()) {
                                %>
                                <input type="text" value="<%=rsrc.getString("nroconstancia")%>">
                                <%}%>
                            </div>

                            <div id="tra">
                                <br>
                                <%
                                    consulta = "select*from tracto where idtracto=?";
                                    PreparedStatement pst1 = conex.prepareStatement(consulta);
                                    pst1.setString(1, rs.getString("idtracto"));
                                    ResultSet rst1 = pst1.executeQuery();
                                %>
                                <%while (rst1.next()) {%>
                                Marca Tracto<br>
                                <input type="text" value="<%=rst1.getString("marca")%>" size="22"><br><br>
                                Nro de Constancia Tracto<br>
                                <input type="text" value="<%=rst1.getString("nroconstancia")%>" size="22"><br><br>
                                Configuraci&oacute;n Tracto<br>
                                <input type="text" value="<%=rst1.getString("configuracion")%>" size="22"><br>
                                <%}%>
                            </div>

                            <br>
                            <span>Chofer</span><br>
                            <%
                                consulta = "SELECT* from conductor where estado='1';";
                                PreparedStatement psco = conex.prepareStatement(consulta);
                                ResultSet rsco = psco.executeQuery();
                            %>

                            <select name="txtIdConductor" id="conductor_lic" onclick="llamarLicencia()">
                                <%
                                    consulta = "select*from conductor where idconductor=?";
                                    PreparedStatement psco1 = conex.prepareStatement(consulta);
                                    psco1.setString(1, rs.getString("idconductor"));
                                    ResultSet rsco1 = psco1.executeQuery();
                                    while (rsco1.next()) {
                                %>
                                <option value="<%=rs.getString("idconductor")%>">
                                    <%=rsco1.getString("nombreconductor")%>
                                    <%=rsco1.getString("apellidopconductor")%>
                                    <%=rsco1.getString("apellidomconductor")%>
                                </option>
                                <%}%>
                                <%while (rsco.next()) {%>
                                <option value="<%=rsco.getString("idconductor")%>">
                                    <%=rsco.getString("nombreconductor")%>&nbsp;
                                    <%=rsco.getString("apellidopconductor")%>&nbsp;
                                    <%=rsco.getString("apellidomconductor")%>
                                </option>
                                <%}%>
                            </select>
                            <br>

                            <div id="lic">
                                <br>
                                <label>Licencia</label><br>
                                <%
                                    consulta = "select licenciaconductor from conductor where idconductor=?";
                                    PreparedStatement psli = conex.prepareStatement(consulta);
                                    psli.setString(1, rs.getString("idconductor"));
                                    ResultSet rsli = psli.executeQuery();
                                    while (rsli.next()) {
                                %>
                                <input type="text" value="<%=rsli.getString("licenciaconductor")%>">
                                <%}%>
                            </div>

                        </th>
                        <th colspan="6" valign="top"  ><p>Razon Social</p>
                            <p>
                                <label>
                                    <%
                                        consulta = "select idCliente,razonSocial from Cliente where estado='1';";
                                        PreparedStatement psdt = conex.prepareStatement(consulta);
                                        ResultSet rsdt = psdt.executeQuery();
                                    %>
                                    <select  name="txtDatosTransportista" id="cliente" onchange="recogerDatosGuia()">
                                        <%
                                            consulta = "select*from cliente where idCliente=?";
                                            PreparedStatement psdc = conex.prepareStatement(consulta);
                                            psdc.setString(1, rs.getString("datosTransportista"));
                                            ResultSet rsdc = psdc.executeQuery();
                                            while (rsdc.next()) {
                                        %>
                                        <option value="<%=rs.getString("datosTransportista")%>">
                                            <%=rsdc.getString("razonSocial")%>
                                        </option>
                                        <%}%>

                                        <%while (rsdt.next()) {%>
                                        <option value="<%=rsdt.getString("idCliente")%>">
                                            <%=rsdt.getString("razonSocial")%>
                                        </option>
                                        <%}%>
                                    </select>
                                    <div id="datosTrans">
                                        <%
                                            consulta = "select c.ruc,c.departamento,c.pais,d.direccion"
                                                    + " from cliente c "
                                                    + "inner join detalleCliente d "
                                                    + "on c.idCliente=d.idCliente "
                                                    + "where c.idcliente=?";
                                            PreparedStatement psdt1 = conex.prepareStatement(consulta);
                                            psdt1.setString(1, rs.getString("datosTransportista"));
                                            ResultSet rsdt1 = psdt1.executeQuery();
                                            while (rsdt1.next()) {
                                        %>
                                        <label>Direccion</label><br>
                                        <input type="text" value="<%=rsdt1.getString("direccion")%>" size="60"><br><br>
                                        <label>Ciudad-Pais</label><br>
                                        <input type="text" value="<%=rsdt1.getString("departamento")%>-<%=rsdt1.getString("pais")%>"><br><br>
                                        <label>RUC</label><br>
                                        <input type="text" value="<%=rsdt1.getString("ruc")%>"><br>
                                        <%}%>
                                    </div>
                                </label>
                            </p>

                        </th>
                    </tr>
                    <tr>
                        <th colspan="1" class="rounded-foot-left"></th>
                        <th colspan="7" class="rounded-foot-right">
                            <div align="right">
                                <input name="btnVenta" type="submit"  value="Actualizar"/>
                            </div>
                        </th>
                    </tr>
                </table>
                <%}%>
                <input type="hidden" name="accion" value="actualizar"/>
                <input type="hidden" name="idGuia" value="<%=rs.getString("idGuia")%>"/>
                <%conex.close();%>
            </form>
        </div>
    </body>
</html>
