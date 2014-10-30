<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    consulta = "SELECT (CASE WHEN MONTH(fechafactura)=1 THEN '1' "
            + " WHEN MONTH(fechafactura)=2 THEN '2' "
            + " WHEN MONTH(fechafactura)=3 THEN '3' "
            + " WHEN MONTH(fechafactura)=4 THEN '4' "
            + " WHEN MONTH(fechafactura)=5 THEN '5' "
            + " WHEN MONTH(fechafactura)=6 THEN '6' "
            + " WHEN MONTH(fechafactura)=7 THEN '7' "
            + " WHEN MONTH(fechafactura)=8 THEN '8' "
            + " WHEN MONTH(fechafactura)=9 THEN '9' "
            + " WHEN MONTH(fechafactura)=10 THEN '10' "
            + " WHEN MONTH(fechafactura)=11 THEN '11' "
            + " WHEN MONTH(fechafactura)=12 THEN '12' "
            + "  END) AS mes,   (CASE WHEN MONTH(fechafactura)=1 THEN 'ENERO' "
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
            + "  END) AS mess, YEAR(fechafactura) AS año, SUM(total) AS total, COUNT(numfactura) as cantidad "
            + " FROM factura WHERE estado <> 'ANULADO' GROUP BY mes ORDER BY fechafactura DESC ";
    ps = conex.prepareStatement(consulta);
    rs = ps.executeQuery();
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link href="recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../Js/jquery.js" ></script>
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
        <script language="JavaScript">
<!--
	function newWindow(pagina)
	{
			window.open(pagina, "work", "Menubar=no, status=no, resizable=yes, toolbar=no, scrollbars=yes, top=0, left=0 ");
//			window.open("login.html", windowName, "Menubar=no, status=no, resizable=yes, toolbar=no, scrollbars=yes, top=0, left=0,width=" + w + ",height=" + h );
	}
//-->

</script>


    </head>
    <body>
        <br>
        <div align="center">
            <form name="formBus" action="gasto_list_search.jsp" method="get">
                <table width="729" id="rounded-corner">
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-company"></th>
                        <th colspan="2" class="rounded-q4"></th>
                    </tr>
                    <tr id="rounded-buscar">
                        <th class="rounded-foot-left" colspan="2" align="right">ESTADISTICA-FACTURAS</th>
                        
                        <th  class="rounded-foot-right" align="right" style="margin-left: 100px" colspan="2">
                            
                            <a href="factura_estadistica.jsp" title="Reporte Gral Factura"><img src="../../imagenes/icons/home.png" height="45" width="45" alt=""/></a>&nbsp;
                            <a href="factura_estadistica_cancelado.jsp" title="Cancelados"><img src="../../imagenes/icons/pago.png" style="margin-bottom: 4px" height="38" width="38" alt=""/>[CANCELADO]</a>&nbsp;&nbsp;
                            <a href="factura_estadistica_porcancelar.jsp" title="Por Cancelar"><img src="../../imagenes/icons/deben.png" style="margin-bottom: 4px" height="38" width="38" alt=""/>[EN ESPERA]</a>
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </th>
                    </tr>
                </table>
            </form>
            
            <div id="contenedor" style="display:none"></div>
            <table width="647" align="center" id="rounded-corner" border="0">
                <thead>
                    <tr>
                        <th class="rounded-company" colspan="4" align="center"></th>
                        <th colspan="1" class="rounded-q4"></th>
                    </tr>
                    <tr>
                        <th width="180">AÑO</th>
                        <th width="221">MES</th>
                        <th width="483">TOTAL</th>
                        <th width="300">CANTIDAD EMITIDOS </th>
                        <th width="300">DETALLE</th>

                    </tr>
                </thead>
                <% while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("año")%></td>
                    <td><%=rs.getString("mess")%></td>
                    <td><%=rs.getString("total")%></td>
                    <td><%=rs.getString("cantidad")%></td>
                    <td>
                    <a href=javascript:newWindow("factura_estadistica_listar.jsp?accion=listar&mes=<%=rs.getString("mes") %>") title="listar">
                      VER DETALLE
                    </a>
                    
                    </td>
                </tr>
                <%}conex.close();%>
            </table>
        </div>
                <%conex.close();%>
    </body>
</html>