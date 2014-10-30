<%@page import="utils.FechaSistema"%>
<%@include file="../conexion.jsp"%>
<%-- 
    Document   : FormCrt
    Created on : 21/12/2011, 04:51:41 PM
    Author     : william
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%
    consulta = "select CONCAT(razonsocial,' ---- : ',Pais,' : ',departamento) as razonsocial,idcliente  from cliente "
            + " ORDER BY razonsocial ASC ";
    ps = conex.prepareStatement(consulta);
    ResultSet rst = ps.executeQuery();
%>
<%
    consulta = "select CONCAT(razonsocial,' ---- : ',Pais,' : ',departamento) as razonsocial,idcliente  from cliente "
            + " ORDER BY razonsocial ASC ";
    ps = conex.prepareStatement(consulta);
    ResultSet rrst = ps.executeQuery();
%>
<%
    consulta = "select CONCAT(razonsocial,' ---- : ',Pais,' : ',departamento) as razonsocial,idcliente  from cliente "
            + " ORDER BY razonsocial ASC";
    ps = conex.prepareStatement(consulta);
    ResultSet rrrst = ps.executeQuery();
%>
<%
    consulta = "select CONCAT(razonsocial,' ---- : ',Pais,' : ',departamento) as razonsocial,idcliente  from cliente "
            + "ORDER BY razonsocial ASC";
    ps = conex.prepareStatement(consulta);
    ResultSet notificar = ps.executeQuery();
%>

<%--seleccion pais --%>

<%
    consulta = "SELECT CONCAT(pais,'   ' ,' /','   ',ciudad) AS ubicacion, idPais FROM pais";
    ps = conex.prepareStatement(consulta);
    ResultSet paiss = ps.executeQuery();
%>

<%
    consulta = "SELECT CONCAT(pais,'   ' ,' /','   ',ciudad) AS ubicacion, idPais FROM pais";
    ps = conex.prepareStatement(consulta);
    ResultSet paisss = ps.executeQuery();
%>
<%
    consulta = "SELECT CONCAT(pais,'   ' ,' /','   ',ciudad) AS ubicacion, idPais FROM pais";
    ps = conex.prepareStatement(consulta);
    ResultSet paissss = ps.executeQuery();
%>

<%
    consulta = "SELECT d.direccion,c.idcliente"
            + "FROM detallecliente d "
            + "INNER JOIN cliente c "
            + "ON c.idcliente=d.idcliente "
            + "WHERE c.idcliente=?;";
    PreparedStatement ps2 = conex.prepareStatement(consulta);
    ps2.setString(1, request.getParameter("idcliente"));

