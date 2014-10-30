<%@include file="session_verifica.jsp" %>
<%@include file="conexion.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gl.modelo.*" %>
<%@page import="com.gl.controlador.FacturaController" %>
<%@page import="java.util.*" %>
<%@page import="utils.*"%>


<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    consulta = "select*from impuestogeneralventas;";
    PreparedStatement psigv = conex.prepareStatement(consulta);
    ResultSet rsigv = psigv.executeQuery();
%>

<%
    consulta = "SELECT ruc FROM cliente WHERE ruc=?; ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("ruc"));
    ResultSet rs77 = ps.executeQuery();
%>

<%
    FacturaController c = new FacturaController();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <%--        --%>


        <%--          --%>
        <script type="text/javascript" src="../Js/jquery.min.js"></script>
        <script type="text/javascript"  src="../Js/vanadium.js"></script>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script language="javascript" type="text/javascript" src="../Js/AjaxForFactura.js"></script>
        <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"anadirCarrito.jsp",
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedor').html(msj);
                        $('#contenedor').toggle("normal");
                    }
                });

            }


            nuevoIgv=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"factura_prepare_fm.jsp",
                    data:d,
                    success:function(msj)
                    {
                        $('#contenedorIgv').html(msj);
                        $('#contenedorIgv').toggle("normal");
                    }
                });

            }
        </script>

        <script src="../Js/datapicker/jquery.tools.min.js"></script>
        <script>
            $( function() {
                if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
                    $("#txtFechaFactura").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#form1").validator();
                }
            } );
        </script>
        <link rel="stylesheet" type="text/css" href="../Js/datapicker/skin1.css" />
        <style type="text/css">
