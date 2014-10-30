
<%@include file="conexion.jsp"%>
<%@page import="com.gl.controlador.*" %> 
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
            consulta = "select idCliente,razonSocial from cliente where estado='1' and tipo='TRANSPORTISTA' OR tipo='OPERADOR LOGISTICO' OR tipo='otros' "
                    + " ORDER BY razonsocial ASC;";
            ps = conex.prepareStatement(consulta);
            rs = ps.executeQuery();
%>
<%
            consulta = "select idCliente,razonSocial from cliente where estado='1' ORDER BY razonsocial ASC;";
            PreparedStatement psc = conex.prepareStatement(consulta);
            ResultSet rsc = psc.executeQuery();
%>
<%
            consulta = "select idCliente,razonSocial from cliente where estado='1' ORDER BY razonsocial ASC ;";
            PreparedStatement pscd = conex.prepareStatement(consulta);
            ResultSet rscd = pscd.executeQuery();
%>
<%
            consulta = "select idCliente,razonSocial from cliente where estado='1' ORDER BY razonsocial ASC;";
            PreparedStatement pscc = conex.prepareStatement(consulta);
            ResultSet rscc = pscc.executeQuery();
%>
<%
            consulta = "SELECT DISTINCT pais,cod_pais FROM pais where idpais;";
            //PreparedStatement ps7 = conex.prepareStatement(consulta);
            PreparedStatement ps8 = conex.prepareStatement(consulta);

%>

<%
            consulta = "SELECT DISTINCT ciudad,pais,idpais FROM pais where idpais;";
            PreparedStatement ps9 = conex.prepareStatement(consulta);
            PreparedStatement ps10 = conex.prepareStatement(consulta);
%>


<html>
    <head>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Formulario MIC</title>

        <script language="javascript" type="text/javascript" src="../Js/AjaxForMic.js"></script>
<script src="../Js/datapicker/jquery.tools.min.js"></script>
<!-- Add the dateinput and validator tools to the form (except for iOS devices) -->
<script>
$( function () {
if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
$("#treinsei_fecha").dateinput( { format: 'yyyy-mm-dd' } );
$("#seis_fechaemision").dateinput( { format: 'yyyy-mm-dd' } );
$("#treinnuev_fecha").dateinput( { format: 'yyyy-mm-dd' } );
$("#form1").validator();
}
} );
</script>

