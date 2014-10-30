<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
if(request.getParameter("textoOpc")!=null){
String orden=request.getParameter("opc");
if(orden.equals("1")){
consulta="select b.idboleta,b.serieboleta,b.numboleta,b.login," +
        "b.fechaelaboleta,b.total,b.estado,c.razonSocial from boleta b " +
        "inner join cliente c on c.idCliente=b.idCliente " +
        "where b.numboleta like ?";
ps=conex.prepareStatement(consulta);
ps.setString(1, "%"+request.getParameter("textoOpc")+"%");
rs=ps.executeQuery();
}else if(orden.equals("2")){
consulta="select b.idboleta,b.serieboleta,b.numboleta,b.login," +
        "b.fechaelaboleta,b.total,b.estado,c.razonSocial from boleta b " +
        "inner join cliente c on c.idCliente=b.idCliente " +
        "where b.fechaelaboleta like ?";
ps=conex.prepareStatement(consulta);
ps.setString(1, "%"+request.getParameter("textoOpc")+"%");
rs=ps.executeQuery();
}else if(orden.equals("3")){
consulta="select b.idboleta,b.serieboleta,b.numboleta,b.login," +
        "b.fechaelaboleta,b.total,b.estado,c.razonSocial from boleta b " +
        "inner join cliente c on c.idCliente=b.idCliente " +
        "where b.estado like ?";
ps=conex.prepareStatement(consulta);
ps.setString(1, "%"+request.getParameter("textoOpc")+"%");
rs=ps.executeQuery();
} else if(orden.equals("4")){
consulta="select b.idboleta,b.serieboleta,b.numboleta,b.login," +
        "b.fechaelaboleta,b.total,b.estado,c.razonSocial from boleta b " +
        "inner join cliente c on c.idCliente=b.idCliente " +
        "where c.razonSocial like ?";
ps=conex.prepareStatement(consulta);
ps.setString(1, "%"+request.getParameter("textoOpc")+"%");
rs=ps.executeQuery();
} 

}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script type="text/javascript">
            ver=function(direccion)
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:direccion,
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
            <div align="center" class="style1">
            <h3 class="style33">BOLETA DE VENTA</h3>
 &nbsp;<a href="registrarVentaBoleta.jsp" title="Nueva Boleta de Venta"><img alt="" src="../imagenes/icons/add.png" height="38" width="38"/></a>&nbsp;
 <%-- &nbsp;<a href="boleta_list.jsp" title="Listar Boleta"><img alt="" src="../imagenes/icons/gastos.png" height="40" width="40"/></a>&nbsp; --%>
            &nbsp;<a href="detalleBoleta_list.jsp" title="Buscar Boletas"><img alt="" src="../imagenes/icons/search.png" style="margin-bottom: -3px" height="40" width="40"/></a>&nbsp;
            </div>
        <br>
        <div align="center">
            <br>
            <form action="detalleBoleta_list_search.jsp" method="get">
                <table id="rounded-corner">
                    <tr id="rounded-buscar">
                        <th class="rounded-company" colspan="2"></th>
                        <th class="rounded-q4" colspan="2"></th>
                    </tr>
                    <tr>
                        <th width="100">Buscar por:</th>
                        <th width="100">
                            <select name="opc">
                                <option value="1">
                                    Numero de Boleta
                                </option>
                                <option value="2">
                                    Fecha de Boleta
                                </option>
                                <option value="4">
                                    Razon Social
                                </option>
                                <option value="3">
                                    Estado de Boleta(Cancelado-Por cancelar-Anulado)
                                </option>
                            </select>
                        </th>
                        <th width="45">
                            <input type="text" size="40" name="textoOpc"/>
                        </th>
                        <th>
                            <button type="submit"title="Buscar">
                                <img alt="" src="../imagenes/icons/buscar.gif" height="16" width="16"/></button>
                        </th>
                    </tr>
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="2" class="rounded-foot-right"></th>
                    </tr>
                </table>
            </form>
              <div class="style1" id="contenedor" style="display:none" ></div>
        </div>
        <br><br>

        <div align="center">
          
            <table id="rounded-corner">
                <tr>
                    <th colspan="2" class="rounded-company"></th>
                    <th colspan="4" align="center">
                        LISTA DE BOLETAS DE VENTA
                    </th>
                    <th colspan="2" class="rounded-q4"></th>
                </tr>
                <tr>
                    <th>Id</th>
                    <th>Razon Social</th>
                    <th>Numero</th>
                    <th>Fecha</th>
                    <th>Total</th>
                    <th>Usuario</th>
                    <th>Estado</th>
                    <th>Opciones</th>
                </tr>
                <%while (rs.next()) {
                        String id = rs.getString("idboleta");
                %>
                <tr>
                    <td><%=rs.getString("idboleta")%></td>
                    <td><%=rs.getString("razonSocial")%></td>
                    <td>
                        <%=rs.getString("serieboleta")%>&nbsp;&nbsp;
                        <%=rs.getString("numboleta")%>
                    </td>
                    <td><%=rs.getString("fechaelaboleta")%></td>
                    <td><%=rs.getString("total")%></td>
                    <td><%=rs.getString("login")%></td>
                    <td><%=rs.getString("estado")%></td>
                    <td>
                        <a href="#" onclick="ver('boleta_view.jsp?idboleta=<%=id%>')" title="Ver">
                            <img alt="" src="../imagenes/icons/view.gif"/>
                        </a>&nbsp;
                        <a href="boleta_edit_fm.jsp?accion=edit&idboleta=<%=id%>" title="Editar">
                            <img alt="" src="../imagenes/icons/edit_f2.png" height="16" width="16"/>
                        </a>&nbsp;
                        <a href="boleta_save_opc.jsp?accion=cancelar&idboleta=<%=id%>" title="Cancelar" onclick="return confirm('Va a Cancelar esta Boleta')">
                            <img alt="" src="../imagenes/icons/activo.gif"/>
                        </a>&nbsp;
                        <a href="boleta_save_opc.jsp?accion=anular&idboleta=<%=id%>" title="Anular" onclick="return confirm('Va a anular esta Boleta')">
                            <img alt="" src="../imagenes/icons/anular.gif"/>
                        </a>
                        <a target="../" href="reportes/reporte_boleta.jsp?nombre=<%=rs.getString("idboleta")%>" title="Imprimir" onclick="return confirm('Imprimir')">
                            <img alt="" src="../imagenes/icons/print.gif"/>
                        </a>
                    </td>
                </tr>
                <%}
                    conex.close();%>
            </table>
        </div>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
            <br><br><br><br><br><br><br>
    </body>
</html>
