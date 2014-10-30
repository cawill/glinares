<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    consulta = "SELECT (CASE WHEN MONTH(fechacomp)=1 THEN 'ENERO' "
            + " WHEN MONTH(fechacomp)=2 THEN 'FEBRERO' "
            + " WHEN MONTH(fechacomp)=3 THEN 'MARZO' "
            + " WHEN MONTH(fechacomp)=4 THEN 'ABRIL' "
            + " WHEN MONTH(fechacomp)=5 THEN 'MAYO' "
            + " WHEN MONTH(fechacomp)=6 THEN 'JUNIO' "
            + " WHEN MONTH(fechacomp)=7 THEN 'JULIO' "
            + " WHEN MONTH(fechacomp)=8 THEN 'AGOSTO' "
            + " WHEN MONTH(fechacomp)=9 THEN 'SEPTIEMBRE' "
            + " WHEN MONTH(fechacomp)=10 THEN 'OCTUBRE' "
            + " WHEN MONTH(fechacomp)=11 THEN 'NOVIEMBRE' "
            + " WHEN MONTH(fechacomp)=12 THEN 'DICIEMBRE' "
            + "  END) AS mes, YEAR(fechacomp) AS año, SUM(total) AS total "
            + " FROM gastos  GROUP BY mes ";
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
                        <th class="rounded-foot-left" align="center" colspan="2">ESTADISTICA-GASTOS</th>
                        <th style="margin-right: -300px" colspan="2" align="center" class="rounded-foot-right">
                            <a href="gasto_list.jsp" title="Menu Gastos">
                                <img src="../imagenes/icons/home.png" height="40" width="40" alt=""/></a>
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
                    </tr>
                </thead>
                <% while (rs.next()) {%>
                <tr>
                    <td><%=rs.getString("año")%></td>
                    <td><%=rs.getString("mes")%></td>
                    <td><%=rs.getString("total")%></td>
                </tr>
                <%}
                    conex.close();%>
            </table>

        </div>
    </body>
</html>