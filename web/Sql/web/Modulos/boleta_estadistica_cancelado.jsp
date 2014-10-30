<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">


<%

    consulta = "SELECT (CASE WHEN MONTH(fechaelaboleta)=1 THEN 'ENERO' "
            + " WHEN MONTH(fechaelaboleta)=2 THEN 'FEBRERO' "
            + " WHEN MONTH(fechaelaboleta)=3 THEN 'MARZO' "
            + " WHEN MONTH(fechaelaboleta)=4 THEN 'ABRIL' "
            + " WHEN MONTH(fechaelaboleta)=5 THEN 'MAYO' "
            + " WHEN MONTH(fechaelaboleta)=6 THEN 'JUNIO' "
            + " WHEN MONTH(fechaelaboleta)=7 THEN 'JULIO' "
            + " WHEN MONTH(fechaelaboleta)=8 THEN 'AGOSTO' "
            + " WHEN MONTH(fechaelaboleta)=9 THEN 'SEPTIEMBRE' "
            + " WHEN MONTH(fechaelaboleta)=10 THEN 'OCTUBRE' "
            + " WHEN MONTH(fechaelaboleta)=11 THEN 'NOVIEMBRE' "
            + " WHEN MONTH(fechaelaboleta)=12 THEN 'DICIEMBRE' "
            + "  END) AS mes, YEAR(fechaelaboleta) AS año, SUM(total) AS total, COUNT(numboleta) as cantidad "
            + " FROM boleta WHERE estado='CANCELADO' GROUP BY mes ";


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
                    <tr id="rounded-buscar">
                        <th class="rounded-foot-left" colspan="2" align="right">BOLETAS CANCELADAS</th>

                        <th  class="rounded-foot-right" align="right" style="margin-left: 100px" colspan="2">

                            <a href="boleta_estadistica.jsp" title="Reporte Gral Boletas"><img src="../imagenes/icons/home.png" height="45" width="45" alt=""/></a>&nbsp;
                            <a href="boleta_estadistica_cancelado.jsp" title="Cancelados"><img src="../imagenes/icons/pago.png" style="margin-bottom: 4px" height="38" width="38" alt=""/></a>&nbsp;&nbsp;
                            <a href="boleta_estadistica_porcancelar.jsp" title="Por Cancelar"><img src="../imagenes/icons/deben.png" style="margin-bottom: 4px" height="38" width="38" alt=""/></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </th>
                    </tr>
                </table>
            </form>
            <br><br>
            <div id="contenedor" style="display:none"></div>
            <table width="647" align="center" id="rounded-corner" border="0">
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
                <% while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("año")%></td>
                    <td><%=rs.getString("mes")%></td>
                    <td><%=rs.getString("total")%></td>
                    <td><%=rs.getString("cantidad")%></td>
                </tr>
                <%}
                conex.close();%>
            </table>
        </div>
    </body>
</html>