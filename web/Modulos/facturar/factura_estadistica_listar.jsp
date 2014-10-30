<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp" %>
<%@page import="utils.ConvertSLL" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
   int i = 0;
    consulta = "SELECT CONCAT(fac.seriefactura,'-',fac.numfactura) AS numero, fac.fechafactura AS mes, cli.razonSocial AS rsocial, fac.subtotal, fac.igv, fac.total, fac.moneda "
            + " FROM factura fac INNER JOIN cliente cli ON cli.idcliente= fac.idcliente WHERE MONTH(fac.fechafactura)=? ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("mes"));
    rs = ps.executeQuery();
%>

<%
   consulta = "SELECT (CASE WHEN MONTH(fechafactura)=1 THEN 'ENERO' "
            + " WHEN MONTH(fechafactura)=2 THEN 'FEBRERO' "
            + " WHEN MONTH(fechafactura)=3 THEN 'MARZO' "
            + " WHEN MONTH(fechafactura)=4 THEN 'ABRIL' "
            + " WHEN MONTH(fechafactura)=5 THEN 'MAYO' "
            + " WHEN MONTH(fechafactura)=6 THEN 'JUNIO' "
            + " WHEN MONTH(fechafactura)=7 THEN 'JULIO' "
            + " WHEN MONTH(fechafactura)=8 THEN 'AGOSTO' "
            + " WHEN MONTH(fechafactura)=9 THEN 'SETIEMBRE' "
            + " WHEN MONTH(fechafactura)=10 THEN 'OCTUBRE' "
            + " WHEN MONTH(fechafactura)=11 THEN 'NOVIEMBRE' "
            + " WHEN MONTH(fechafactura)=12 THEN 'DICIEMBRE' "
            + "  END) AS mes, year(fechafactura) as anio "
            + " FROM factura  WHERE MONTH(fechafactura)=? ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("mes"));
    ResultSet rs1 = ps.executeQuery();
%>

<%
   consulta = "SELECT  sum(total) as total"
            + " FROM factura  WHERE MONTH(fechafactura)=? AND moneda = 'US$'";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("mes"));
    ResultSet rs2 = ps.executeQuery();
%>
<%
   consulta = "SELECT  sum(total) as total"
            + " FROM factura  WHERE MONTH(fechafactura)=? AND moneda = 'S/.'";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("mes"));
    ResultSet rs4 = ps.executeQuery();
%>
<%
   consulta = "SELECT  COUNT(idcliente) as cliente"
            + " FROM factura  WHERE MONTH(fechafactura)=? ";
    ps = conex.prepareStatement(consulta);
    ps.setString(1, request.getParameter("mes"));
    ResultSet rs3 = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Grupo Linares S.A.</title>
        <link  rel="stylesheet" href="../../css/ultimate.css" type="text/css" media="all">
        <script type="text/javascript" src="../../Js/jquery.js" ></script>
        <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"gasto_add_prov_fm.jsp",
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
            <h1>
                
                <table width="931" border="0">
                    <thead>
                        <tr>
                            <th width="322">
                                <div align="left">
                                    <img src="../../imagenes/gl_presentation/logo.png" width="212" height="80" alt="logogl"/>                                </div>                          </th>
                            <th width="239"> REPORTE  -  FACTURAs</th>
                            <th width="356"><%rs1.next();%>
                <%=rs1.getString("mes")%> - <%=rs1.getString("anio")%></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td><div align="center">
                              <input type="button" name="imprimir" value="Imprimir" onClick="window.print();">
                            </div></td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
              </table>

            </h1> 
                        
                        <h1>
                            <table border="0">
                    <thead>
                        <tr>
                            <th>
                              <div align="right">MONTO TOTAL  US$:&nbsp;</div></th>
                            <th>
                              <div align="right">
                                  <%ConvertSLL convert = new ConvertSLL();%>
                                <%rs2.next();%>
                                <%=convert.numberFormat("###,###.00", rs2.getDouble("total"))%>
                              </div></th>
                            <th>  </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th>
                              <div align="right">MONTO TOTAL  S/.:&nbsp;</div></th>
                            <th>
                              <div align="right">
                               <%rs4.next();%>
                                <%=convert.numberFormat("###,###.00", rs4.getDouble("total"))%>
                              </div></th>
                            
                        </tr>
                        <th>
                        <tr>
                            <td><div align="right">FACTURA EMITIDAS:&nbsp;</div></td>
                            <td><div align="right">
                              <%rs3.next();%>
                              <%=rs3.getString("cliente")%>
                            </div></td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
              </table>
                            
                        </h1>
                        
           
            <br>
        </div>
        <br>
        <div align="center">
            <form name="formBus" action="gasto_list_search.jsp" method="get">
                <table width="729" id="rounded-corner">
                    <tr id="rounded-buscar">
                        
                        
                        <th colspan="2" class="rounded-company"></th>
                        <th colspan="2" class="rounded-q4"></th>
                    </tr>
                    
                </table>
            </form>
            <br><br>
            <div id="contenedor" style="display:none"></div>
            <table width="949" align="center" id="rounded-corner" border='0'>
                <thead>
                    <tr>
                        <th class="rounded-company" colspan="7" align="center"></th>
                        <th colspan="1" class="rounded-q4"></th>
                    </tr>
                    <tr>
                        <th width="23">#</th>
                        <th width="102">NRO.FACTURA</th>
                        <th width="90">FECHA</th>
                        <th width="399">RAZON SOCIAL</th>
                        <th width="102"><div align="right">SUB TOTAL</div></th>
                        <th width="69"><div align="right">IGV</div></th>
                        <th width="85"><div align="right">TOTAL</div></th>
                        <th width="5"><div align="right"></div></th>
                    </tr>
                </thead>
                <% while (rs.next()) {%>
                <%ConvertSLL convertt = new ConvertSLL();%>
                <tr>
                     <td><%=++i%></td>
                    <td><%=rs.getString("numero")%></td>
                    <td><%=rs.getString("mes")%></td>
                    <td><%=rs.getString("rsocial")%></td>
                    <td><div align="right"><%=convertt.numberFormat("###,###.00", rs.getDouble("subtotal"))%></div></td>
                    <td><div align="right"><%=convertt.numberFormat("###,###.00", rs.getDouble("igv"))%></div></td>
                    <td><div align="right"><%=convertt.numberFormat("###,###.00", rs.getDouble("total"))%></div></td>
                    <td><div align="right"><%=rs.getString("moneda")%></div></td>
                </tr>
                <%} conex.close();%>
          </table>
        </div>
          <%conex.close();%>
    </body>
</html>