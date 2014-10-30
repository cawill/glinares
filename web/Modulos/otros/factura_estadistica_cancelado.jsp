<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">


<%
        
consulta = "SELECT (CASE WHEN MONTH(fechafactura)=1 THEN 'ENERO' "
                + " WHEN MONTH(fechafactura)=2 THEN 'FEBRERO' "
                + " WHEN MONTH(fechafactura)=3 THEN 'MARZO' "
                + " WHEN MONTH(fechafactura)=4 THEN 'ABRIL' "
                + " WHEN MONTH(fechafactura)=5 THEN 'MAYO' "
                + " WHEN MONTH(fechafactura)=6 THEN 'JUNIO' "
                + " WHEN MONTH(fechafactura)=7 THEN 'JULIO' "
                + " WHEN MONTH(fechafactura)=8 THEN 'AGOSTO' "
                + " WHEN MONTH(fechafactura)=9 THEN 'SEPTIEMBRE' "
                + " WHEN MONTH(fechafactura)=10 THEN 'OCTUBRE' "
                + " WHEN MONTH(fechafactura)=11 THEN 'NOVIEMBRE' "
                + " WHEN MONTH(fechafactura)=12 THEN 'DICIEMBRE' "
                + "  END) AS mes, YEAR(fechafactura) AS año, SUM(total) AS total, COUNT(numfactura) as cantidad "
                + " FROM factura WHERE estado = 'CANCELADO' GROUP BY mes ";


        ps = conex.prepareStatement(consulta);
        rs = ps.executeQuery();
%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
         <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
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
        <h1>&nbsp;</h1>

        
        <br>
        <br>
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
                <tr>
                    <th width="153">&nbsp;</th>
                  <th width="229"><%--
                        <select name="opcionBusqueda">
                            <option value="1">Ruc</option>
                            <option value="2">Razon Social</option>
                            
                        </select>
						--%>&nbsp;<H1> FACTURAS CANCELADOS </H1></th>
                  <th width="54">
				  <%-- <input type="text" name="textoDeBusqueda" size="40"/>
				  --%>				  </th>
                    <th width="444">
					<%--
					<button type="submit" title="Buscar"><img alt="" src="../imagenes/icons/buscar.png" height="40" width="40"/></button>
					
                    <a href="#" onclick="nuevo();" title="Nuevo Proveedor">&nbsp; &nbsp; &nbsp;
                        <img alt="" src="../imagenes/icons/empresa.png" height="40" width="40"/> 
						--%>
						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp; 						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;						&nbsp; &nbsp; &nbsp;
                                                <a href="boleta_estadistica.jsp" title="Reporte Gral Factura"><img src="../imagenes/icons/home.png" height="50" width="50" alt=""/></a>
                                                <a href="boleta_estadistica_cancelado.jsp" title="Cancelados"><img src="../imagenes/icons/pago.png" height="50" width="50" alt=""/></a>
                                                <a href="boleta_estadistica_porcancelar.jsp" title="Por Cancelar"><img src="../imagenes/icons/deben.png" height="50" width="50" alt=""/></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				  </th>
                </tr>
                <tr id="rounded-buscar">
                    <th class="rounded-foot-left" colspan="2"></th>
                    <th class="rounded-foot-right" colspan="2"></th>
                </tr>
           </table>
        </form>
        <br><br>
<div id="contenedor" style="display:none"></div>
 <table width="647" align="center" id="rounded-corner" border="1">
            <thead>
                <tr>
                    <th class="rounded-company" colspan="4" align="center"></th>
                    
                </tr>
                <tr>
                <th width="180">AÑO</th>
                <th width="221">MES</th>
                <th width="483">TOTAL S/.</th>
                <th width="483">CANTIDAD DE BOLETAS</th>
                
               
                </tr>
            </thead>
            <% while(rs.next()){%>
            <tr>
                <td><%=rs.getString("año")%></td>
                <td><%=rs.getString("mes")%></td>
                <td><%=rs.getString("total")%></td>
                <td><%=rs.getString("cantidad")%></td>
             </tr>
            <%}conex.close();%>
          
        </div>
    </body>
</html>