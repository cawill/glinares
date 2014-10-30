<%@include file="conexion.jsp" %>
<%@page import="utils.*"%>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%
    Redondear red = new Redondear();
    FechaSistema fecha = new FechaSistema();
    ConvertSLL num = new ConvertSLL();
    NumeroFactura nf = new NumeroFactura();

%>
<%
    String idBoleta = "";
    String fechaNum = "";
    String cliente = "";
    String direccion = "";
    String ruc = "";
    String serie = "";
    String numero = "";
    String total = "";
    String son = "";
    String fechaL = "";
    String estado = "";
    String fechaCl = "";
    String descBoleta = "";
    String moneda = "";
    String monedaletra = "";
    String idCliente = "";

    try {
        consulta = "select b.idboleta,b.fechaelaboleta,c.razonSocial,c.ruc,b.serieboleta,"
                + "b.numboleta,b.total,b.son,b.fechaLetras,b.estado,b.fechaCancelLetras,"
                + "d.direccion,b.descripcionboleta, b.moneda ,b.monedaletra,b.idCliente "
                + "from boleta b "
                + "inner join cliente c "
                + "inner join detalleCliente d "
                + "on c.idCliente=b.idCliente "
                + "and c.idCliente=d.idCliente "
                + "where b.idboleta=?";
        ps = conex.prepareStatement(consulta);
        ps.setString(1, request.getParameter("idboleta"));
        rs = ps.executeQuery();

        while (rs.next()) {
            idBoleta = rs.getString("idboleta");
            fechaNum = rs.getString("fechaelaboleta");
            cliente = rs.getString("razonSocial");
            direccion = rs.getString("direccion");
            ruc = rs.getString("ruc");
            serie = rs.getString("serieboleta");
            numero = rs.getString("numboleta");
            total = rs.getString("total");
            son = rs.getString("son");
            fechaL = rs.getString("fechaLetras");
            estado = rs.getString("estado");
            fechaCl = rs.getString("fechaCancelLetras");
            descBoleta = rs.getString("descripcionboleta");
            moneda = rs.getString("moneda");
            monedaletra = rs.getString("monedaletra");
            idCliente = rs.getString("idCliente");
        }

    } catch (Exception e) {
        out.print("Error: " + e.getMessage());
    }
