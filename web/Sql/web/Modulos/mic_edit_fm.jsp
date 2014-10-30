<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
        <script language="javascript" type="text/javascript" src="../Js/AjaxForMic.js"></script>
    </head>
    <body>
        <%
            consulta = "select*from mic where idMic=?";
            ps = conex.prepareStatement(consulta);
            ps.setString(1, request.getParameter("idMic"));
            rs = ps.executeQuery();
        %>
        <div align="center">
            <h3>EDICION DE MIC</h3><br>
            [&nbsp;<a href="mic_list.jsp">LISTA DE MICS</a>&nbsp;]
            <br><br><br>
        </div>
        <div align="center">
            <form action="mic_save.jsp" method="post" enctype="Application/x-www-form-urlencoded" name="form1" id="form1">
                <%if (rs.next()) {%>
                <table id="rounded-corner" align="center">
                    <tr align="center">
                        <th colspan="4" align="right" class="rounded-company">
                            <input type="submit" name="Submit" value="Actualizar" onclick="return confirm('¿Esta seguro de actualizar los datos del MIC?')">
                        </th>
                        <th colspan="4" align="left" class="rounded-q4">
                            <input type="reset" name="Submit" value="Restaurar" onclick="return confirm('¿Desea restaturar los datos?')">                        
                        </th>
                    </tr>
                    <tr align="justify">
                        <th width="245" height="34"><div align="center"><span class="style25" style="font-size:16px"><b>MIC / DTA </b></span></div></th>
                        <th colspan="8"><blockquote>
                                <p><span class="style13">Manifiesto Internacional de Carga por Carretera / Declaraci&oacute;n de Tr&aacute;nsito Aduanero</span><span class="style14"><br />
                                        <span class="style15">Manifiesto Internacional de Carga Rodovi&aacute;ria / Declaracao de Transito Aduaneiro</span></span> </p>
                            </blockquote></th>
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
                                            <input type="text" value="JR.AYACUCHO" name="uno_direccion" size="40"/>
                                        </label></td>
                                </tr>
                                <tr>
                                    <td class="style22"><strong>Descripcion:</strong></td>
                                    <td class="style22">
                                        <textarea name="uno_descripcion" cols="40" rows="3"><%=rs.getString("uno_descripcion")%></textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="24" class="style22"><strong>Codigo Aduanas: </strong></td>
                                    <td class="style22"><input name="uno_codigoaduana" value="<%=rs.getString("uno_codigoaduana")%>"type="text" size="40" /></td>
                                </tr>
                            </table>
                            <span class="style22"><br />
                                <label></label>
                            </span></td>
                        <td width="206" height="53" valign="top" class="style22"><span class="style26">3 </span>Transito Aduanero
                            <table width="98" border="0">
                                <tr>
                                    <td width="24" rowspan="2"><label>
                                            <input name="tres_transito_si" type="checkbox" value="X" <%if (rs.getString("tres_transito_si").equals("X")) {
                                                out.print("checked");
                                            }%>/>
                                        </label></td>
                                    <td width="18" valign="top">Si</td>
                                    <td width="22" rowspan="2"><label>
                                            <input name="tres_transito_no" type="checkbox" value="X" <%if (rs.getString("tres_transito_no").equals("X")) {
                                                out.print("checked");
                                            }%>/>
                                        </label></td>
                                    <td width="16" valign="top">No</td>
                                </tr>
                                <tr>
                                    <td valign="top">Sim</td>
                                    <td valign="top">Nao</td>
                                </tr>
                            </table></td>
                        <td colspan="2" valign="top" class="style22"><span class="style26">4 </span>Nro.<br />
                            <label>
                                <input type="text" name="cuat_nro" value="<%=rs.getString("cuat_nro")%>" />
                            </label></td>
                    </tr>
                    <tr>
                        <td height="35" valign="top"><p class="style22">
                                <label></label>
                                <span class="style26">5</span> Hoja<br>
                                <label>
                                    <input name="cinc_hoja" value="<%=rs.getString("cinc_hoja")%>" type="text" size="10" maxlength="10" />
                                    <br />
                                </label>
                            </p></td>
                        <td height="35" colspan="3" valign="top"><span class="style22"><span class="style26">6</span> Fecha de Emision<br />
                            </span> <span class="style22">
                                <label>
                                    <input id="seis_fechaemision" type="text" name="seis_fechaemision" value="<%=rs.getString("seis_fechaemision")%>"/>
                                </label>
                            </span></td>
                    </tr>
                    <tr>
                        <td height="19" colspan="4" valign="top"><span class="style22"><span class="style26">7</span> Aduana, ciudad y pa&iacute;s de partida / Alfadenga, cidade e pais de partida </span> <span class="style23">
                                <label></label>
                                <select name="siet_aduanaciudad">
                                    <option>
                                        <%=rs.getString("siet_aduanaciudad")%>
                                    </option>
                                    <%
                                        consulta = "SELECT DISTINCT ciudad,pais FROM pais;";
                                        PreparedStatement pspa = conex.prepareStatement(consulta);
                                        ResultSet rspa = pspa.executeQuery();
                                        while (rspa.next()) {
                                    %>
                                    <option>
                                        <%=rspa.getString("ciudad")%>-<%=rspa.getString("pais")%>
                                    </option>
                                    <%}%>
                                </select>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label>
                                    <input type="text" name="siet_codigo" value="<%=rs.getString("siet_codigo")%>" />
                                </label>
                            </span></td>
                    </tr>
                    <tr>
                        <td height="40" colspan="4" align="left" valign="top"><span class="style22"><span class="style26">2 </span>Rol del Contribuyente/cadastro geral do contribuintes </span> <span class="style22">
                                <label> <br />
                                    <input name="dos_rol" value="10465321122"type="text" size="40" />
                                </label>
                            </span></td>
                        <td colspan="4" valign="top"><span class="style22"><span class="style26">8</span> Ciudad y pa&iacute;s de destino final /Cidade e pais de destino final
                                <select name="ocho_destino">
                                    <option><%=rs.getString("ocho_destino")%></option>
                                    <%
                                        consulta = "SELECT DISTINCT ciudad,pais FROM pais;";
                                        PreparedStatement pspa2 = conex.prepareStatement(consulta);
                                        ResultSet rspa2 = pspa2.executeQuery();
                                        while (rspa2.next()) {
                                    %>
                                    <option>
                                        <%=rspa2.getString("ciudad")%>-<%=rspa2.getString("pais")%>
                                    </option>
                                    <%}%>

                                </select>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <label>
                                    <input type="text" name="ocho_codigo" value="<%=rs.getString("ocho_codigo")%>"/>
                                </label>
                                <label></label>
                            </span></td>
                    </tr>
                    <tr>
                        <td height="73" colspan="4" valign="top"><span class="style22">
                                <label><span class="style26">9</span> CAMION ORIGINAL: Nombre y domicilio del propietario </label>
                            </span>
                            <table width="316" border="0">
                                <tr>
                                    <td width="46" class="style22"><strong>Nombre:</strong></td>
                                    <td width="260" class="style22"><label> </label>
                                        <div id="cli" style="width:150px; float:left" align="center">

                                            <select name="idcliente" id="cliente" onchange="recogerDirRucPlacaofRol()">
                                                <%
                                                    consulta = "select razonSocial from cliente where idCliente=?";
                                                    PreparedStatement psr = conex.prepareStatement(consulta);
                                                    psr.setString(1, rs.getString("idCliente"));
                                                    ResultSet rsr = psr.executeQuery();
                                                    while (rsr.next()) {
                                                %>
                                                <option value="<%=rs.getString("idCliente")%>">
                                                    <%=rsr.getString("razonSocial")%>
                                                </option>
                                                <%}
                                                    consulta = "select idCliente,razonSocial from cliente";
                                                    PreparedStatement psr2 = conex.prepareStatement(consulta);
                                                    ResultSet rsr2 = psr2.executeQuery();
                                                    while (rsr2.next()) {
                                                %>
                                                <option value="<%=rsr2.getString("idCliente")%>">
                                                    <%=rsr2.getString("razonSocial")%>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td class="style22"><strong>Domicilio:</strong></td>
                                    <td class="style22"><div id="dir" style="width:150px; float:left">
                                            <select name="nueve_direccion">
                                                <option><%=rs.getString("nueve_direccion")%></option>
                                            </select>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td class="style22"><strong>Codigo:</strong></td>
                                    <td>
                                        <div id="codigo_camion">
                                            <input type="text" name="nueve_codigo" value="<%=rs.getString("nueve_codigo")%>" size="4" />
                                        </div>
                                    </td>
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
                                            <option value="<%=rs.getString("diesei_camion")%>">
                                                <%=rs.getString("diesei_camion")%>
                                            </option>
                                            <%
                                                consulta = "select razonSocial from cliente";
                                                PreparedStatement psrs = conex.prepareStatement(consulta);
                                                ResultSet rsrs = psrs.executeQuery();
                                                while (rsrs.next()) {
                                            %>
                                            <option>
                                                <%=rsrs.getString("razonSocial")%>
                                            </option>
                                            <%}%>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style22"><strong>Domicilio:</strong></td>
                                    <td class="style22">
                                        <div id="cli_s">
                                            <input type="text" size="30" name="diesei_direccion" value="<%=rs.getString("diesei_direccion")%>"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style22"><strong>Codigo:</strong></td>
                                    <td>
                                        <div id="codigo_camion_subs">
                                            <input type="text"value="<%=rs.getString("diesei_codigo")%>" name="diesei_codigo" size="4" />
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
                                    <select name="die_rolcontribuyente">
                                        <option><%=rs.getString("die_rolcontribuyente")%></option>
                                    </select>
                                </div>
                            </span></td>
                        <td colspan="2" valign="top"><span class="style22"><span class="style26">11</span> Pl

                                aca del Cami&oacute;n<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Placa de caminhao </span> <span class="style22">
                                <br>
                                <div id="pla" style="width:150px; float:left">
                                    <select name="idtracto">
                                        <%
                                            consulta = "select idtracto,placa from tracto where idtracto=?";
                                            PreparedStatement pst = conex.prepareStatement(consulta);
                                            pst.setString(1, rs.getString("idtracto"));
                                            ResultSet rst = pst.executeQuery();
                                            while (rst.next()) {
                                        %>
                                        <option value="<%=rs.getString("idtracto")%>">
                                            <%=rst.getString("placa")%>
                                        </option>
                                        <%}%>
                                    </select>
                                </div>
                            </span></td>
                        <td colspan="2" valign="top"><span class="style22"><span class="style26">17 </span>Rol del Contribuyente<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Cadastro geral do contribuintes </span>
                            <div id="ruc_s">
                                <input type="text" size="27" name="diesiet_rolcontri" value="<%=rs.getString("diesiet_rolcontri")%>"/>
                            </div>                        </td>
                        <td width="190" valign="top"><span class="style22"><span class="style26">18</span> Placa del Cami&oacute;n<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Placa de caminhao </span> <span class="style22">
                                <label></label>
                                <div id="pla_s">
                                    <select name="dieoch_placacamion" >
                                        <option><%=rs.getString("dieoch_placacamion")%></option>
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
                                            <select name="doce_marca">
                                                <option><%=rs.getString("doce_marca")%></option>
                                            </select>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td class="style22"><strong>Numero:</strong></td>
                                    <td class="style22"><label> </label>
                                        <div id="num">
                                            <select name="doce_num">
                                                <option><%=rs.getString("doce_num")%></option>
                                            </select>
                                        </div></td>
                                </tr>
                            </table></td>
                        <td colspan="2" valign="top"><span class="style28">13</span> <span class="style22">Capacidad de arrastre (t.) <br />
                                <span class="style16">......</span>Capacidade de tracao (t.)<br />
                            </span> <span class="style22">
                                <div id="cap">
                                    <select name="trece_cap">
                                        <option><%=rs.getString("trece_cap")%></option>
                                    </select>
                                </div>
                            </span></td>
                        <td colspan="2"><span class="style28">19</span> <span class="style22">Marca y N&uacute;mero/Marca e N&uacute;mero</span>
                            <table width="207" border="0">
                                <tr>
                                    <td width="47" class="style22"><strong>Marca:</strong></td>
                                    <td width="150" class="style22"><label>
                                            <div id="mar_s">
                                                <input type="text" name="dienue_marca" value="<%=rs.getString("dienue_marca")%>"/>
                                            </div>
                                        </label></td>
                                </tr>
                                <tr>
                                    <td class="style22"><strong>Numero:</strong></td>
                                    <td class="style22"><label>
                                            <div id="num_s">
                                                <input type="text" name="dienue_numero" value="<%=rs.getString("dienue_numero")%>"/>
                                            </div>
                                        </label></td>
                                </tr>
                            </table></td>
                        <td valign="top"><span class="style28">20</span><span class="style22"> Capacidad de arrastre </span> <span class="style22">
                                <div id="cap_s">
                                    <input name="veint_capacidad" type="text" size="22" value="<%=rs.getString("veint_capacidad")%>"/>
                                </div>
                            </span></td>
                    </tr>
                    <tr>
                        <td height="40" colspan="2" valign="top"><span class="style28">14</span> <span class="style22">A&ntilde;o/Ano </span> <span class="style22">
                                <label> <br />
                                </label>
                                <div id="ani">
                                    <input name="cator_anio" type="text" value="<%=rs.getString("cator_anio")%>" disabled/>
                                </div>
                            </span></td>
                        <td colspan="2" valign="top"><table width="172" border="0">
                                <tr>
                                    <td width="14" rowspan="2" valign="top" ><span class="style26">15</span></td>
                                    <td width="20" rowspan="2" ><label>
                                            <input name="quince_re" type="checkbox" size="1" maxlength="1" <%if (rs.getString("quince_re").equals("X")) {
                                                out.print("checked");
                                            }%> value="X" />
                                        </label></td>
                                    <td width="59" valign="top" >Semiremolque</td>
                                    <td width="20" rowspan="2" ><label>
                                            <input name="quince_se" type="checkbox" size="1"maxlength="1" <%if (rs.getString("quince_se").equals("X")) {
                                                out.print("checked");
                                            }%> value="X"/>
                                        </label></td>
                                    <td width="48" valign="top" >Remolque</td>
                                </tr>
                                <tr>
                                    <td valign="top" class="style22">Semi-reboque</td>
                                    <td valign="top" class="style22">Reboque</td>
                                </tr>
                                <tr>
                                    <td height="23" colspan="5" class="style22">
                                        <div id="plaram">
                                            <select name="idrampla">
                                                <%
                                                    consulta = "select idrampla,placa from ramplas where idrampla=?";
                                                    PreparedStatement psram = conex.prepareStatement(consulta);
                                                    psram.setString(1, rs.getString("idrampla"));
                                                    ResultSet rsram = psram.executeQuery();
                                                    while (rsram.next()) {
                                                %>
                                                <option value="<%=rs.getString("idrampla")%>">
                                                    <%=rsram.getString("placa")%>
                                                </option>
                                                <%}%>
                                                <option value="9">
                                                    XXXX
                                                </option>
                                            </select> 
                                        </div>
                                    </td>
                                </tr>
                            </table></td>
                        <td colspan="2" valign="top"><span class="style28">21 </span>A&ntilde;o/Ano <br>
                            <div id="anio_s">
                                <input name="veinuno_anio" type="text" size="20" value="<%=rs.getString("veinuno_anio")%>"/>
                            </div>                    </td>
                        <td><table width="165" border="0">
                                <tr>
                                    <td width="12" rowspan="2" valign="top" class="style22"><span class="style26">22</span></td>
                                    <td width="20" rowspan="2" class="style22"><label>
                                            <input name="veindos_re" type="checkbox" value="X" size="1" <%if (rs.getString("veindos_re").equals("X")) {
                                                out.print("checked");
                                            }%>/>
                                        </label></td>
                                    <td width="53" valign="top" class="style22">Semiremolque</td>
                                    <td width="20" rowspan="2" class="style22"><label>
                                            <input name="veindos_se" type="checkbox" value="X" size="1" <%if (rs.getString("veindos_se").equals("X")) {
                                                out.print("checked");
                                            }%>/>
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
                                            <input type="text" name="veindos_rampla" value="<%=rs.getString("veindos_rampla")%>"/>
                                        </div>

                                    </td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td height="96" valign="top"><span class="style22"><span class="style26">23</span> N&deg; de carta porte<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>N&deg; de conhecimiento<br />
                                <input type="text" value="<%=rs.getString("veintres_crt")%>" name="veintres_crt"/>
                            </span></td>
                        <td height="96" colspan="3" valign="top"><span class="style22"><span class="style26">24</span> Aduana de destino / Alfadenga de destino<br />
                                <select name="veicua_aduanadestino"  >
                                    <option>
                                        <%=rs.getString("veicua_aduanadestino")%>
                                    </option>
                                    <%
                                        consulta = "select pais,ciudad,idpais,cod_pais from pais where idpais";
                                        PreparedStatement pspa3 = conex.prepareStatement(consulta);
                                        ResultSet rspa3 = pspa3.executeQuery();
                                        while (rspa3.next()) {
                                    %>
                                    <option>
                                        <%=rspa3.getString("ciudad")%> - <%=rspa3.getString("pais")%>
                                    </option>
                                    <%}%>
                                </select>
                                <label>

                                    <input name="veicua_codigoadu" value="<%=rs.getString("veicua_codigoadu")%>" type="text" size="10" maxlength="10" />

                                </label>
                            </span></td>
                        <td colspan="4" valign="top"><span class="style22"><span class="style26">33</span> Remitente / Remetente</span>
                            <table width="248" border="0">
                                <tr>
                                    <td width="91" class="style29">Razon Social:</td>
                                    <td width="147" class="style23"><label> </label>
                                        <div id="rrz">
                                            <select name="treintres_remitente"  id="razRemitente" onchange="recogerDirPaisOfRemitente()">
                                                <option><%=rs.getString("treintres_remitente")%></option>
                                                <%
                                                    consulta = "select razonSocial from cliente";
                                                    PreparedStatement psre = conex.prepareStatement(consulta);
                                                    ResultSet rsre = psre.executeQuery();
                                                    while (rsre.next()) {
                                                %>
                                                <option>
                                                    <%=rsre.getString("razonSocial")%>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td class="style29">Direccion:</td>
                                    <td class="style23"><label></label>
                                        <div id="rdi">
                                            <input type="text" size="22" value="<%=rs.getString("treintres_direccion")%>" name="treintres_direccion"/>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td height="23" class="style29">Ciudad y Pais: </td>
                                    <td class="style23"><label></label>
                                        <div id="rpa">
                                            <input type="text" size="22" value="<%=rs.getString("treintres_pais")%>"name="treintres_pais"/>
                                        </div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td height="40" valign="top"><span class="style22"><span class="style26">25</span> Moneda / Moeda<br />
                            </span> <span class="style22">
                                <label> </label>
                                <select name="veincin_moneda">
                                    <option><%=rs.getString("veincin_moneda")%></option>
                                    <option>US$</option>
                                    <option>E</option>
                                </select>
                            </span></td>
                        <td height="40" colspan="3" valign="top"><span class="style22"><span class="style26">26</span> Origen de las mercanc&iacute;as / Origem das mercadorias </span> <span class="style22">
                                <br>
                                <select name="veinsei_origenmerca" >
                                    <option>
                                        <%=rs.getString("veinsei_origenmerca")%>
                                    </option>
                                    <%
                                        consulta = "select distinct pais from pais where idpais";
                                        PreparedStatement pspa4 = conex.prepareStatement(consulta);
                                        ResultSet rspa4 = pspa4.executeQuery();
                                        while (rspa4.next()) {
                                    %>
                                    <option>
                                        <%=rspa4.getString("pais")%>
                                    </option>
                                    <%}%>
                                </select>

                                <label>
                                    <input name="veinsei_codmerca" value="<%=rs.getString("veinsei_codmerca")%>"type="text" size="10" maxlength="10" />
                                </label>
                            </span></td>
                        <td colspan="4" valign="top"><span class="style22"><span class="style26">34</span> Destinatario / Destinatario </span>
                            <table width="248" border="0">
                                <tr>
                                    <td width="91" class="style29">Razon Social:</td>
                                    <td width="147" class="style23"><label></label>
                                        <div id="drz">
                                            <select name="treincua_destinatario"  id="razDestinatario" onchange="recogerDirPaisOfDest()">
                                                <option><%=rs.getString("treincua_destinatario")%></option>
                                                <%
                                                    consulta = "select razonSocial from cliente";
                                                    PreparedStatement psde = conex.prepareStatement(consulta);
                                                    ResultSet rsde = psde.executeQuery();
                                                    while (rsde.next()) {
                                                %>
                                                <option>
                                                    <%=rsde.getString("razonSocial")%>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td class="style29">Direccion:</td>
                                    <td class="style23"><label></label>
                                        <div id="ddi">
                                            <input type="text" value="<%=rs.getString("treincua_direccion")%>" size="22" name="treincua_direccion"/>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td height="23" class="style29">Ciudad y Pais: </td>
                                    <td class="style23"><label></label>
                                        <div id="dpa">
                                            <input type="text" value="<%=rs.getString("treincua_pais")%>" size="22"name="treincua_pais"/>
                                        </div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td height="40" valign="top"><span class="style22"><span class="style26">27</span> Valor FCA / Valor FCA<br />
                            <input name="veinsie_valor" value="<%=rs.getString("veinsie_valor")%>"type="text" size="10" maxlength="10" />                    </td>
                        <td colspan="2" valign="top"><span class="style22"><span class="style26">28</span> Flete en USD<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Flete en UsD </span>
                            <input name="veinoch_flete" value="<%=rs.getString("veinoch_flete")%>" type="text" size="10" maxlength="10" />                    </td>
                        <td width="206" valign="top"><span class="style22"><span class="style26">29</span> Seguro en US$<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Seguro em US$<br />
                            <input name="veinnue_seguro" value="<%=rs.getString("veinnue_seguro")%>" type="text" size="10" maxlength="10" />                    </td>
                        <td colspan="3" valign="top"><span class="style22"><span class="style26">35</span> Consignatario/ Consignatario </span>
                            <table width="248" border="0">
                                <tr>
                                    <td width="91" class="style29">Razon Social:</td>
                                    <td width="147" class="style23"><label></label>
                                        <div id="crz">
                                            <select name="treincin_consignatario"  id="razConsignatario" onchange="recogerDirPaisOfCons()">
                                                <option><%=rs.getString("treincin_consignatario")%></option>
                                                <%
                                                    consulta = "select razonSocial from cliente";
                                                    PreparedStatement psco = conex.prepareStatement(consulta);
                                                    ResultSet rsco = psco.executeQuery();
                                                    while (rsco.next()) {
                                                %>
                                                <option>
                                                    <%=rsco.getString("razonSocial")%>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td class="style29">Direccion:</td>
                                    <td class="style23"><label></label>
                                        <div id="cdi">
                                            <input type="text" name="treincin_direccion"value="<%=rs.getString("treincin_direccion")%>" size="22"/>
                                        </div></td>
                                </tr>
                                <tr>
                                    <td height="23" class="style29">Ciudad y Pais: </td>
                                    <td class="style23"><label></label>
                                        <div id="cpa">
                                            <input type="text" value="<%=rs.getString("treincin_pais")%>"name="treincin_pais" size="22"/>
                                        </div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td height="75" valign="top"><span class="style22"><span class="style26">30 </span> Tipo de Bultos<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Tipo dos volumes<br />

                                <select name="trein_tipobulto">
                                    <option><%=rs.getString("trein_tipobulto")%></option>
                                    <%
                                        consulta = "select*from tipo_carga";
                                        PreparedStatement psb = conex.prepareStatement(consulta);
                                        ResultSet rsb = psb.executeQuery();
                                        while (rsb.next()) {
                                    %>
                                    <option>
                                        <%=rsb.getString("glosa")%>
                                    </option>
                                    <%}%>
                                </select>
                                <br><br>
                            <input type="text" name="trein_numero"value="<%=rs.getString("trein_numero")%>"size="5"/>                    </td>
                        <td colspan="2" valign="top">31 Cantidad de bultos &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Quantidade de &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;volumes

                            <input name="treinun_cantidad" value="<%=rs.getString("treinun_cantidad")%>" type="text" size="15" maxlength="15" />                        </td>
                        <td valign="top"><span class="style22"><span class="style26">32 </span>Peso bruto (Kg.)<br />
                                <span class="style16">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>Peso bruto (Kg.)<br />
                            </span>

                            <input name="treindos_peso" value="<%=rs.getString("treindos_peso")%>" type="text" size="10" maxlength="10" />                        </td>
                        <td colspan="3" valign="top"><span class="style22"><span class="style26">36</span> Documentos Anexos/ Documentos Anexos </span>
                            <table width="248" border="0">
                                <tr>
                                    <td width="91" class="style29">DUA:</td>
                                    <td width="147" class="style23"><label></label>
                                        <input type="text" name="treinsei_documento" value="<%=rs.getString("treinsei_documento")%>" /></td>
                                </tr>
                                <tr>
                                    <td class="style29">Fecha:</td>
                                    <td class="style23"><label></label>

                                        <input id="treinsei_fecha" type="month" value="<%=rs.getString("treinsei_fecha")%>" name="treinsei_fecha" placeholder="YYYY-MM-DD" required="required" maxlength="7" />                                </td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td height="40" colspan="4" valign="top"><span class="style22"><span class="style26">37 </span> Numero de precintos / Numero dos lacres<br />
                                <label>
                                    <input type="text" name="treinsie_numprecinto" value="<%=rs.getString("treinsie_numprecinto")%>" />
                                </label>
                            </span></td>
                        <td colspan="4">FACTURA N&deg;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                            <input type="text" value="<%=rs.getString("treinsei_factura")%>"  name="treinsei_factura" />

                            <br><br>
                            CODIGO DE AGENCIA:&nbsp;

                            <input type="text" name="treinsei_codigo" value="<%=rs.getString("treinsei_codigo")%>"/>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text" name="treinsei_texto" value="<%=rs.getString("treinsei_texto")%>" size="5">
                        </td>

                    </tr>
                    <tr>
                        <td height="54" colspan="9" valign="top"><span class="style22"><span class="style26">38 </span> Marcas y numeros de loa bultos, descripcion de las mercader&iacute;as / Marcas e n&uacute;meros dos volumes, desericao das mercador&iacute;as<br />
                            </span> <span class="style23">
                                <label>
                                    <textarea name="treinocho_descripcion" cols="100" rows="4"><%=rs.getString("treinocho_descripcion")%></textarea>
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
                                    <td colspan="2"><textarea cols="40" rows="3" name="cuaren_nrodata"><%=rs.getString("cuaren_nrodata")%></textarea></td>
                                </tr>

                                <tr>
                                    <td class="style23">Chofer</td>
                                    <td class="style23">
                                        <div id="cho">
                                            <select id="chofer" name="idconductor" onchange="llamarAjaxGETlicencia()">
                                                <%
                                                    consulta = "select*from conductor where idconductor=?";
                                                    PreparedStatement pscon = conex.prepareStatement(consulta);
                                                    pscon.setString(1, rs.getString("idconductor"));
                                                    ResultSet rscon = pscon.executeQuery();
                                                    while (rscon.next()) {
                                                %>
                                                <option value="<%=rs.getString("idconductor")%>">
                                                    <%=rscon.getString("nombreconductor")%>&nbsp;
                                                    <%=rscon.getString("apellidopconductor")%>&nbsp;
                                                    <%=rscon.getString("apellidomconductor")%>
                                                </option>
                                                <%}
                                                    consulta = "select*from conductor";
                                                    PreparedStatement pscon2 = conex.prepareStatement(consulta);
                                                    ResultSet rscon2 = pscon2.executeQuery();
                                                    while (rscon2.next()) {
                                                %>
                                                <option value="<%=rscon2.getString("idconductor")%>">
                                                    <%=rscon2.getString("nombreconductor")%>&nbsp;
                                                    <%=rscon2.getString("apellidopconductor")%>&nbsp;
                                                    <%=rscon2.getString("apellidomconductor")%>
                                                </option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style23">RUT:</td>
                                    <td class="style23"><div id="lic">
                                            <select name="select" disabled>
                                                <%
                                                    consulta = "select*from conductor where idconductor=?";
                                                    PreparedStatement pscon3 = conex.prepareStatement(consulta);
                                                    pscon3.setString(1, rs.getString("idconductor"));
                                                    ResultSet rscon3 = pscon3.executeQuery();
                                                    while (rscon3.next()) {
                                                %>
                                                <option><%=rscon3.getString("licenciaconductor")%></option>
                                                <%}%>
                                            </select>
                                        </div></td>
                                </tr>
                            </table></td>
                    </tr>
                    <tr>
                        <td colspan="4" valign="top" bordercolor="1"><p>39 Firma y sello del porteador / Assinatura e canmbo de transportador </p>
                            <p>
                                <label>
                                    <input name="treinnuev_fecha" value="<%=rs.getString("treinnuev_fecha")%>" type="text" id="treinnuev_fecha"/>
                                </label>
                            </p></td>
                        <td height="21" colspan="4" valign="top" bordercolor="1"><p class="style22"><span class="style26">41</span> Firma y sello de la Aduana de Partida / Assignatura e carimbo de Alfadenga de Partida </p>
                            <p class="style22">
                                <label></label>
                            </p></td>
                    </tr>
                    <tr>
                        <th colspan="4" align="right" class="rounded-foot-left">
                            <input type="submit" value="Actualizar" onclick="return confirm('¿Esta seguro de guardar los datos del MIC?')"/>
                        </th>
                        <th colspan="4" class="rounded-foot-right">

                        </th>
                    </tr>
                </table>

                <%}%>
                <input type="hidden" name="accion" value="actualizar"/>
                <input type="hidden" name="idmic" value="<%=rs.getString("idmic")%>"/>
                <%conex.close();%>
            </form>
        </div>
    </body>
</html>
