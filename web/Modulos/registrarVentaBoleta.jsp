<%@include file="session_verifica.jsp" %>
<%@include file="conexion.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.gl.modelo.*" %>
<%@page import="java.util.*" %>
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        
        
        <link rel="stylesheet" type="text/css" href="../Js/datapicker/skin1.css" />
        
        
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script language="javascript" type="text/javascript" src="../Js/AjaxForFactura.js"></script>
        <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"anadirCarritoBoleta.jsp",
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
        <script>
            $( function() {
                if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
                    $("#txtFechaFactura").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#form1").validator();
                }
            } );
        </script>
        

        <style type="text/css">
<!--
.style3 {color: #000000; font-weight: bold; font-style: italic; }
-->
        </style>
</head>
    <body>



        <div align="center" >
            <h3 >BOLETA DE VENTA</h3>
 &nbsp;<a href="registrarVentaBoleta.jsp" title="Nueva Boleta de Venta"><img alt="" src="../imagenes/icons/add.png" height="55" width="60"/></a>&nbsp;
 &nbsp;<a href="detalleBoleta_list.jsp" title="Buscar Boletas"><img alt="" style="margin-bottom: -3px" src="../imagenes/icons/search.png" height="55" width="60"/></a>&nbsp;
 &nbsp;<a href="#" onclick="nuevo();" title="Agregar"><img alt="" src="../imagenes/icons/Add.gif" height="55" width="60"/></a>
        </div>
        <br>

        <div  id="contenedor" style="display:none" ></div>

        <div>
           
            <div align="center">
            <form method="post" action="Controlador" name="form1" id="form1">

                <%-- Llamamos a la accion Registrar Venta --%>
                <input type="hidden" name="accion" value="RegistrarVentaBoleta" />
                <table id="rounded-corner-comp">
                    <tr>
                        <th colspan="1" class="rounded-company"></th>
                        <th colspan="3" style="padding: 7px ">
                            <div style="margin-right: -135px" align="center" >
                                <b>
                                    BOLETA DE VENTA                                </b>                            </div>                        </th>                         
                        <th colspan="2" class="rounded-q4">
                            <div align="right">
                                Usuario: <input type="text" name="txtLogin" readonly value="<%=session_login%>"/>
                            </div>                        </th>
                    </tr>
                    <tr>
                        <th height="26" colspan="2" ><div align="center">
                                <div align="right"></div>
                            </div>                        <label></label></th>
                        <th width="120" ><div align="center" >

                                <div align="left"></div>
                            </div>
                            <div align="center" >
                                <div align="left"></div>
                            </div></th>
                        <th colspan="2" >
                            <div align="right" >
                                Serie:
                                <input name="txtSerieFactura" type="text"  value="001" size="3">
                            </div>                      </th>
                        <th width="119" colspan="1" >
                            <%
            consulta = "SELECT LAST_INSERT_ID(numboleta) +1 " +
                    "AS ProximoIdAInsertar " +
                    "FROM boleta " +
                    "ORDER BY numboleta " +
                    "DESC LIMIT 1";
            PreparedStatement psn = conex.prepareStatement(consulta);
            ResultSet rsn = psn.executeQuery();
                            %>
                            <div align="center" >
                                <div align="left">N<b>°</b>
                                    <%if (rsn.next()) {%>
                                    <input name="txtNumFactura" type="text"  size="4" value="<%=nf.customFormat("000000", rsn.getInt("ProximoIdAInsertar"))%>"/>
                                    <%} else {%>
                                    <input type="text" name="txtNumFactura" size="6" value="<%=nf.customFormat("000000", 1)%>"/>
                                    <%}%>
                                </div>
                            </div>                        </th>
                    </tr>
                    <tr>
                        <th width="44" ><div align="center" >
                                <div align="right" style="margin-top: 26px">Cliente:</div>
                            </div></th>
                        <th width="219" >
                            <div>
                                <a href="cliente_list.jsp" target="../" title="Busca Clientes, su direccion y sus demas datos(Puedes buscar y actualizar los campos del cliente o razon social que te convenga)">
                                    <img alt="" src="../imagenes/icons/search.png" height="25" width="25"/>                                </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="cliente_add_fm.jsp" target="../" title="Insertar Cliente(Redirecciona directamente a un formulario que te permitira ingresar un nuevo cliente)">
                                    <img alt="" src="../imagenes/icons/add.png" height="25" width="25"/>                                </a>&nbsp;
                                <button title="Refrescar(Luego de haber actualizado o ingresado un nuevo cliente, presione este boton para asegurarse que los cambios se han realizado en este Registro de Boleta)" onclick="llamarRefreshCliente()" type="button" style="background-color: #60c8f2;border: 0px;">
                                    <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25"/>                                </button>                                    
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
                                        <%=rs.getString("razonSocial")%>                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                            </div></th>
                        <th colspan="5">
                                <span>Fecha:</span>
                                <input name="txtFechaLetras" type="text" size="1" value="Tacna, <%=fecha.diaEnNumeros()%> de <%=fecha.mesEnLetras()%> del <%=fecha.anioEnNumeros(fecha.fecha())%> " hidden/>
                                <input name="txtFechaFactura" type="month" id="txtFechaFactura" value="<%=fecha.fecha()%>"/>                       </th>
                    </tr>
                    <tr>
                        <th ><div align="center" >
                                <label>
                                    Direccion:                          </label>
                            </div></th>

                        <th >
                            <div id="dir">
                                <input type="text" size="41" value="direccion..." disabled/>
                            </div>                        </th>

                        <th colspan="5" >
                            <div id="ruc">
                                Ruc:&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="text"  value="ruc cliente..." disabled/>                          
                            </div>
                            <label></label></th>
                    </tr>
                    <tr>
                        <th ><div align="center" class="style3" >CANT.</div></th>
                        <th colspan="3" ><div align="center" class="style3" >DESCRIPCION</div></th>
                        <th width="119" ><div align="right" class="style3">P. UNIT. </div></th>
                        <th ><div align="right" class="style3">TOTAL</div></th>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="5">
                            <textarea cols="70" rows="2" placeholder="POR EL SERVICIO DE :" name="txtDescripcionBoleta" onChange="javascript:this.value=this.value.toUpperCase();" ></textarea>                          <a href="#" onclick="nuevo();" title="Agregar"><img alt="" src="../imagenes/icons/Add.gif" height="55" width="60"/></a>							</td>
                    </tr>
                    <%-- Los productos que tenemos en la sesion que se llama carrito --%>
                    <%
            try {
                ArrayList<DetalleBoleta> lista = (ArrayList<DetalleBoleta>) session.getAttribute("carritoBoleta");

                Double SubTotal = 0.00;
                if (lista != null) {
                    for (DetalleBoleta d : lista) {
                    %>
                    <tr>
                        <td><div align="right"><span ><%=d.getCantidad()%></span></div></td>
                        <td colspan="3"><span ><%=d.getDescripcion()%></span></td>
                        <td>&nbsp;</td>
                        <td>
                            <div align="right"><span>
                            <%
                            if(red.Redondear(d.getImporte(), 2)==0.0)
                            {
                                out.print("");
                            }else {
                                out.print(red.Redondear(d.getImporte(), 2));
                            }
                            %>
                            </span> </div></td>
                    </tr>

                    <%
                                SubTotal = SubTotal + d.getImporte();
                            }
                        }
                    %>
                    <%--  <tr> <td colspan="4"align="right" bgcolor="#82C1E8"><span >Sub Total</span></td>
                        <td colspan="1" align="right" bgcolor="#82C1E8"><div align="left" >

                                <input name="txtSubTotal" type="text"  value="<%=red.Redondear(SubTotal, 2)%>" size="10" maxlength="10"/>
                            </div>                        </td>
                    </tr>
                    --%>

                    <tr>
                        <td colspan="5" align="right" ><span >  
                                <select id="moneda" name="txtMoneda" onchange="llamarMoneda()">
                                    <option value="">Seleccione Moneda</option>
                                    <option value="US$">US$</option>
                                    <option value="S/.">S/.</option>
                                </select>  Total</span></td>
                        <td colspan="1" align="right"><div align="right" >

                                 <input name="txtTotal" type="text"  value="<%=red.Redondear((SubTotal), 2)%>" size="20" maxlength="10"/>

                            </div>                        </td>
                    </tr>

                    <tr>
                        <th colspan="5" >
                            <div align="left" >Son:
                                <input name="txtSon" type="text"  value="<%=num.sullNro_Palabras(red.Redondear((SubTotal), 2)).toUpperCase()%>" size="100" maxlength="100">
                        </div>                        </th>
                        <th colspan="1"><div id="mon" align="right">
                                <input name="txtMonedaletra" type="text" size="20" maxlength="20">
                            </div></th>
                    </tr>
                    <%} catch (Exception e) {
                e.printStackTrace();
            }%>
                    <tr>
                        <th colspan="2"  >
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
                            </div>                        </th>
                        <th colspan="5"  >
                            <div id="fechCL">
                                <label>
                                    <input name="txtFechaCancelLetras" value="fecha de cancelacion..." type="text"  size="62" maxlength="62" disabled>
                                </label>
                            </div>                        </th>
                    </tr>
                    <tr>
                        <th colspan="2" class="rounded-foot-left">                        </th>
                        <th colspan="4" align="right" class="rounded-foot-right">
                            <input name="btnVenta" type="submit"  value="Registrar Venta" />                        </th>
                    </tr>
                </table>
                <%conex.close();%>
            </form>
        </div>
    </body>

    <br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br>
</html>