%>
<%

    consulta = "select d.idboleta,d.cantidad,d.descripcion,d.importe, "
            + "d.idDetalleBoleta "
            + "from detalleBoleta d inner join boleta b "
            + "on d.idboleta=b.idboleta where b.idboleta=? ORDER BY d.idDetalleBoleta";
    PreparedStatement psd = conex.prepareStatement(consulta);
    psd.setString(1, request.getParameter("idboleta"));
    ResultSet rsd = psd.executeQuery();

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
        <style type="text/css">

        </style>
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script language="javascript" type="text/javascript" src="../Js/AjaxForFactura.js"></script>
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

    </head>
    <body>
        <div align="center" >
            <h3 >BOLETA DE VENTA</h3>
            &nbsp;<a href="registrarVentaBoleta.jsp" title="Nueva Boleta de Venta"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
                <%--            &nbsp;<a href="boleta_list.jsp" title="Listar Boleta"><img alt="" src="../imagenes/icons/gastos.png" height="40" width="40"/></a>&nbsp; --%>
            &nbsp;<a href="detalleBoleta_list.jsp" title="Buscar Boletas"><img alt="" style="margin-bottom: -3px" src="../imagenes/icons/search.png" height="40" width="40"/></a>&nbsp;
            <br><br>

        </div>
        <br>
        <div align="center">

            <br>
            <div class="style1" id="contenedor" style="display:none" ></div>
            <form action="boleta_save.jsp" method="post">
                <table width="650" id="rounded-corner-comp">
                    <tr>
                        <th colspan="2" class="rounded-company"></th>
                        <th colspan="3" style="padding: 7px">
                            <div align="left">BOLETA DE VENTA</div>                        
                        </th>
                        <th colspan="2" class="rounded-q4"></th>
                    </tr>
                    <tr>
                        <th align="right" height="26" colspan="2">&nbsp;</th>
                        <th width="120">&nbsp;</th>
                        <th colspan="2">
                            <div align="right" >
                                Serie:
                                <input name="txtSerieBoleta" type="text"  value="001" size="3">
                            </div>                      
                        </th>
                        <th width="119" colspan="2">
                            <div align="center" >
                                <div align="left">N<b>°</b>
                                    <input type="text" name="txtNumBoleta"size="6" value="<%=numero%>"/>
                                </div>
                            </div>                        
                        </th>
                    </tr>
                    <tr>
                        <th width="44" ><div align="center" >
                                <div align="right">Cliente:</div>
                            </div>                        </th>
                        <th width="219" ><div align="left" >
                                <div>
                                    <select id="cliente" name="txtIdCliente" onchange="recogerDirAndRuc()">
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
                                </div>
                            </div>                        
                        </th>
                        <th colspan="5">
                            Fecha:
                            <input name="txtFechaLetras" type="text" size="1" value="<%=fechaL%>" hidden/>                        <input name="txtFechaBoleta" type="text"  value="<%=fechaNum%>"></th>
                    </tr>
                    <tr>
                        <th>
                            <div align="center">
                                Direccion:                            
                            </div>                        
                        </th>

                        <th>
                            <div id="dir">
                                <input type="text" size="41" value="<%=direccion%>" disabled/>                        
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
                        <th colspan="7" align="center"><input type="submit" value="Actualizar"/></th>
                    </tr>
                    <tr>
                        <th><div align="center" >Cant.</div></th>
                        <th colspan="3"><div align="center" >Descripcion</div></th>
                        <th width="119"><div align="center" >P. Unit. </div></th>
                        <th><div align="center" >Total</div></th>
                        <th>Editar</td>                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="3"><textarea name="txtDescripcionBoleta" cols="44" rows="1"><%=descBoleta%></textarea></td>
                        <td colspan="1"></td>
                        <td colspan="1"></td>
                        <td></td>
                    </tr>
                    <%
                        try {
                            while (rsd.next()) {
                    %>
                    <tr>
                        <td><%=rsd.getString("cantidad")%></td>
                        <td colspan="3" ><%=rsd.getString("descripcion")%></td>
                        <td>&nbsp;</td>
                        <td><%=rsd.getString("importe")%></td>
                        <td><a href="#" onclick="edit('detalleBoleta_edit_fm.jsp?accion=edit&idDetalleBoleta=<%=rsd.getString("idDetalleBoleta")%>&idboleta=<%=rsd.getString("idboleta")%>')"><button type="button">Editar</button></a></td>
                    </tr>
                    <%}
                        } catch (Exception e) {
                            out.print("Error : " + e.getMessage());
                        }%>
                    <tr>
                        <td colspan="5"align="right" >   
                            <input name="txtMoneda" value="<%=moneda%>"type="text" size="5" maxlength="5">                     
                            Total</td>
                        <td colspan="1" align="right" >
                            <div align="left" >
                                <input name="txtTotal" type="text"  value="<%=total%>" size="10" maxlength="10"/>
                            </div>                        
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th colspan="7">
                            <div align="left" >Son:
                                <input name="txtSon" type="text"  value="<%=son%>" size="80" maxlength="100">
                                &nbsp;&nbsp; <input name="txtMonedaletra" type="text" value="<%=monedaletra%>" size="20" maxlength="20">
                            </div>                        
                        </th>
                    </tr>
                    <tr>
                        <th colspan="2">
                            Estado:
                            <input type="text" name="txtEstado" value="<%=estado%>">                        
                        </th>
                        <th colspan="5">
                            <input name="txtFechaCancelLetras" value="<%=fechaCl%>" type="text"  size="62">                        </th>
                    </tr>
                    <tr>
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="5" class="rounded-foot-right">
                            <div align="left">
                                <input type="submit" value="Actualizar"/>
                            </div>                        
                        </th>
                    </tr>
                </table>
                <input type="hidden" name="accion" value="edit"/>
                <input type="hidden" name="idboleta" value="<%=idBoleta%>"/>
            </form>
        </div>
        <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
        <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
        <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
        <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
        <%conex.close();%>
    </body>
</html>
