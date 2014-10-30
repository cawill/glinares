<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
        
consulta = "SELECT CONCAT(f.seriefactura,' ','-',' ',f.numfactura) AS nrofactura, "
        + "DAY(f.fechafactura) AS dia,(CASE WHEN MONTH(f.fechafactura)=1 THEN 'ENERO' WHEN MONTH(f.fechafactura)=2 THEN 'FEBRERO' WHEN MONTH(f.fechafactura)=3 THEN 'MARZO' WHEN MONTH(f.fechafactura)=4 THEN 'ABRIL' "
        + " WHEN MONTH(f.fechafactura)=5 THEN 'MAYO' WHEN MONTH(f.fechafactura)=6 THEN 'JUNIO' WHEN MONTH(f.fechafactura)=7 THEN 'JULIO' WHEN MONTH(f.fechafactura)=8 THEN 'AGOSTO' "
        + " WHEN MONTH(f.fechafactura)=9 THEN 'SEPTIEMBRE' WHEN MONTH(f.fechafactura)=10 THEN 'OCTUBRE' WHEN MONTH(f.fechafactura)=11 THEN 'NOVIEMBRE' "
        + " WHEN MONTH(f.fechafactura)=12 THEN 'DICIEMBRE' END) AS mes, YEAR(f.fechafactura) AS año, cl.razonsocial, CONCAT(f.moneda,' ',f.total) AS total "
        + " FROM factura f INNER JOIN cliente cl ON f.idcliente=cl.idcliente "
        + " WHERE f.estado = 'CANCELADO' ";
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

    </head>
    <body>
        <div align="center">
         <form name="formBus" action="gasto_list_search.jsp" method="get">
             <table width="729" id="rounded-corner">
                <tr>
                  <th width="229"> FACTURAS CANCELADOS</th>
                    <th width="444">						
                                                <a href="factura_estadistica.jsp" title="Reporte Gral Factura"><img src="../../imagenes/icons/home.png" height="50" width="50" alt=""/></a>
                                                <a href="factura_estadistica_cancelado.jsp" title="Cancelados"><img src="../../imagenes/icons/pago.png" height="50" width="50" alt=""/>[CANCELADO]</a>
                                                <a href="factura_estadistica_porcancelar.jsp" title="Por Cancelar"><img src="../../imagenes/icons/deben.png" height="50" width="50" alt=""/>[EN ESPERA]</a>
                </tr>
               
           </table>
        </form>
 <table width="647" align="center" id="rounded-corner" border="1">
            <thead>
                <tr>
                    <th class="rounded-company" colspan="6" align="center"></th>
                    
                </tr>
                <tr>
                <th width="180">NRO FACTURA</th>
                <th width="80">DIA</th>
                <th width="100">MES</th>
                <th width="80">AÑO</th>
                <th width="483">RAZON SOCIAL</th>
                <th width="200">TOTAL</th>
                
               
                </tr>
            </thead>
            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("nrofactura")%></td>
                <td><%=rs.getString("dia")%></td>
                <td><%=rs.getString("mes")%></td>
                <td><%=rs.getString("año")%></td>
                <td><%=rs.getString("razonsocial")%></td>
                <td><%=rs.getString("total")%></td>
                
             </tr>
            <%}conex.close();%>
 </table>
        </div>
 <%conex.close();%>
    </body>
</html>