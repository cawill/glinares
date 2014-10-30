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
String idBoleta="";
String fechaNum="";
String cliente="";
String direccion="";
String ruc="";
String serie="";
String numero="";
String total="";
String son="";
String fechaL="";
String estado="";
String fechaCl="";
String descBoleta="";

try{
consulta="select b.idboleta,b.fechaelaboleta,c.razonSocial,c.ruc,b.serieboleta," +
        "b.numboleta,b.total,b.son,b.fechaLetras,b.estado,b.fechaCancelLetras," +
        "d.direccion,b.descripcionboleta " +
        "from boleta b " +
        "inner join cliente c " +
        "inner join detalleCliente d " +
        "on c.idCliente=b.idCliente " +
        "and c.idCliente=d.idCliente " +
        "where b.idboleta=?";
ps=conex.prepareStatement(consulta);
ps.setString(1, request.getParameter("idboleta"));
rs=ps.executeQuery();
 
while(rs.next()){
idBoleta=rs.getString("idboleta");
fechaNum=rs.getString("fechaelaboleta");
cliente=rs.getString("razonSocial");
direccion=rs.getString("direccion");
ruc=rs.getString("ruc");
serie=rs.getString("serieboleta");
numero=rs.getString("numboleta");
total=rs.getString("total");
son=rs.getString("son");
fechaL=rs.getString("fechaLetras");
estado=rs.getString("estado");
fechaCl=rs.getString("fechaCancelLetras");
descBoleta=rs.getString("descripcionboleta");
}

}catch(Exception e){out.print("Error: " + e.getMessage());}
%>
<%

consulta="select d.cantidad,d.descripcion,d.importe " +
        "from detalleBoleta d inner join boleta b " +
        "on d.idboleta=b.idboleta where b.idboleta=? ORDER BY d.idDetalleBoleta";
PreparedStatement psd=conex.prepareStatement(consulta);
psd.setString(1, request.getParameter("idboleta"));
ResultSet rsd=psd.executeQuery();

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">

    </head>
    <body>
        <br>
        <div align="center">
            <table width="650" id="rounded-corner-comp">
                <tr>
                    <th class="rounded-company" colspan="2"></th>
                    <th colspan="2" style="padding: 7px"><div align="left">BOLETA DE VENTA</div></th>
                    <th class="rounded-q4" colspan="2"></th>
                </tr>
                <tr>
                    <th align="right" height="26" colspan="2" >
                            Fecha:
                    </th>
                    <th width="120" >
                        <input name="txtFechaBoleta" type="text"  value="<%=fechaNum%>">
                    </th>
                    <th colspan="2" >
                        <div align="right">
                            Serie:
                            <input name="txtSerieBoleta" type="text"  value="001" size="3">
                        </div>
                    </th>
                    <th width="119" colspan="1" >
                        <div align="center" >
                            <div align="left">N<b>°</b>
                                <input type="text" name="txtNumBoleta"size="6" value="<%=numero%>"/>
                            </div>
                        </div>
                    </th>
                </tr>
                <tr>
                    <th  width="44" ><div align="center" >
                            <div align="right">Cliente:</div>
                        </div>
                    </th>
                    <th  width="219" ><div align="left" >
                            <div>
                                <input type="text" size="50"name="" value="<%=cliente%>"/>
                            </div>
                        </div>
                    </th>
                    <th  colspan="5">
                        Fecha:
                        <input name="txtFechaLetras" type="text" size="50" value="<%=fechaL%>"/>
                    </th>
                </tr>
                <tr>
                    <th >
                        <div align="center" >
                            Direccion:
                        </div>
                    </th>

                    <th >
                        <input type="text" size="41" value="<%=direccion%>" disabled/>
                    </th>

                    <th colspan="5" >
                            Ruc:&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="text"  value="<%=ruc%>" disabled/>
                    </th>
                </tr>
                <tr>
                    <th ><div align="center" >Cant.</div></th>
                    <th colspan="3" ><div align="center" >Descripcion</div></th>
                    <th width="119" ><div align="center" >P. Unit. </div></th>
                    <th ><div align="center" >Total</div></th>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3"><textarea name="txtDescripcionBoleta" cols="44" rows="1"><%=descBoleta%></textarea></td>
                    <td></td>
                    <td></td>
                </tr>
                    <%
                    try{
                    while(rsd.next()){
                    %>
                <tr>
                    <td><%=rsd.getString("cantidad")%></td>
                    <td colspan="3" ><%=rsd.getString("descripcion")%></td>
                    <td>&nbsp;</td>
                    <td><%=rsd.getString("importe")%></td>
                </tr>
                <%}}catch(Exception e){out.print("Error : " + e.getMessage());}%>
                <tr>
                    <td colspan="5"align="right" >Total</td>
                    <td colspan="1" align="right" ><div align="left" >
                            <input name="txtTotal" type="text"  value="<%=total%>" size="10" maxlength="10"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th colspan="7" >
                        <div align="left" >Son:
                            <input name="txtSon" type="text"  value="<%=son%>" size="117" maxlength="117">
                        </div>
                    </th>
                </tr>
                <tr>
                    <th colspan="2" >
                            Estado:
                            <input type="text" name="txtEstado" value="<%=estado%>">
                    </th>
                    <th colspan="5" >
                            <input name="txtFechaCancelLetras" value="<%=fechaCl%>" type="text"  size="62">
                    </th>
                </tr>
                <tr>
                    <th colspan="3" class="rounded-foot-left">
                    </th>
                    <th colspan="3" class="rounded-foot-right"></th>
                </tr>
            </table>
        </div>
   
        <%conex.close();%>
    </body>
</html>