<!--
.style4 {color: #000000; font-weight: bold; }
.style5 {font-style: italic}
.style6 {color: #000000; font-weight: bold; font-style: italic; }
-->
        </style>
</head>
    <body>



    <div align="center" >
            <h3 >FACTURA</h3>
        &nbsp;
            <p><a href="registrarVenta.jsp" title="Nueva Factura"><img alt="" src="../imagenes/icons/add.png" height="40" width="40"/></a>&nbsp;
              &nbsp;<a href="detalleFactura_list.jsp" title="Buscar Facturas"><img alt="" src="../imagenes/icons/search.png" style="margin-bottom: -3px" height="40" width="40"/></a>&nbsp;
              &nbsp;<a href="#" onclick="nuevo();" title="Agregar"><img alt="" src="../imagenes/icons/Add.gif" height="40" width="40"/></a>&nbsp;
              &nbsp;<a href="#" onclick="nuevoIgv();" title="Cambiar IGV"><img alt="" src="../imagenes/icons/actualizar.png" style="margin-bottom: 7px" height="40" width="40"/></a>
                </p>
        </div>

        <br>
        
        <div>
            <%if (rs77.next()) {%>
            <input type="text" name="ruc" value="<%=rs77.getString("ruc")%>" />
            <%}%>
        </div>

        <div  id="contenedorIgv" style="display:none" ></div>
        <div  id="contenedor" style="display:none" ></div>

        <div>
            <div align="center">
                <form method="post" action="Controlador" name="form1" id="form1" >

                    <%-- Llamamos a la accion Registrar Venta --%>
                    <input type="hidden" name="accion" value="RegistrarVenta" />
                    <table id="rounded-corner-comp" align="center">
                        <tr>
                            <th colspan="1" class="rounded-company"></th>
                            <th style="padding: 7px;" colspan="2">
                                <div  align="center" style="font-size: 13px;margin-right: -135px">
                                    <b> FACTURA</b>                                </div>                            </th>
                            <th colspan="2" align="right">Usuario:</th>
                            <th colspan="2" class="rounded-q4">
                                <div align="left">
                                    <input type="text" name="txtLogin" value="<%=session_login%>" readonly/>
                                </div>                            </th>
                        </tr>
                        <tr>
                            <th  height="26" colspan="2" >&nbsp;</th>
                            <th  width="120">                            </th>
                            <th  colspan="2" >
                                <div align="right" >
                                    Serie:
                                    <input name="txtSerieFactura" type="text"  value="001" size="3">
                                </div>                      </td>
                            <th  width="119" colspan="1" >
                                <%
                                    consulta = "SELECT LAST_INSERT_ID(numFactura) +1 "
                                            + "AS ProximoIdAInsertar "
                                            + "FROM factura "
                                            + "ORDER BY numFactura "
                                            + "DESC LIMIT 1";
                                    PreparedStatement psn = conex.prepareStatement(consulta);
                                    ResultSet rsn = psn.executeQuery();
                                %>
                                <div align="center" >
                                    <div align="left">N<b>°</b>
                                        <%if (rsn.next()) {%>
                                        <input name="txtNumFactura" type="text"  size="4" value="<%=c.nf().customFormat("000000", rsn.getInt("ProximoIdAInsertar"))%>">
                                        <%} else {%>
                                        <input type="text" name="txtNumFactura" size="6" value="<%=c.nf().customFormat("000000", 1)%>">
                                        <%}%>
                                    </div>
                                </div>
                            </td>                        </tr>
                        <tr>
                            <th  width="44" height="101" >
                                <div align="right" style="margin-top: 26px">Cliente:</div>                            </th>
                            <th  width="219" >
                                <div>
                                    <a href="cliente_list.jsp" target="../" title="Busca Clientes, su direccion y sus demas datos(Puedes buscar y actualizar los campos del cliente o razon social que te convenga)">
                                        <img alt="" src="../imagenes/icons/search.png" height="25" width="25"/>                                    </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <a href="cliente_add_fm.jsp" target="../" title="Insertar Cliente(Redirecciona directamente a un formulario que te permitira ingresar un nuevo cliente)">
                                        <img alt="" src="../imagenes/icons/add.png" height="25" width="25"/>                                    </a>&nbsp;
                                    <button title="Refrescar(Luego de haber actualizado o ingresado un nuevo cliente, presione este boton para asegurarse que los cambios se han realizado en este Registro de Factura)" onclick="llamarRefreshCliente()" type="button" style="background-color: #60c8f2;border: 0px;">
                                        <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25"/>                                    </button>                                    
                                </div>                              
                                <div align="left" >
                                    <%
                                        consulta = "select*from cliente where estado='1' order by razonsocial asc";
                                        ps = conex.prepareStatement(consulta);
                                        rs = ps.executeQuery();
                                    %>
                                    <div id="cli">
                                        <select id="cliente" name="txtIdCliente"  onchange="recogerDirAndRuc()">
                                            <option value="">---------------Seleccione Cliente---------------</option>
                                            <%while (rs.next()) {%>
                                            <option value="<%=rs.getString("idCliente")%>">
                                                <%=rs.getString("razonSocial")%>                                            </option>
                                                <%}%>
                                        </select>
                                    </div>
                                </div>                            </th>
                            <th  colspan="5">
                                <label>Fecha:</label>
                                <input name="txtFechaLetras" type="text" size="2" value="Tacna, <%=c.fs().diaEnNumeros()%> de <%=c.fs().mesEnLetras()%> del <%=c.fs().anioEnNumeros(c.fs().fecha())%>" hidden>
                                <input type="month" name="txtFechaFactura" id="txtFechaFactura" placeholder="dia-mes-año" value="<%=c.fs().fecha()%>">
                                <p>Guias: 
                                    <input name="txtGuias" type="text" size="30" maxlength="17" >
                                </p>                            </th>
                        </tr>
                        <tr>
                            <th><div align="right" >
                                    <label>
                                        Direccion:                                    </label>
                                </div></th>

                            <th>
                                <div id="dir">
                                    <input type="text" size="60" value="direccion..." disabled>
                                </div>
                            <th  colspan="5" >
                                <div id="ruc">
                                    Ruc:&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="text" disabled  value="ruc cliente..." size="30">
                                    </label>
                                </div>                            </th>
                        </tr>
                        <tr bgcolor="#006699">
                          <th bordercolor="#000000" bgcolor="#999933"  ><div align="center" class="style4 style5" >
                            <p>CANTIDAD</p>
                          </div></th>
                          <th  colspan="3" bordercolor="#000000" bgcolor="#999933" ><div align="center" class="style6" >
                            <p>DESCRIPCION</p>
                          </div></th>
                          <th  width="119" bordercolor="#000000" bgcolor="#999933" ><div align="center" class="style6" >
                            <p>P. UNIT.</p>
                          </div></th>
                          <th bordercolor="#000000" bgcolor="#999933"  ><div align="center" class="style6" >
                            <p>IMPORTE</p>
                          </div></th>
                      </tr>
                        <tr>
                            <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;
                                <textarea cols="70" rows="2" name="txtDescFactura" placeholder="POR EL SERVICIO DE:" maxlength="100" onChange="javascript:this.value=this.value.toUpperCase();" ></textarea>                    
                                &nbsp;<a href="#" onclick="nuevo();" title="Agregar"><img alt="" src="../imagenes/icons/Add.gif" height="60" width="60"/></a>&nbsp;					      </td>
                        </tr>
                        <%-- Los productos que tenemos en la sesion que se llama carrito --%>
                        <%try {

                                ArrayList<DetalleFactura> lista = (ArrayList<DetalleFactura>) session.getAttribute("carrito");

                                Double SubTotal = 0.00;
                                if (lista != null) {
                                    for (DetalleFactura d : lista) {
                        %>
                        <tr>
                            <td><div align="right"><span><%=d.getCantidad()%></span></div></td>
                            <td colspan="3" ><span ><%=d.getDescripcion()%></span></td>
                            <td>&nbsp;</td>
                            <td>
                                <div align="right"><span>
                                  <%
                                        if (c.red().Redondear(d.getImporte(), 2) == 0.0) {
                                            out.print("");
                                        } else {
                                            out.print(c.red().Redondear(d.getImporte(), 2));
                                        }

                                    %>
                                </span> </div></td>
                        </tr>

                        <%
                                    SubTotal = SubTotal + d.getImporte();
                                }
                            }
                        %>
                        <tr>
                            <td colspan="5" align="right" >
                                <div align="center">
                                    <select name="txtDescIgv">
                                        <option selected value="">Seleccione descripcion IGV</option>
                                        <option>Operación Sujeta al Sistema de Pago de Obligaciones Tributarias Con el Gobierno Central
                                            Cta. De detracción Banco de la Nación Nº 00-157-000020</option>
                                        <option>EXONERADO DEL IGV D.S. 055-99-EF APÉNDICE II NUMERAL TRES</option>
                                    </select>
                                </div></td><td colspan="1" align="right" >&nbsp;</td>
                        </tr>
                        <tr> <td colspan="5" align="right" ><span >Sub Total</span></td>
                            <td colspan="1" align="right" ><div align="right" >

                                    <input name="txtSubTotal" type="text"  value="<%=c.red().Redondear(SubTotal, 2)%>" size="10" maxlength="10"/>
                                </div>                        </td>
                        </tr>
                        <%if (rsigv.next()) {%>
                        <tr>
                            <td colspan="5" align="right" ><span >IGV&nbsp;<%=rsigv.getString("nombreIgv")%></span></td>
                            <td colspan="1" align="right" ><div align="right" >
                                    <input name="txtIgv" type="text"  value="<%=c.red().Redondear(SubTotal * rsigv.getDouble("igv"), 2)%>" size="10" maxlength="10"/>
                                </div>                        </td>
                        </tr>
                        <%}%>
                        <tr>
                            <td colspan="5" align="right" ><span >
                                    <select id="moneda" name="txtMoneda" onchange="llamarMoneda()">
                                        <option value="">Seleccione Moneda</option>
                                        <option value="US$">US$</option>
                                        <option value="S/.">S/.</option>
                                    </select>
                                    Total</span></td>
                            <td colspan="1" align="right" ><div align="right" >
                                    <input name="txtTotal" type="text"  value="<%=c.red().Redondear((SubTotal + (SubTotal * rsigv.getDouble("igv"))), 2)%>" size="10" maxlength="10">
                                </div>                            </td>
                        </tr>

                        <tr>
                            <th  colspan="4">Son:
                                <input name="txtSon" type="text"  value="<%=c.csll().sullNro_Palabras(c.red().Redondear((SubTotal + (SubTotal * rsigv.getDouble("igv"))), 2)).toUpperCase()%>" size="80" maxlength="100">                            </th>
                            <th colspan="2">
                                <div id="mon" align="left">
                                    <input name="txtMonedaletra" type="text" size="20" maxlength="20">   
                                </div>                            </th>
                        </tr>
                        <%} catch (Exception e) {
                                e.printStackTrace();
                            }%>
                        <tr>
                            <th  colspan="2"  >
                                <div>
                                    <span >Estado:</span>
                                    <label>
                                        <select name="txtEstado"  id="estado" onchange="llamarAjaxGETfechaCancelLetrasFactura()">
                                            <option>----------------Seleccione Estado----------------</option>
                                            <option value="CANCELADO">CANCELADO</option>
                                            <option value="POR CANCELAR">POR CANCELAR</option>
                                            <option value="ANULADO">ANULADO</option>
                                        </select>
                                    </label>
                                </div>                            </th>
                            <th  colspan="5">
                                <div id="fechCL">
                                    <label>
                                        <input name="txtFechaCancelLetras" value="fecha de cancelacion..." type="text"  size="62" maxlength="63" disabled>
                                    </label>
                                </div>                            </th>
                        </tr>
                        <tr>
                            <th class="rounded-foot-left">                            </th>
                            <th class="rounded-foot-right" colspan="6" >
                                <div align="right" >
                                    <input name="btnVenta" type="submit"  value="Registrar Venta" >
                                </div>                            </th>
                        </tr>
                  </table>
                    <%conex.close();%>
                </form>
            </div>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
            </body>


            </html>