<!-- For styling the dateinput field and calendar -->
<link rel="stylesheet" type="text/css" href="../Js/datapicker/skin1.css" />

    </head>

    <body>

        <div align="center">
            <h3>REGISTRO DE MIC</h3>
            <br>
            [&nbsp;<a href="mic_list.jsp">LISTA DE MICS</a>&nbsp;]
            </br><br>

        <br>
        <form action="mic_save.jsp" method="post" enctype="Application/x-www-form-urlencoded" name="form1" id="form1">

            <table  id="rounded-corner">
                <tr align="center">
                    <th colspan="4" align="right" class="rounded-company">
                         <input type="submit" name="Submit" value="Guardar MIC" onclick="return confirm('¿Esta seguro de guardar los datos del MIC?')">
                    </th>
                    <th colspan="4" align="left" class="rounded-q4">
                        <input type="reset" name="Submit" value="Limpiar" onclick="return confirm('¿Desea reseter los datos?')">                        
                    </th>
                </tr>
                <tr align="justify">
                    <th width="245" height="34"><div align="center"><span class="style25" style="font-size:16px"><b>MIC / DTA </b></span></div></th>
                    <th colspan="8"><blockquote>
                            <p><span class="style13">Manifiesto Internacional de Carga por Carretera / Declaraci&oacute;n de Tr&aacute;nsito Aduanero</span><span class="style14"><br />
                                    <span class="style15">Manifiesto Internacional de Carga Rodovi&aacute;ria / Declaracao de Transito Aduaneiro</span></span> </p>
                        </blockquote>
                    </th>
                </tr>
                <tr>
                    <td height="20" colspan="4" rowspan="3" align="left" valign="top"><span class="style22"><span class="style26">1</span>. Nombre y domicilio del porteador/Nome e Endereco dotransportador</span>
                        <table width="300" border="0">
                            <tr>
                                <td width="75" class="style22"><strong>Nombre:</strong></td>
                                <td width="250" class="style22"><label>
                                        <input type="text" value="GRUPO LINARES S.A." name="uno_nombre" size="40"/>
                                    </label></td>
                            </tr>
                            <tr>
                                <td class="style22"><strong>Direccion:</strong></td>
                                <td class="style22"><label>
                                        <input type="text" value="C.P. Bolognesi Psje. Leguía Nº03 TACNA" name="uno_direccion" size="40"/>
                                    </label></td>
                            </tr>
                            <tr>
                                <td class="style22"><strong>Descripcion:</strong></td>
                                <td class="style22">
                                        <textarea name="uno_descripcion" cols="40" rows="3" maxlength="130"></textarea>                                </td>
                            </tr>
                            <tr>
                                <td height="24" class="style22"><strong>Codigo Aduanas: </strong></td>
                                <td class="style22"><input name="uno_codigoaduana" type="text" size="40" value="0578" /></td>
                            </tr>
                        </table>
                        <span class="style22"><br />
                            <label></label>
                        </span></td>
                    <td width="206" height="53" valign="top" class="style22"><span class="style26">3 </span>Transito Aduanero
                        <table width="98" border="0">
                            <tr>
                                <td width="24" rowspan="2"><label>
                                        <input name="tres_transito_si" type="checkbox" value="X" />
                                    </label></td>
                                <td width="18" valign="top">Si</td>
                                <td width="22" rowspan="2"><label>
                                        <input name="tres_transito_no" type="checkbox" value="X" />
                                    </label></td>
                                <td width="16" valign="top">No</td>
                            </tr>
                            <tr>
                                <td valign="top">Sim</td>
                                <td valign="top">Nao</td>
                            </tr>
                        </table></td>
                    <td colspan="2" valign="top" class="style22"><span class="style26">4 </span>No.<br />
                        <label>
                            <input type="text" name="cuat_nro" />
                        </label></td>
                </tr>
                <tr>
                    <td height="35" valign="top"><p class="style22">
                            <label></label>
                            <span class="style26">5</span> Hoja<br>
                            <label>
                                <input name="cinc_hoja" type="text" size="10" maxlength="10" />
                                <br />
                            </label>
                        </p></td>
                    <td height="35" colspan="3" valign="top"><span class="style22"><span class="style26">6</span> Fecha de Emision<br />
                        </span> <span class="style22">
                            <label>
                                <%

            java.util.Date dates = new java.util.Date();
            long fechaSis = dates.getTime();
            Date fecha = new Date(fechaSis);

                                %>
                                <input id="seis_fechaemision" type="text" name="seis_fechaemision" value="<%=fecha%>"/>
                            </label>
                        </span></td>
                </tr>
                <tr>
                    <td height="19" colspan="4" valign="top"><span class="style22"><span class="style26">7</span> Aduana, ciudad y pa&iacute;s de partida / Alfadenga, cidade e pais de partida </span> <span class="style23">
                            <label></label>
                            <select id="aduana_partida" onchange="llamarCodigoAduanaPartida()">
                                <option value="0">-----Seleccione Pais-----</option>
                                <%ResultSet rs9 = ps9.executeQuery();
                                while (rs9.next()) {%>
                                <option value="<%=rs9.getString("idpais")%>">
                                    <%=rs9.getString("ciudad")%>-<%=rs9.getString("pais")%>
                                </option>
                                <%}%>
                            </select>
                            <br><br>
                            <label><b>Codigo :</b></label>
                            <div id="codigo_aduana_partida">
                                <input type="text" name="siet_codigo" disabled/>
                            </div>
                                
                            
                        </span></td>
                </tr>
                <tr>
                    <td height="40" colspan="4" align="left" valign="top"><span class="style22"><span class="style26">2 </span>Rol del Contribuyente/cadastro geral do contribuintes </span> <span class="style22">
                            <label> <br />
                                <input name="dos_rol" value="10465321122"type="text" size="40" />
                            </label>
                        </span></td>
                    <td colspan="4" valign="top"><span class="style22"><span class="style26">8</span> Ciudad y pa&iacute;s de destino final /Cidade e pais de destino final
                            <select  id="destino_final" onchange="llamarCodigoAduanaDestinoFinal()">
                                <option value="0">-----Seleccione Pais-----</option>
                                <%ResultSet rs10 = ps10.executeQuery();
                                while (rs10.next()) {%>
                                <option value="<%=rs10.getString("idpais")%>">
                                    <%=rs10.getString("ciudad")%>-<%=rs10.getString("pais")%>
                                </option>
                                <%}%>
                            </select>
                            <br><br>
                            <label>
                                <b>Codigo :</b>
                            </label>
                            <div id="codigo_destino_final">
                                <input type="text" name="ocho_codigo" disabled/>
                            </div>
                        </span></td>
                </tr>
                <tr>
                    <td height="118" colspan="4" valign="top"><span class="style22">
                            <label><span class="style26">9</span> CAMION ORIGINAL: Nombre y domicilio del propietario </label>
                        </span>
                        <table width="541" border="0">
                            <tr>
                                <td width="62" class="style22"><strong>Nombre:</strong></td>
                                <td width="239" class="style22">
                                    <div id="cli" align="left">
                                        <select name="idcliente" id="cliente" onchange="recogerDirRucPlacaofRol()">
                                            <option value=" ">Seleccione Cliente</option>
                                            <%while (rs.next()) {%>
                                            <option value="<%=rs.getString("idCliente")%>">
                                                <%=rs.getString("razonSocial")%>                                            </option>
                                            <%}%>
                                        </select>
                                    </div>                                
                                </td>
                                <td width="226" rowspan="3" align="center" valign="top" class="style22">
		                  <div>
                                      <a href="cliente_list.jsp" target="../" title="Busca Clientes, su direccion y sus demas datos(Puedes buscar y actualizar los campos del cliente o razon social que te convenga)">
                                          <img alt="" src="../imagenes/icons/search.png" height="25" width="25"/>
                                      </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="cliente_add_fm.jsp" target="../" title="Insertar Cliente(Redirecciona directamente a un formulario que te permitira ingresar un nuevo cliente)">
                                            <img alt="" src="../imagenes/icons/add.png" height="25" width="25"/>
                                        </a>&nbsp;
                                        <button title="Refrescar(Luego de haber actualizado o ingresado un nuevo cliente, presione este boton para asegurarse que los cambios se han realizado en este formulario MIC)" onclick="llamarCOrig()" type="button" style="background-color: #ecf8fd;border: 0px;">
                                            <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25"/>
                                        </button>                                    
                                   </div>                                
                                </td>
                            </tr>
                            
                            <tr>
                                <td class="style22"><strong>Domicilio:</strong></td>
                                <td class="style22">
                                    
                                    <div id="dir" align="left">
                                        <select name="select" disabled >
                                            <option value=" ">Seleccione Domicilio</option>
                                        </select>
                                    </div>                                </td>
                            </tr>
                            <tr>
                                <td class="style22"><strong>Codigo:</strong></td>
                                <td>
                                    <div id="codigo_camion">
                                        <input type="text" name="nueve_codigo" size="4" />
                                    </div>                                </td>
                            </tr>
                        </table>
                        <span class="style22">