%>
<%
    FechaSistema fecha = new FechaSistema();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="../../Js/datapicker/jquery.tools.min.js"></script>
        <script>
            $( function () {
                if( !navigator.userAgent.match( /(iPhone|iPod|iPad)/i ) ) {
                    $("#fechaemision_5").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#fecha_21").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#fechaporteador_23").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#fechadestin_24").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#fechaport_7").dateinput( { format: 'yyyy-mm-dd' } );
                    $("#form1").validator();
                }
            } );
        </script>

        <link rel="stylesheet" type="text/css" href="../../Js/datapicker/skin1.css" />

        <link rel="stylesheet" type="text/css" href="../../recursos/css/stylelp1.css" ></link>
        <link  rel="stylesheet" href="../../css/ultimate.css" type="text/css" media="all">

        <script type="text/javascript">
            function requerir(){
                try{
                    req=new XMLHttpRequest();
                }catch(err1){
                    try{
                        req=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(err2){
                        try{
                            req=new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(err3){
                            req=false;
                        }
                    }
                }
                return req;
            }

            var peticion=requerir();

            function llamarAjaxGETdireccionRem()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("idcliente").value;
                var url="direccionRem.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdireccionRem;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            function llamarAjaxGETpaisRem()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("idcliente").value;
                var url="paisRem.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdipaisRem;
                
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            function respuestaAjaxdireccionRem()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("dirR").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }
            function respuestaAjaxdipaisRem()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("paisRem").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }
            //-----------------------destinatario--------
            function llamarAjaxGETdireccionDest()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("destinatario_4").value;
                var url="direccionDest.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdireccionDest;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            
            function respuestaAjaxdireccionDest()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("dirDest").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }
            function llamarAjaxGETpaisDest()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("destinatario_4").value;
                var url="paisDest.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdipaisDest;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            function respuestaAjaxdipaisDest()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("paisDest").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }
            
            //-----------------------consignatario--------
            function llamarAjaxGETdireccionConsig()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("consignatario_6").value;
                var url="direccionConsig.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdireccionConsig;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            
            function respuestaAjaxdireccionConsig()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("dirConsig").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }
            function llamarAjaxGETpaisConsig()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("consignatario_6").value;
                var url="paisConsig.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdipaisConsig;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            function respuestaAjaxdipaisConsig()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("paisConsig").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }
            //-----------------------notoficar--------
            function llamarAjaxGETdireccionNot()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("notificar_9").value;
                var url="direccionNot.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdireccionNot;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            
            function respuestaAjaxdireccionNot()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("dirNot").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }
            function llamarAjaxGETpaisNot()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("notificar_9").value;
                var url="paisNot.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdipaisNot;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }
            function respuestaAjaxdipaisNot()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("paisNot").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }


           
            function currencyFormat(fld, milSep, decSep, e) {
                var sep = 0;
                var key = '';
                var i = j = 0;
                var len = len2 = 0;
                var strCheck = '0123456789';
                var aux = aux2 = '';
                var whichCode = (window.Event) ? e.which : e.keyCode;
                if (whichCode == 13) return true;  // Enter
                key = String.fromCharCode(whichCode);  // Get key value from key code
                if (strCheck.indexOf(key) == -1) return false;  // Not a valid key
                len = fld.value.length;
                for(i = 0; i < len; i++)
                    if ((fld.value.charAt(i) != '0') && (fld.value.charAt(i) != decSep)) break;
                aux = '';
                for(; i < len; i++)
                    if (strCheck.indexOf(fld.value.charAt(i))!=-1) aux += fld.value.charAt(i);
                aux += key;
                len = aux.length;
                if (len == 0) fld.value = '';
                if (len == 1) fld.value = '0'+ decSep + '0' + aux;
                if (len == 2) fld.value = '0'+ decSep + aux;
                if (len > 2) {
                    aux2 = '';
                    for (j = 0, i = len - 3; i >= 0; i--) {
                        if (j == 3) {
                            aux2 += milSep;
                            j = 0;
                        }
                        aux2 += aux.charAt(i);
                        j++;
                    }
                    fld.value = '';
                    len2 = aux2.length;
                    for (i = len2 - 1; i >= 0; i--)
                        fld.value += aux2.charAt(i);
                    fld.value += decSep + aux.substr(len - 2, len);
                }
                return false;
            }
            

        </script>
    </head>
    <body>
        <script language="javascript"> 
            function addTotals() { 
                with (document.forms["form1"])
                {
                    var totalResult = Number( montoremitente_15a.value ) + Number( montoremitente_15b.value ); 
                    totalremitente_15.value = roundTo( totalResult, 2 ); 
                }
            } 
            function addTotals2() { 
                with (document.forms["form1"])
                {
                    var totalResult = Number( monto_15a.value ) + Number( monto_15b.value ); 
                    totalmonto_15.value = roundTo( totalResult, 2 ); 
                }
            } 
            function roundTo(num,pow){ 
                if( isNaN( num ) )
                { 
                    num = 0; 
                } 
                num *= Math.pow(10,pow); 
                num = (Math.round(num)/Math.pow(10,pow))+ "" ; 
                if(num.indexOf(".") == -1) 
                    num += "." ; 
                while(num.length - num.indexOf(".") - 1 < pow) 
                    num += "0" ; 

                return num; 
            } 
        </script>

        <br/><br/>
        <div align="center">
            <form action="crt_save.jsp" method="post" enctype="Application/x-www-form-urlencoded" name="form1" id="form1">



                <table id="rounded-corner" width="887" border="0" align="center">
                    <%--CABECERA --%>
                    <tr>
                        <th class="rounded-company" colspan="1"></th>
                        <th class="rounded-q4" colspan="5"><h2 align="left">CRT</h2>
                    <br/>
                    CARTA DE PORTE INTERNACIONAL POR CARRETERA <br />
                    CONHECIMIENTO DE TRASPORTE INTERNACIONAL DE RODOVIO
                    <br/><br/>
                    <input name="Submit" type="submit"  value="Guardar"/>
                    &nbsp;&nbsp;&nbsp;
                    <input name="Submit23" type="reset" value="Cancelar"/>                    </th>
                    </tr>
                    <%--FIN CABECERA --%>
                    <tr>
                        <td colspan="5"><p><span class="style14">1 Nombre y domicilio del remitente </span>    
                            <p>
                                <%--1 NOMBRE DOMICILIO DEL REMITENTE --%>
                                <%--
                                <select name="idcliente" id="idcliente" onchange="form1.submit()">
                                  <option  value="">---Seleccione---</option>
                              <%while(rst.next()){%>
                                  <option label="<%=rst.getString("razonSocial")%>" value="<%=rst.getString("idcliente")%>">
                                                 <%=rst.getString("razonSocial")%></option>
                                  <%}%>
                              </select>
                                --%>

                                <%------------%>
                            <div id="cli" style="width:150px; ">
                                <select name="idcliente" id="idcliente" onChange="llamarAjaxGETdireccionRem()" class="textImput" >
                                    <option>Seleccione Remitente</option>
                                    <%while (rst.next()) {%>
                                    <option value="<%=rst.getString("idcliente")%>"> <%=rst.getString("razonsocial")%> </option>
                                    <%}%>
                                </select>
                            </div>
                            <br></p>      </td>
                        <td colspan="2">
                    <center>
                        <p align="left"><span class="style14">2 N&uacute;mero </span></p>
                        <p>
                            <input name="numero_2" type="text" id="numero_2" value="/2012-PE" size="30" class="textImput"/>
                        </p>
                        <p>
                            <textarea name="detalle_transportista" cols="40" rows="4" id="detalle_transportista" class="textImput">
        GRUPO LINARES S.A.
        
                            </textarea>
                        </p>
                    </center></td>
                    </tr>

                    <tr>
                        <td colspan="5"><div align="left"><span class="style14">4 Nombre y domicilio del destinatario</span></div>
                            <p>
                            <div id="dest" style="width:150px; ">
                                <select name="destinatario_4" id="destinatario_4" onChange="llamarAjaxGETdireccionDest()" class="textImput" >
                                    <option>Seleccione Remitente</option>
                                    <%while (rrst.next()) {%>
                                    <option value="<%=rrst.getString("idcliente")%>"> <%=rrst.getString("razonsocial")%>                    </option>
                                    <%}%>
                                </select>
                                </p>
                            </div> </td>
                        <td colspan="2" rowspan="3"><p align="left"><span class="style14">5 Lugar y pais de emisi&oacute;n </span></p>
                            <p>
                                <select name="idpais" size="1" id="idpais" class="textImput">
                                    <option  value="">---Seleccione---</option>
                                    <%while (paiss.next()) {%>
                                    <option label="<%=paiss.getString("ubicacion")%>" value="<%=paiss.getString("idPais")%>">
                                        <%=paiss.getString("ubicacion")%></option>
                                        <%}%>
                                </select>
                                <input name="fechaemision_5" type="text" class="textImput" id="fechaemision_5" value="<%=fecha.fecha()%>" size="20" />
                            </p>
                            <p><span class="style14">7 Lugar, pa&iacute;s y fecha en que el portador se hace cargo del as mecancias </span> </p>
                            <p>
                                <select name="lugarporteador_7" size="1" id="lugarporteador_7" class="textImput">
                                    <option  value="">---Seleccione---</option>
                                    <%while (paisss.next()) {%>
                                    <option label="<%=paisss.getString("ubicacion")%>" value="<%=paisss.getString("idPais")%>"> <%=paisss.getString("ubicacion")%></option>
                                    <%}%>
                                </select>
                                <input name="fechaport_7" type="text" class="textImput" id="fechaport_7" value="<%=fecha.fecha()%>" size="20" />
                            </p>
                            <p>8 Lugar, pa&iacute;s y plazo de entrega </p>
                            <p>
                                <select name="lugarentrega_8" size="1" id="lugarentrega_8" class="textImput">
                                    <option  value="">---Seleccione---</option>
                                    <%while (paissss.next()) {%>
                                    <option label="<%=paissss.getString("ubicacion")%>" value="<%=paissss.getString("idPais")%>"> <%=paissss.getString("ubicacion")%></option>
                                    <%}%>
                                </select>
                            </p>
                            <p>10 Porteadores sucesivos </p>
                            <p>
                                <input name="porteadorsucesivo_10" type="text" id="porteadorsucesivo_10" size="50" class="textImput"/></p>
                        </td>
                    </tr>

                    <tr>
                        <td height="53" colspan="5"><p><span class="style14">6 Nombre y domicilio del Consignatario </span>
                            <div id="consig" style="width:150px; ">
                                <select name="consignatario_6" id="consignatario_6" onChange="llamarAjaxGETdireccionConsig()" class="textImput" >
                                    <option>Seleccione Remitente</option>
                                    <%while (rrrst.next()) {%>
                                    <option value="<%=rrrst.getString("idcliente")%>"> <%=rrrst.getString("razonsocial")%>                    </option>
                                    <%}%>
                                </select>
                                </p>
                            </div></td>
                    </tr>



                    <tr>
                        <td height="79" colspan="5"><p><span class="style14">9 Notificar a: </span>
                            <div id="notific" style="width:150px; ">
                                <select name="notificar_9" id="notificar_9" onChange="llamarAjaxGETdireccionNot()" class="textImput" >
                                    <option>Seleccione Remitente</option>
                                    <%while (notificar.next()) {%>
                                    <option value="<%=notificar.getString("idcliente")%>"> <%=notificar.getString("razonsocial")%>                    </option>
                                    <%}%>
                                </select>
                            </div>        </td>
                    </tr>



                    <%--11 DETALLES --%>
                    <%--11 DETALLES --%>
                    <%--11 DETALLES --%>
                    <%--11 DETALLES --%>
                    <tr>
                        <td colspan="5"><span class="style14">11 Cantidad y clase de bultos, marcas y n&uacute;meros tipo de mercanc&iacute;as, contenedores y accesorios </span></td>
                        <td width="347"><span class="style14">12. Peso</span></td>
                    <tr>
                      <td height="113" colspan="5" rowspan="5">
                            <textarea name="detallebultos_11" cols="80" rows="20" id="detallebultos_11" class="textImput" onChange="javascript:this.value=this.value.toUpperCase();"></textarea></td>
                        <td height="30"><center>
                        <input name="pesobruto_12" type="text" id="pesobruto_12" size="25" class="textImput" />
                    </center></td>
                    <tr>
                        <td height="24"><span class="style14">13. Vol&uacute;men</span></td>
                    <tr>
                        <td height="30"><center>
                        <input name="volumen_13" type="text" id="volumen_13" size="25" class="textImput" />
                    </center></td>
                    <tr>
                        <td height="24"><span class="style14">14. Valor</span></td>
                    <tr>
                        <td height="58"><center>
                        <input name="valor_14" type="text"  size="25" class="textImput"/>
                        <br>
                        <br>

                        <input name="moneda_14" type="text" value="US$"  size="25" class="textImput"/> </center></td>
                    <tr>
                        <td width="174"><span class="style14">15. Gastos a pagar </span></td>
                        <td width="137"><div align="center"><span class="style17">Monto remitente </span></div></td>
                        <td width="78"><div align="center"><span class="style17">Moneda</span></div></td>
                        <td width="137"><div align="center"><span class="style17">Monto destinatario </span></div></td>
                        <td width="58" col><div align="center"><span class="style17">Modeda</span></div></td>
                        <td colspan="2"><span class="style14">16. Declaracion del valor de las mercancias </span></td>
                    </tr>
                    <tr>
                        <td height="147" rowspan="2"><p><input name="gastos_15" type="text" id="gastos_15" value="COLLECT" size="15" class="textImput"/>
                            </p>
                            <p class="style14">Otros:</p></td>
                        <td rowspan="2">
                            <p>
                                <textarea name="remitente_15a" cols="15" rows="2" id="remitente_15a" class="textImput" maxlength="20"></textarea>
                                <textarea name="remitente_15b" cols="15" rows="2" id="remitente_15b" class="textImput"></textarea>
                            </p>
                            <p>
                                <input onKeyUp="addTotals()" name="montoremitente_15a" type="text" id="montoremitente_15a" size="15" class="textImput" />
                                <input onKeyUp="addTotals()" name="montoremitente_15b" type="text" id="montoremitente_15b" size="15" class="textImput" />
                            </p></td>
                        <td rowspan="2">
                            <input name="monedaA1" type="text" id="monedaA1" value="NOT"  size="10" class="textImput"/>
                            <input name="monedaA2" type="text" id="monedaA2" value="NOT" size="10" class="textImput"/>      </td>
                        <td rowspan="2"><p>
                                <textarea name="destinatario_15a" cols="15" rows="2" id="destinatario_15a" class="textImput"></textarea>
                                <textarea name="destinatario_15b" cols="15" rows="2" id="destinatario_15b" class="textImput"></textarea>
                            </p>
                            <p>
                                <input onKeyUp="addTotals2()" name="monto_15a" type="text" id="monto_15a" size="15" class="textImput"/>
                                <input onKeyUp="addTotals2()" name="monto_15b" type="text" id="monto_15b" size="15" class="textImput"/>
                            </p></td>
                        <td rowspan="2"><input name="monedaB1" type="text" id="monedaB1" value="NOT" size="6" class="textImput"/>
                            <input name="monedaB2" type="text" id="monedaB2" value="NOT" size="6" class="textImput"/></td>

                        <td height="30" colspan="2"><input name="valormercancia_16" type="text" id="valormercancia_16" size="25" class="textImput"/></td>
                    </tr>
                    <tr>
                        <td height="97" colspan="2"><p class="style14">17. Documento anexos </p>
                            <p class="style14">
                                <textarea name="anexos_17" cols="40" rows="3" class="textImput" id="anexos_17"></textarea>
                            </p></td>
                    </tr>

                    <tr>
                        <td>Total</td>
                        <td><input name="totalremitente_15" type="text" id="totalremitente_15" size="15" class="textImput"/></td>
                        <td><input name="moneda_15a" type="text" id="moneda_15a" value="US$" size="10" class="textImput"/></td>
                        <td><input name="totalmonto_15" type="text" id="totalmonto_15" size="15" class="textImput"/></td>
                        <td><input name="moneda_15b" type="text" id="moneda_15b" value="US$" size="6" class="textImput"/></td>
                        <td colspan="2" rowspan="5"><span class="style14">18. Insurecciones sobre formalidades de aduana </span>
                            <p>
                                <textarea name="instruccionesaduana_18" cols="40" rows="4" id="instruccionesaduana_18" class="textImput"></textarea>
                            </p></td>
                    </tr>
                    <tr>
                        <td height="24" colspan="5"><span class="style14">19 Monto del flete externo</span></td>
                    </tr>
                    <tr>
                        <td height="28" colspan="5">
                            <input name="montofleteextern_19" type="text" id="montofleteextern_19" size="25" class="textImput"/></td>
                    </tr>
                    <tr>
                        <td colspan="5"><span class="style14">20 Monto de rembolso contra entrega </span></td>
                    </tr>
                    <tr>
                        <td height="28" colspan="5">
                            <input name="montorembolso_20" type="text" size="80" class="textImput"/></td>
                    </tr>
                    <tr>
                        <td colspan="5"><span class="style14">21 Nombre y firma del remitente o su representante </span></td>
                        <td colspan="2" rowspan="4">
                            <p><span class="style14">22 Declaraciones y observaciones</span> </p>          <p>
                                <textarea name="declaraciones_22" cols="40" rows="4" class="textImput" id="declaraciones_22">SEGURO POR CUENTA DEL EXPORTADOR
