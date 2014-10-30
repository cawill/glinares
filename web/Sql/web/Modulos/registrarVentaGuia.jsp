<%@include file="conexion.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gl.modelo.*" %>
<%@page import="java.util.*" %>
<%@page import="utils.*"%>
<%@include file="session_verifica.jsp" %>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%
    Redondear red = new Redondear();
    FechaSistema fecha = new FechaSistema();
    ConvertSLL num = new ConvertSLL();
    NumeroFactura nf = new NumeroFactura();

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script language="javascript" type="text/javascript" src="../Js/AjaxForFactura.js"></script>
        <script language="javascript" type="text/javascript" src="../Js/AjaxForGuia.js"></script>
        <script type="text/javascript">

            nuevoG=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"anadirCarritoGuia.jsp",
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");
                    }
                });

            }
        </script>


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
            &nbsp;<a href="registrarVentaGuia.jsp" title="Nueva Guia de Remision"><img alt="" src="../imagenes/icons/add.png" height="55" width="60"/></a>&nbsp;&nbsp;
            &nbsp;<a href="detalleGuia_list.jsp" title="Buscar Guias de Remision"><img alt="" src="../imagenes/icons/search.png" style="margin-bottom: -3px" height="55" width="60"/></a>&nbsp;&nbsp;
            &nbsp;<a href="#" onclick="nuevoG()" title="Agregar"><img alt="" src="../imagenes/icons/Add.gif" height="55" width="60"/></a>
        </div>
        <br>

        <div  id="contenedor" style="display:none" ></div>

        <div>
            <form method="post" action="Controlador" name="form1" id="form1">
                <input type="hidden" name="accion" value="RegistrarVentaGuia" />
                <div align="center">
                    <table id="rounded-corner-comp">
                        <tr>
                            <th colspan="1" class="rounded-company"></th>
                            <th colspan="4" align="right" style="padding: 7px">
                                GUIA DE REMISION
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;         
                            </th>
                            <th align="right" colspan="1" >
                                Usuario:
                            </th>
                            <th colspan="1" class="rounded-q4">
                                <input type="text" name="txtLogin" readonly value="<%=session_login%>"/>           
                            </th>
                        </tr>
                        <tr>
                            <th height="26" colspan="3" >
                                <div align="right">
                                    <span >Serie</span>
                                    <input name="txtSerie" value="001"type="text" size="5" maxlength="3">
                                </div>
                            </th>
                            <th colspan="4" ><span >N°</span>
                                <label>
                                    <%
                                        consulta = "SELECT LAST_INSERT_ID(nroGuia) +1 "
                                                + "AS ProximoIdAInsertar "
                                                + "FROM guia_remision "
                                                + "ORDER BY nroGuia "
                                                + "DESC LIMIT 1";
                                        ps = conex.prepareStatement(consulta);
                                        rs = ps.executeQuery();
                                        if (rs.next()) {
                                    %>
                                    <input name="txtNroGuia" value="<%=nf.customFormat("000000", rs.getInt("ProximoIdAInsertar"))%>"type="text" size="7" maxlength="7">
                                    <%} else {%>
                                    <input name="txtNroGuia" value="<%=nf.customFormat("000000", 1)%>"type="text" size="7" maxlength="7">
                                    <%}%>
                                </label>
                            </th>
                        </tr>
                        <tr>
                            <th height="20" colspan="2" ><div align="center"><span >Punto de Partida </span></div></th>
                            <th colspan="5" ><div align="center"><span >Punto de Llegada </span></div></th>
                        </tr>
                        <tr>
                            <td height="20" colspan="2" ><textarea name="txtPuntoPartida"  cols="45" rows="4" id="txtPuntoPartida" onChange="javascript:this.value=this.value.toUpperCase();"></textarea></td>
                            <td colspan="5" ><textarea name="txtPuntoLlegada"  cols="45" rows="4" id="textarea" onChange="javascript:this.value=this.value.toUpperCase();" ></textarea></td>
                        </tr>
                        <tr>
                            <th height="20" colspan="2" ><span >Ciudad/Pais</span></th>
                            <th colspan="5" ><span >Ciudad/Pais</span></th>
                        </tr>
                        <tr>
                            <td height="20" colspan="2" >
                                <%
                                    consulta = "SELECT CONCAT(ciudad,'   ' ,' -','   ',pais) "
                                            + "AS ubicacion, idPais FROM pais where idpais";
                                    PreparedStatement psp = conex.prepareStatement(consulta);
                                    ResultSet rsp = psp.executeQuery();
                                %>
                                <select name="txtIdpais"  >
                                    <option value="">Selecione Ciudad/Pais</option>
                                    <%while (rsp.next()) {%>
                                    <option value="<%=rsp.getString("idPais")%>">
                                        <%=rsp.getString("ubicacion")%>
                                    </option>
                                    <%}%>
                                </select>
                            </td>
                            <td colspan="5" >
                                <%
                                    consulta = "SELECT CONCAT(ciudad,'   ' ,' -','   ',pais) "
                                            + "AS ubicacion, idPais FROM pais where idpais";
                                    PreparedStatement pspd = conex.prepareStatement(consulta);
                                    ResultSet rspd = pspd.executeQuery();
                                %>
                                <select name="txtCiudadA"  >
                                    <option value="">Selecione Ciudad/Pais</option>
                                    <%while (rspd.next()) {%>
                                    <option value="<%=rspd.getString("idPais")%>">
                                        <%=rspd.getString("ubicacion")%>
                                    </option>
                                    <%}%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th  height="20" colspan="2" ><div align="center"><span >Nombre o Razon Social del Remitente </span></div></th>
                            <th colspan="5" ><div align="center"><span >Nombre o Razon Social del Destinatario</span></div></th>
                        </tr>
                        <tr>
                            <td height="20" colspan="2" >
                                <label>
                                    <%
                                        consulta = "select idCliente,razonSocial from cliente where estado='1'";
                                        PreparedStatement pscli = conex.prepareStatement(consulta);
                                        ResultSet rscli = pscli.executeQuery();
                                    %>
                                    <div id="clg"> 
                                        <select name="txtIdCliente" >
                                            <option selected value="">Seleccione Razon Social</option>
                                            <%while (rscli.next()) {%>
                                            <option value="<%=rscli.getString("idCliente")%>">
                                                <%=rscli.getString("razonSocial")%>
                                            </option>
                                            <%}%>
                                        </select>               
                                    </div>
                                    <br>
                                    <div>
                                        <a href="cliente_list.jsp" target="../" title="Busca Clientes, su direccion y sus demas datos(Puedes buscar y actualizar los campos del cliente o razon social que te convenga)">
                                            <img alt="" src="../imagenes/icons/search.png" height="25" width="25"/>
                                        </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="cliente_add_fm.jsp" target="../" title="Insertar Cliente(Redirecciona directamente a un formulario que te permitira ingresar un nuevo cliente)">
                                            <img alt="" src="../imagenes/icons/add.png" height="25" width="25"/>
                                        </a>&nbsp;
                                        <button title="Refrescar(Luego de haber actualizado o ingresado un nuevo cliente, presione este boton para asegurarse que los cambios se han realizado en la Guia de Remisión)" onclick="llamarRefreshClienteGuia()" type="button" style="background-color: #ecf8fd;border: 0px;">
                                            <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25"/>
                                        </button>                                    
                                    </div>
                                </label>
                            </td>
                            <td colspan="5" >
                                <label>
                                    <%
                                        consulta = "select idCliente,razonSocial from cliente where estado='1'";
                                        PreparedStatement psclid = conex.prepareStatement(consulta);
                                        ResultSet rsclid = psclid.executeQuery();
                                    %>
                                    <div id="clg_d">
                                        <select name="txtrSocialDestinatario" >
                                            <option value="">Seleccione Razon Social</option>
                                            <%while (rsclid.next()) {%>
                                            <option value="<%=rsclid.getString("idCliente")%>">
                                                <%=rsclid.getString("razonSocial")%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </div>
                                    <br>
                                    <div>
                                        <a href="cliente_list.jsp" target="../" title="Busca Clientes, su direccion y sus demas datos(Puedes buscar y actualizar los campos del cliente o razon social que te convenga)">
                                            <img alt="" src="../imagenes/icons/search.png" height="25" width="25"/>
                                        </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="cliente_add_fm.jsp" target="../" title="Insertar Cliente(Redirecciona directamente a un formulario que te permitira ingresar un nuevo cliente)">
                                            <img alt="" src="../imagenes/icons/add.png" height="25" width="25"/>
                                        </a>&nbsp;
                                        <button title="Refrescar(Luego de haber actualizado o ingresado un nuevo cliente, presione este boton para asegurarse que los cambios se han realizado en la Guia de Remisión)" onclick="llamarRefreshClienteGuiad()" type="button" style="background-color: #ecf8fd;border: 0px;">
                                            <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25"/>
                                        </button>                                    
                                    </div>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <th height="20" colspan="2" >
                                <label><div align="center" >Fecha de Inicio de Traslado </div></label>
                            </th>
                            <th colspan="5" >
                                <div align="center" >Costo Minimo U$S </div>
                            </th>
                        </tr>
                        <tr>
                            <th width="59" >
                                <div align="right"><span >Fecha</span></div>
                            </th>
                            <th width="295" >
                                <label><input name="txtFechaTraslado" id="txtFechaTraslado" value="<%=fecha.fecha()%>" type="text" ></label>
                            </th>
                            <th colspan="3" >
                                <label><div align="right"><span >Costo</span></div></label>
                            </th>
                            <th colspan="3" ><input name="txtCostoMinimo" type="text" value="" placeholder="Costo min." maxlength="10"></th>
                        </tr>
                        <tr>
                            <th><div align="center" >Codigo</div></th>
                            <th colspan="3" ><div align="center" >Descripcion</div></th>
                            <th width="98"  ><div align="center">Cantidad</div></th>
                            <th width="98"  ><div align="center">Unidad de Medida</div></th>
                            <th width="96" ><div align="center"><span >Peso Total</span> </div></th>
                        </tr>
                        <%-- Los productos que tenemos en la sesion que se llama carrito --%>
                        <%
                            try {
                                ArrayList<DetalleGuia> lista = (ArrayList<DetalleGuia>) session.getAttribute("carritoGuia");

                                double cantidad = 0;
                                double pesoTotal = 0;
                                if (lista != null) {
                                    for (DetalleGuia d : lista) {
                        %>
                        <tr>
                            <td><div align="right"><span ><%=d.getCodigo()%></span></div></td>
                            <td colspan="3" ><span ><%=d.getDescripcion().toUpperCase()%></span></td>
                            <td>
                                <%
                                    if (d.getCantidad() == 0.0) {
                                        out.print("");
                                    } else {
                                        out.print(d.getCantidad());
                                    }
                                %>
                            </td>
                            <td><%=d.getUnidMedida().toUpperCase()%></td>
                            <td>
                                <%
                                    if (d.getPesoTotal() == 0.0) {
                                        out.print("");
                                    } else {
                                        out.print(d.getPesoTotal());
                                    }
                                %>
                            </td>
                        </tr>

                        <%
                                    cantidad = cantidad + d.getCantidad();
                                    pesoTotal = pesoTotal + d.getPesoTotal();
                                }
                            }
                        %>

                        <tr>
                            <td colspan="4"align="right" >&nbsp;<label >TOTALES:</label></td>
                            <td align="left" >
                                <input name="txtTotCantidad" value="<%=cantidad%>" type="text" size="10" maxlength="10">
                            </td>
                            <td align="left" >

                                <input name="txtTotBulto" value="" type="text" id="txtTotBulto" size="10" maxlength="10" placeholder="Unid. Medida" required>
                            </td>
                            <td colspan="1" align="left" >
                                <input name="txtTotPesoTot" type="text"  value="<%=pesoTotal%>" size="10" maxlength="10"/>
                            </td>
                        </tr>
                        <%} catch (Exception e) {
                            e.printStackTrace();
                        }%>
                        <tr>
                            <th colspan="8"><div> <span >Estado:</span>
                                    <label>
                                        <select name="txtEstado" >
                                            <option value="">Seleccione Estado</option>
                                            <option value="CORRECTO">CORRECTO</option>
                                            <option value="ANULADO">ANULADO</option>

                                        </select>
                                    </label>
                                </div></th>
                        </tr>
                        <tr>
                            <th colspan="2"   >Datos de la Unidad de Transporte </th>
                            <th colspan="6"   >Datos de la Empresa Sub Contratada </th>
                        </tr>
                        <tr>
                            <th colspan="2" valign="top" ><span>Tracto</span>&nbsp;
                                <div id="tracto">
                                    <select name="txtIdTracto" disabled>
                                        <option value="">Seleccione Tracto</option>
                                    </select>
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
                                        <option value="">Seleccione Rampla</option>
                                        <% while(rsram.next()){ %>
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
                                            
                                        </div>

                                <div id="tra">

                                </div>

                                <br>
                                <span>Chofer</span>&nbsp;
                                <div id="conductor">
                                    <input name="txtIdConductor" type="text" value="conductor..." disabled>
                                </div>
                                <br>
                                <div id="lic">

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
                                            <option value="">Seleccione Razon Social</option>
                                            <%while (rsdt.next()) {%>
                                            <option value="<%=rsdt.getString("idcliente")%>">
                                                <%=rsdt.getString("razonSocial")%>
                                            </option>
                                            <%}%>
                                        </select>
                                        <div id="datosTrans">

                                        </div>
                                    </label>
                                </p>

                            </th>
                        </tr>
                        <tr>
                            <th colspan="1" class="rounded-foot-left"></th>
                            <th colspan="6" class="rounded-foot-right">
                                <div align="right" >
                                    <input name="btnVenta" type="submit"  value="Registrar Venta" onclick="return confirm('¿Desea concluir la Guia de Remisión?')" />
                                </div>
                            </th>
                        </tr>
                    </table>
                </div>
                <%conex.close();%>
            </form>
        </div>
    </body>

    <br><br><br><br><br><br>
    <br><br><br><br><br><br>
    <br><br><br><br><br><br>
    <br><br><br><br><br><br>

</html>