<label> </label>
                  </span></td>
                    <td colspan="4"><span class="style22">
                            <label><span class="style26">16</span> CAMION SUBSTITUTO: Nombre y domicilio del propietario </label>
                        </span>
                        <table width="373" border="0">
                            <tr>
                                <td width="52" class="style22"><strong>Nombre:</strong></td>
                                <td width="311" class="style22">
                                  
                                      
                                            <select name="diesei_camion" onchange="recogerDirForCS()" id="cl_subs" >
                                                <option value="">--------Seleccione Cliente---------</option>
                                            <%
                                        consulta = "select*from cliente where estado='1'";
                                        PreparedStatement ps2 = conex.prepareStatement(consulta);
                                        ResultSet rs2 = ps2.executeQuery();
                                        while (rs2.next()) {
                                            %>
                                            <option value="<%=rs2.getString("razonSocial")%>">
                                                <%=rs2.getString("razonSocial")%>                                            </option>
                                            <%}%>
                                        </select>                                </td>
                            </tr>
                            <tr>
                                <td class="style22"><strong>Domicilio:</strong></td>
                                <td class="style22">
                                    <div id="cli_s">
                                        <input type="text" size="30" value="direccion..."disabled/>
                                    </div>                                    </td>
                            </tr>
                            <tr>
                                <td class="style22"><strong>Codigo:</strong></td>
                                <td>
                                    <div id="codigo_camion_subs">
                                        <input type="text" name="diesei_codigo" size="4" />
                                    </div>
                                </td>
                            </tr>
                        </table>                    
                    </td>
                </tr>
                <tr>
                    <td height="40" colspan="2" valign="top"><span class="style22"><span class="style26">10 </span>Rol del Contribuyente<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Cadastro geral do contribuintes </span> <span class="style22">
                            <label></label>
                            <div id="ruc" style="width:150px; float:left">
                                <select name="select" disabled>
                                    <option value=" ">----Seleccione ROL----</option>
                                </select>
                            </div>
                        </span></td>
                    <td colspan="2" valign="top"><span class="style22"><span class="style26">11</span> Pl

                            aca del Cami&oacute;n<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Placa de caminhao </span> <span class="style22">
                                <br>
                            <div id="pla" style="width:150px; float:left">
                                <select name="select" disabled>
                                    <option value="">----Seleccione Placas----</option>
                                </select>
                            </div>
                        </span>
                        
                    </td>
                    <td colspan="2" valign="top"><span class="style22"><span class="style26">17 </span>Rol del Contribuyente<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Cadastro geral do contribuintes </span> 
                        <div id="ruc_s">
                            <input type="text" size="27" value="ruc..."disabled/>
                               </div>                        </td>
                    <td width="190" valign="top"><span class="style22"><span class="style26">18</span> Placa del Cami&oacute;n<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Placa de caminhao </span> <span class="style22">
                            <label></label>
                            <div id="pla_s">
                              <select name="select2" >
                                <option value=""> Seleccione Placa SUBS </option>
                              </select>
                            </div>
               
                        </span></td>
                </tr>
                <tr>
                    <td height="45" colspan="2" valign="top"><span class="style28">12</span> <span class="style22">Marca y N&uacute;mero/Marca e N&uacute;mero</span>
                        <table width="247" border="0">
                            <tr>
                                <td width="52" class="style22"><strong>Marca:</strong></td>
                                <td width="185" class="style22"><label> </label>
                                    <div id="mar">
                                        <select name="select"  disabled>
                                            <option value=" ">---Seleccione Marca--- </option>
                                        </select>
                                    </div></td>
                            </tr>
                            <tr>
                                <td class="style22"><strong>Numero:</strong></td>
                                <td class="style22"><label> </label>
                                    <div id="num">
                                        <select name="select"  disabled>
                                            <option value=" ">---Seleccione Numero--- </option>
                                        </select>
                                    </div></td>
                            </tr>
                        </table></td>
                    <td colspan="2" valign="top"><span class="style28">13</span> <span class="style22">Capacidad de arrastre (t.) <br />
                            <span class="style16">......</span>Capacidade de tracao (t.)<br />
                        </span> <span class="style22">
                            <div id="cap">
                                <select name="select"  disabled>
                                    <option value=" ">---Seleccione Capacidad--- </option>
                                </select>
                            </div>
                        </span></td>
                    <td colspan="2"><span class="style28">19</span> <span class="style22">Marca y N&uacute;mero/Marca e N&uacute;mero</span>
                        <table width="207" border="0">
                            <tr>
                                <td width="47" class="style22"><strong>Marca:</strong></td>
                                <td width="150" class="style22"><label>
                                        <div id="mar_s">
                                            <input type="text" name="textfield32" value="marca..." disabled/>
                                        </div>
                                    </label></td>
                            </tr>
                            <tr>
                                <td class="style22"><strong>Numero:</strong></td>
                                <td class="style22"><label>
                                        <div id="num_s">
                                            <input type="text" name="textfield42" value="numero..." disabled/>
                                        </div>
                                    </label></td>
                            </tr>
                        </table></td>
                    <td valign="top"><span class="style28">20</span><span class="style22"> Capacidad de arrastre </span> <span class="style22">
                            <div id="cap_s">
                                <input type="text" size="22" value="capacidad..." disabled/>
                                </div>
                        </span></td>
                </tr>
                <tr>
                    <td height="40" colspan="2" valign="top"><span class="style28">14</span> <span class="style22">A&ntilde;o/Ano </span> <span class="style22">
                            <label> <br />
                            </label>
                            <div id="ani">
                                <input name="text" type="text" value="año..." disabled/>
                            </div>
                        </span></td>
                    <td colspan="2" valign="top"><table width="172" border="0">
                            <tr>
                                <td width="14" rowspan="2" valign="top" class="style22"><span class="style26">15</span></td>
                                <td width="20" rowspan="2" class="style22"><label>
                                        <input name="quince_re" type="checkbox" size="1" maxlength="1" value="X"/>
                                    </label></td>
                                <td width="59" valign="top" class="style22">Semiremolque</td>
                                <td width="20" rowspan="2" class="style22"><label>
                                        <input name="quince_se" type="checkbox" size="1"value="X" maxlength="1"/>
                                    </label></td>
                                <td width="48" valign="top" class="style22">Remolque</td>
                            </tr>
                            <tr>
                                <td valign="top" class="style22">Semi-reboque</td>
                                <td valign="top" class="style22">Reboque</td>
                            </tr>
                            <tr>
                                <td height="23" colspan="5" class="style22">
                                    <div id="plaram">
                                        <input type="text" name="idrampla" value=""/>
                                    </div>                                    </td>
                            </tr>
                        </table></td>
                    <td colspan="2" valign="top"><span class="style28">21 </span>A&ntilde;o/Ano <br>
                        <div id="anio_s">
                            <input name="textfield3" type="text" size="20" value="año..." disabled/>
                        </div>                    </td>
                    <td><table width="165" border="0">
                            <tr>
                                <td width="12" rowspan="2" valign="top" class="style22"><span class="style26">22</span></td>
                                <td width="20" rowspan="2" class="style22"><label>
                                        <input name="veindos_re" type="checkbox" value="X" size="1" maxlength="1" />
                                    </label></td>
                                <td width="53" valign="top" class="style22">Semiremolque</td>
                                <td width="20" rowspan="2" class="style22"><label>
                                        <input name="veindos_se" type="checkbox" value="X" size="1" maxlength="1"/>
                                    </label></td>
                                <td width="47" valign="top" class="style22">Remolque</td>
                            </tr>
                            <tr>
                                <td valign="top" class="style22">Semi-reboque</td>
                                <td valign="top" class="style22">Reboque</td>
                            </tr>
                            <tr>
                                <td height="24" colspan="5" align="center" valign="top" class="style22">
                                    <div id="plaramSubs">
                                        <input type="text" name="veindos_rampla" value=" "/>
                                    </div>
                                        
                                    </td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td height="96" valign="top"><span class="style22"><span class="style26">23</span> N&deg; de carta porte<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>N&deg; de conhecimiento<br />
                            <input name="veintres_crt" type="text"/>
                        </span></td>
                    <td height="96" colspan="3" valign="top">
                        <span class="style22"><span class="style26">24</span> Aduana de destino / Alfadenga de destino<br />
                            <select id="aduana_destino" onchange="llamarCodigoAduanaDestino()" >
                                <%
                                consulta="select CONCAT(ciudad,' - ',pais) "
                                        + "AS ciudad_pais,idpais "
                                        + "from pais "
                                        + "where idpais";
                                PreparedStatement ps7=conex.prepareStatement(consulta);
                                ResultSet rs7 = ps7.executeQuery();
                                %>
                                <option>-----Seleccione-----</option>
                                <%while (rs7.next()) {%>
                                <option value="<%=rs7.getString("idpais")%>">
                                    <%=rs7.getString("ciudad_pais")%> 
                                </option>
                                <%}%>
                            </select>
                            <br><br>
                            <label><b>Codigo :</b></label>
                                <div id="codigo_aduana">
                                    <input name="veicua_codigoadu" type="text" size="10" maxlength="10" disabled/>
                                </div>
                        </span>
                    </td>
                    <td colspan="4" valign="top"><span class="style22"><span class="style26">33</span> Remitente / Remetente</span>
                        <table width="248" border="0">
                            <tr>
                                <td width="91" class="style29">Razon Social:</td>
                                <td width="147" class="style23"><label> </label>
                                    <div id="rrz">
                                        <select name="treintres_remitente"  id="razRemitente" onchange="recogerDirPaisOfRemitente()">
                                            <option value=" ">---Seleccione Cliente---</option>
                                            <%while (rsc.next()) {%>
                                            <option value="<%=rsc.getString("razonSocial")%>"> <%=rsc.getString("razonSocial")%> </option>
                                            <%}%>
                                        </select>
                                    </div></td>
                            </tr>
                            <tr>
                                <td class="style29">Direccion:</td>
                                <td class="style23"><label></label>
                                    <div id="rdi">
                                        <input type="text" size="22" value="direccion..." disabled/>
                                    </div></td>
                            </tr>
                            <tr>
                                <td height="23" class="style29">Ciudad y Pais: </td>
                                <td class="style23"><label></label>
                                    <div id="rpa">
                                    <input type="text" size="22" value="ciudad-pais..." disabled/>
                                    </div></td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td height="40" valign="top"><span class="style22"><span class="style26">25</span> Moneda / Moeda<br />
                        </span> <span class="style22">
                            <label> </label>
                            <select name="veincin_moneda">
                                <option value=" ">---Seleccione Moneda---</option>
                                <option>US$</option>
                                <option>E</option>
                            </select>
                        </span></td>
                    <td height="40" colspan="3" valign="top"><span class="style22"><span class="style26">26</span> Origen de las mercanc&iacute;as / Origem das mercadorias </span> <span class="style22">
                            <select id="origen_mercancias" onchange="llamarCodigoOrigenMercancias()">
                                <option value="">-----Seleccione-----</option>
                                <%ResultSet rs8 = ps8.executeQuery();
                                while (rs8.next()) {%>
                                <option value="<%=rs8.getString("cod_pais")%>"> 
                                    <%=rs8.getString("pais")%> 
                                </option>
                                <%}%>
                            </select>
                            <br><br>
                            <label><b>Codigo :</b></label>
                            <div id="codigo_aduana_origen">
                                <input name="veinsei_codmerca" type="text" size="10" maxlength="10" disabled/>
                            </div>
                        </span></td>
                    <td colspan="4" valign="top"><span class="style22"><span class="style26">34</span> Destinatario / Destinatario </span>
                        <table width="248" border="0">
                            <tr>
                                <td width="91" class="style29">Razon Social:</td>
                                <td width="147" class="style23"><label></label>
                                    <div id="drz">
                                        <select name="treincua_destinatario"  id="razDestinatario" onchange="recogerDirPaisOfDest()">
                                            <option value=" ">---Seleccione Cliente---</option>
                                            <%while (rscd.next()) {%>
                                            <option value="<%=rscd.getString("razonSocial")%>"> <%=rscd.getString("razonSocial")%> </option>
                                            <%}%>
                                        </select>
                                    </div></td>
                            </tr>
                            <tr>
                                <td class="style29">Direccion:</td>
                                <td class="style23"><label></label>
                                    <div id="ddi">
                                        <input type="text" value="direccion..." size="22" disabled/>
                                    </div></td>
                            </tr>
                            <tr>
                                <td height="23" class="style29">Ciudad y Pais: </td>
                                <td class="style23"><label></label>
                                    <div id="dpa">
                                        <input type="text" value="ciudad-pais..." size="22" disabled/>
                                    </div></td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td height="40" valign="top"><span class="style22"><span class="style26">27</span> Valor FCA / Valor FCA<br />
                             <input name="veinsie_valor" type="text" size="10" maxlength="10" />                    </td>
                    <td colspan="2" valign="top"><span class="style22"><span class="style26">28</span> Flete en USD<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Flete en UsD </span> 
                                <input name="veinoch_flete" type="text" size="10" maxlength="10" />                    </td>
                    <td width="206" valign="top"><span class="style22"><span class="style26">29</span> Seguro en US$<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Seguro em US$<br />
                                <input name="veinnue_seguro" type="text" size="10" maxlength="10" />                    </td>
                    <td colspan="3" valign="top"><span class="style22"><span class="style26">35</span> Consignatario/ Consignatario </span>
                        <table width="248" border="0">
                            <tr>
                                <td width="91" class="style29">Razon Social:</td>
                                <td width="147" class="style23"><label></label>
                                    <div id="crz">
                                        <select name="treincin_consignatario"  id="razConsignatario" onchange="recogerDirPaisOfCons()">
                                            <option value=" ">---Seleccione Cliente---</option>
                                            <%while (rscc.next()) {%>
                                            <option value="<%=rscc.getString("razonSocial")%>"> <%=rscc.getString("razonSocial")%> </option>
                                            <%}%>
                                        </select>
                                    </div></td>
                            </tr>
                            <tr>
                                <td class="style29">Direccion:</td>
                                <td class="style23"><label></label>
                                    <div id="cdi">
                                        <input type="text" value="direccion" size="22" disabled/>
                                    </div></td>
                            </tr>
                            <tr>
                                <td height="23" class="style29">Ciudad y Pais: </td>
                                <td class="style23"><label></label>
                                    <div id="cpa">
                                        <input type="text" value="ciudad-pais..." size="22" disabled/>
                                    </div></td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td height="75" valign="top"><span class="style22"><span class="style26">30 </span> Tipo de Bultos<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Tipo dos volumes<br />                 
                               
                                <%
                                consulta="select*from tipo_carga";
                                PreparedStatement psca=conex.prepareStatement(consulta);
                                ResultSet rsca=psca.executeQuery();
                                %>
                                <select id="glosa_bulto" name="trein_tipobulto" onchange="llamarCodigoBulto()">
                                    <option>Seleccione</option>
                                    <%while(rsca.next()){%>
                                    <option>
                                        <%=rsca.getString("glosa")%>
                                    </option>
                                    <%}%>
                                </select>
                                <br><br>
                                <div id="cod_bulto">
                                    <input type="text" name="trein_numero" size="5" disabled/>
                                </div>
                                </td>
                                
                                <td colspan="2" valign="top">31 Cantidad de bultos &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quantidade de &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;volumes
                            
                                <input name="treinun_cantidad" type="text" size="15" maxlength="15" />                        </td>
                    <td valign="top"><span class="style22"><span class="style26">32 </span>Peso bruto (Kg.)<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Peso bruto (Kg.)<br />
                        </span> 
                         
                                <input name="treindos_peso" type="text" size="10" maxlength="10" />                        </td>
                    <td colspan="3" valign="top"><span class="style22"><span class="style26">36</span> Documentos Anexos/ Documentos Anexos </span>
                        <table width="248" border="0">
                            <tr>
                                <td width="91" class="style29">DUA:</td>
                                <td width="147" class="style23"><label></label>
                                    <input type="text" name="treinsei_documento" value="" /></td>
                            </tr>
                            <tr>
                                <td class="style29">Fecha:</td>
                                <td class="style23"><label></label>
                                    
                                    <input id="treinsei_fecha" type="month" name="treinsei_fecha"  placeholder="YYYY-MM-DD"  maxlength="7" value="<%=fecha%>"/>                                </td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                    <td height="40" colspan="4" valign="top"><span class="style22"><span class="style26">37 </span> Numero de precintos / Numero dos lacres<br />
                            <label>
                                <input type="text" name="treinsie_numprecinto" />
                            </label>
                        </span></td>
                    <td colspan="4">FACTURA N&deg;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                    <input type="text" name="treinsei_factura" />
                                
                                <br><br>
                                CODIGO DE AGENCIA:&nbsp;
                                
                                    <input type="text" name="treinsei_codigo" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="text" name="treinsei_texto" size="5">
                    </td>

                </tr>
                <tr>
                    <td height="54" colspan="9" valign="top"><span class="style22"><span class="style26">38 </span> Marcas y numeros de loa bultos, descripcion de las mercader&iacute;as / Marcas e n&uacute;meros dos volumes, desericao das mercador&iacute;as<br />
                        </span> <span class="style23">
                            <label>
                                <textarea name="treinocho_descripcion" cols="100" rows="4"></textarea>
                            </label>
                        </span></td>
                </tr>
                <tr>
                    <td colspan="4" valign="baseline" bordercolor="1"><blockquote class="style22">
                            <p align="justify">&nbsp;</p>
                            <p align="justify">Declaramos que las informaciones prestadas en este Documento son expresi&oacute;n de verdad, que los datos referentes a las mercanc&iacute;as fueron transcriptos exactamente conforme a la declaracion del remitente los cuales son de su exclusiva responsabilidad, y que esta operacion obedece a lo dispuesto en el Convenio sobre Transporte Internacional Terrestre de los paises del Cono Sur.</p>
                            <p align="justify">Declaramos que as innfornac&oacute;es prestadas neste Documento s&aacute;o a express&aacute;o da verdade, que os dados r&eacute;ferentes &aacute;s mercadorias foram transcritos exatamente conforne a declarac&aacute;o de reme/ente, os quais sao de sua exclusiva responsabilidade e que esta operac&aacute;o obedece ao disposio ne convenio sobre Transporte Internacional Terretre dos Pa&iacute;ses de Cone Sul. </p>
                        </blockquote>                  </td>
                    <td height="132" colspan="4" valign="top"><span class="style23"><span class="style26">40</span> No. DATA, ruta y plazo de transporte<br />
                            <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>No. DTA. rota e plazo de transporte </span>
                        <table width="321" border="0">
                            <tr>
                                <td colspan="2"><textarea cols="40" rows="3" name="cuaren_nrodata"></textarea></td>
                            </tr>

                            <tr>
                                <td class="style23">Chofer</td>
                                <td class="style23">
                                    <div id="cho">
                                        <select  id="chofer" name="idconductor" onchange="llamarAjaxGETlicencia()">
                                            <option value="">Seleccione Chofer</option>
                                            <%
                                            consulta="select*from conductor where idconductor order by nombreconductor asc";
                                            PreparedStatement psch=conex.prepareStatement(consulta);
                                            ResultSet rsch=psch.executeQuery();
                                            while(rsch.next()){
                                            %>
                                            <option value="<%=rsch.getString("idconductor")%>">
                                                <%=rsch.getString("nombreconductor")%>
                                                <%=rsch.getString("apellidopconductor")%>
                                                <%=rsch.getString("apellidomconductor")%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </div>
		                  <div>
                                      <a href="conductor_list.jsp" target="../" title="Busca Conductores, licencia y sus demas datos(Puedes buscar y actualizar los campos del conducctor que te convenga)">
                                          <img alt="" src="../imagenes/icons/search.png" height="25" width="25"/>
                                      </a>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <a href="conductor_add_fm.jsp" target="../" title="Insertar Conductor(Redirecciona directamente a un formulario que te permitira ingresar un nuevo conductor)">
                                            <img alt="" src="../imagenes/icons/add.png" height="25" width="25"/>
                                        </a>&nbsp;
                                        <button title="Refrescar(Luego de haber actualizado o ingresado un nuevo conductor, presione este boton para asegurarse que los cambios se han realizado en este formulario MIC)" onclick="llamarRChofer()" type="button" style="background-color: #ecf8fd;border: 0px;">
                                            <img alt="" src="../imagenes/icons/refresh.png" height="25" width="25"/>
                                        </button>                                    
                                   </div> 
                                                
                                </td>
                            </tr>
                            <tr>
                                <td class="style23">RUT:</td>
                                <td class="style23"><div id="lic">
                                        <select name="select" disabled>
                                            <option>----Seleccione Licencia----</option>
                                        </select>
                                    </div></td>
                            </tr>
                        </table></td>
                </tr>
                <tr>
                  <td colspan="4" valign="top" bordercolor="1"><p>39 Firma y sello del porteador / Assinatura e canmbo de transportador </p>
                  <p>
                    <label>
                        <input name="treinnuev_fecha" type="text" id="treinnuev_fecha" value="<%=fecha%>">
                    </label>
                  </p></td>
                    <td height="21" colspan="4" valign="top" bordercolor="1"><p class="style22"><span class="style26">41</span> Firma y sello de la Aduana de Partida / Assignatura e carimbo de Alfadenga de Partida </p>
                  <p class="style22">
                    <label></label>
                  </p></td>
                </tr>
                <tr>
                    <th colspan="4" align="right" class="rounded-foot-left">
                        <input type="submit" value="Guardar MIC" onclick="return confirm('¿Esta seguro de guardar los datos del MIC?')"/>
                    </th>
                    <th colspan="4" class="rounded-foot-right"></th>
                </tr>
            </table>
            <input type="hidden" name="accion" value="guardar"/>
        </form>
                    <%
                    conex.close();
                    %>
        </div>
        
    </body>
</html>