O IMPORTADOR, SIN ULTERIO PERJUICIO NI
REPETICION POR PARTES DEL TRANSPORTISTA.
DEMORAS EN ADUANA SUPERIORES A 48 HORAS
DEVENGARA UN COSTO POR SOBRE ESTADIA
DE US$ 250 POR DIA CAMION.</textarea>
                            </p></td>
                    </tr>
                    <tr>
                        <td height="93" colspan="5"><p>
                                <textarea name="nombrefirmaremitente_21" cols="65" rows="3" id="nombrefirmaremitente_21" class="textImput"></textarea>
                            </p>
                            <p><span class="style14">Fecha</span><span class="style27">:</span>
                                <span class="style27">
                                    <input name="fecha_21" type="text" id="fecha_21" value="" size="30" placeholder="yyyy-mm-dd" class="textImput"/>
                                </span></p></td>
                    </tr>

                    <tr>
                        <td colspan="5"><span class="style14">23 Nombre, firma y sello del porteador o su representante </span></td>
                    </tr>
                    <tr>
                        <td height="24" colspan="5" rowspan="3">
                            <textarea name="nombreporteador_23" cols="65" rows="3" id="nombreporteador_23" class="textImput"></textarea></td>
                    </tr>
                    <tr>
                        <td height="31" colspan="2"><span class="style14">24 Nombre y firma del destinatario o su representante </span></td>
                    </tr>
                    <tr>
                        <td height="77" colspan="2">
                            <textarea name="nombrefirmadestin_24" cols="40" rows="4" id="nombrefirmadestin_24" class="textImput"></textarea></td>
                    </tr>
                    <tr>
                        <td height="23" colspan="5"><span class="style14">Fecha:
                                <input name="fechaporteador_23" type="text" id="fechaporteador_23" value="<%=fecha.fecha()%>" size="30" class="textImput"/>
                            </span></td>
                        <td width="347" height="23"  colspan="2"><span class="style14">Fecha/date
                                <input name="fechadestin_24" type="text" id="fechadestin_24" value="" placeholder="yyyy-mm-dd" size="30" class="textImput"/>
                            </span></td>
                    </tr>
                    <tr>
                        <th height="23" class="rounded-foot-left" colspan="5">
                            <input name="Submit2" type="submit" class="style26" value="Guardar CRT"/>
                            <input name="Submit22" type="reset" class="style26" value="Cancelar"/>                        </th>
                        <th colspan="1" class="rounded-foot-right"></th>
                    </tr>
                </table>
                <input type="hidden" name="accion" value="guardar">

            </form> 
        </div>    

    </body>
</html>
