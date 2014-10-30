<%@include file="../conexion.jsp" %>

<%-- 
    Document   : transportista_list
    Created on : 14/12/2011, 11:33:51 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%
    consulta = "select * from cliente where idCliente order by razonsocial asc";
    ps = conex.prepareStatement(consulta);
    rs = ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>

        <script type="text/javascript" src="tablesort.js"></script>
        <script type="text/javascript" src="paginate.js"></script>
        <link href="demo.css"       rel="stylesheet" type="text/css" />
        <style type="text/css">
            /* Demo style */
            p
            {
                width:800px;
                margin:0 auto 1.6em auto;
            }

            /* Pagination list styles */
            ul.fdtablePaginater
            {
                display:table;
                list-style:none;
                padding:0;
                margin:0 auto;
                text-align:center;
                height:2em;
                width:auto;
                margin-bottom:2em;
            }
            ul.fdtablePaginater li
            {
                display:table-cell;
                padding-right:4px;
                color:#666;
                list-style:none;

                -moz-user-select:none;
                -khtml-user-select:none;
            }
            ul.fdtablePaginater li a.currentPage
            {
                border-color:#a84444 !important;
                color:#000;
            }
            ul.fdtablePaginater li a:active
            {
                border-color:#222 !important;
                color:#222;
            }
            ul.fdtablePaginater li a,
            ul.fdtablePaginater li div
            {
                display:block;
                width:2em;
                font-size:1em;
                color:#666;
                padding:0;
                margin:0;
                text-decoration:none;
                outline:none;
                border:1px solid #ccc;
                font-family:georgia, serif;
            }
            ul.fdtablePaginater li div
            {
                cursor:normal;
                opacity:.5;
                filter:alpha(opacity=50);
            }
            ul.fdtablePaginater li a span,
            ul.fdtablePaginater li div span
            {
                display:block;
                line-height:2em;
                border:1px solid #fff;
                background:#fff url(../media/gradient.gif) repeat-x 0 -20px;
            }
            ul.fdtablePaginater li a
            {
                cursor:pointer;
            }
            ul.fdtablePaginater li a:focus
            {
                color:#333;
                text-decoration:none;
                border-color:#aaa;
            }
            .fdtablePaginaterWrap
            {
                text-align:center;
                clear:both;
                text-decoration:none;
            }
            ul.fdtablePaginater li .next-page span,
            ul.fdtablePaginater li .previous-page span,
            ul.fdtablePaginater li .first-page span,
            ul.fdtablePaginater li .last-page span
            {
                font-weight:bold !important;
            }
            /* Keep the table columns an equal size during pagination */
            td.sized1
            {
                width:16em;
                text-align:left;
            }
            td.sized2
            {
                width:10em;
                text-align:left;
            }
            td.sized3
            {
                width:7em;
                text-align:left;
            }
            tfoot td
            {
                text-align:right;
                font-weight:bold;
                text-transform:uppercase;
                letter-spacing:1px;
            }
            #visibleTotal
            {
                text-align:center;
                letter-spacing:auto;
            }
            * html ul.fdtablePaginater li div span,
            * html ul.fdtablePaginater li div span
            {
                background:#eee;
            }
            tr.invisibleRow
            {
                display:none;
                visibility:hidden;
            }
            p.paginationText
            {
                font-style:oblique;
            }
        </style>


        <script type="text/javascript">

            var callbackTest = {
                calculateTotalRating:function(opts) {
                    var trs  = document.getElementById("theTable").getElementsByTagName("tbody")[0].rows,
                    tot  = 0,
                    cnt  = 0,
                    cell = document.getElementById("visibleTotal");
                    
                    for(var i = 0, tr; tr = trs[i]; i++) {
                        // If the row is visible i.e. has not display:none or the className "invisibleRow" (used by the fake filter)
                        if(tr.style.display != "none" && tr.className.search(/(^|\s)invisibleRow($|\s)/) == -1) {
                            tot += Number(fdTableSort.getInnerText(tr.cells[6]));
                            cnt++;
                        };
                    };
                
                    while(cell.firstChild) {
                        cell.removeChild(cell.firstChild);
                    };
                
                    cell.appendChild(document.createTextNode(Number(tot / cnt).toFixed(2)));
                },
                displayTextInfo:function(opts) {
                    if(!("currentPage" in opts)) { return; }
                
                    var p = document.createElement('p'),
                    t = document.getElementById('theTable-fdtablePaginaterWrapTop'),
                    b = document.getElementById('theTable-fdtablePaginaterWrapBottom');
                
                    p.className = "paginationText";    
                    //p.appendChild(document.createTextNode("Showing page " + opts.currentPage + " of " + Math.ceil(opts.totalRows / opts.rowsPerPage)));
                
                    t.insertBefore(p.cloneNode(true), t.firstChild);
                    b.appendChild(p);
                }
            };
            //]]>
        </script>


    </head>
    <body>
        <form name="formBus" action="cliente_list_search.jsp" method="get">
                <table id="rounded-corner">
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-company"></th>
                        <th colspan="2" class="rounded-q4"></th>
                    </tr>
                    <tr>
                        <th width="100">Buscar por : </th>
                        <th width="100">
                            <select name="opcionBusqueda">
                                <option value="1">RUC</option>
                                <option value="2">Razon Social</option>
                                <option value="3">Pais</option>
                                <option value="4">Tipo</option>
                            </select>                        </th>
                        <th width="45"><input type="text" name="textoDeBusqueda" size="40"/></th>
                        <th><button type="submit" title="Buscar"><img alt="" src="../../imagenes/icons/buscar.png" height="30" width="30"/></button>
                        <span style="margin-top: 4px">&nbsp;<a href="#" onClick="nuevo();" title="Nuevo Cliente"> <img alt="" src="../imagenes/icons/boss-icon.png" height="50" width="65"/></a>&nbsp;</span></th>
                    </tr>
                    <tr id="rounded-buscar">
                        <th colspan="2" class="rounded-foot-left"></th>
                        <th colspan="2" class="rounded-foot-right"></th>
                    </tr>
                </table>
            </form>

        <table id="theTable" cellpadding="0" cellspacing="0" class="sortable-onload-3 no-arrow rowstyle-alt colstyle-alt paginate-5 max-pages-7 paginationcallback-callbackTest-calculateTotalRating paginationcallback-callbackTest-displayTextInfo sortcompletecallback-callbackTest-calculateTotalRating">
            <thead>

                <tr>

                    <th >Id</th>
                    <th >RUC</th>
                    <th  width="200" align="right">Razon Social</th>
                    <th >Codigo</th>
                    <th  width="60">Pais</th>
                    <th  width="70">Departamento</th>
                    <th >Tipo</th>
                    <th >Estado</th>
                    <th >Opciones</th>
                </tr>
            </thead>


            <tbody>
                <% while (rs.next()) {%>
                <tr><td ><%=rs.getString("idCliente")%></td>
                    <td ><%=rs.getString("ruc")%></td>
                    <td align="left" ><%=rs.getString("razonSocial")%></td>
                    <td ><%=rs.getString("codigocli")%></td>
                    <td ><%=rs.getString("pais")%></td>
                    <td ><%=rs.getString("departamento")%></td>
                    <td ><%=rs.getString("tipo")%></td>
                    <td  align="center">
                        <%
                            if (rs.getString("estado").equals("1")) {
                        %>
                        <a href="cliente_list_opc.jsp?accion=desactivar&idCliente=<%=rs.getString("idCliente")%>" title="Desactivar Cliente">
                            <img alt="" src="../../imagenes/icons/tick.png">
                        </a>
                        <%
                        } else {
                        %>
                        <a href="cliente_list_opc.jsp?accion=activar&idCliente=<%=rs.getString("idCliente")%>" title="Activar Cliente">
                            <img alt="" src="../../imagenes/icons/publish_x.png">
                        </a>
                        <%}%>
                    </td>
                    <td >
                        &nbsp;<a href="cliente_save.jsp?accion=eliminar&idCliente=<%=rs.getString("idCliente")%>"onclick="return confirm('¿Estas seguro de ELIMINAR?');" title="Eliminar Cliente">
                            <img src="../../imagenes/icons/trash.png" height="18" width="18"  alt=""/>
                        </a>&nbsp;
                        &nbsp;<a href="cliente_edit_fm.jsp?accion=actualizar&idCliente=<%=rs.getString("idCliente")%>" title="Editar Cliente">
                            <img src="../../imagenes/icons/edit_f2.png" height="16" width="16"alt=""/>
                        </a>&nbsp;
                        &nbsp;<a href="cliente_edit_fm.jsp?accion=actualizar&idCliente=<%=rs.getString("idCliente")%>" title="Ver Cliente">
                            <img src="../../imagenes/icons/view.gif" alt=""/>
                        </a>&nbsp;
                    </td>
                </tr>
                <%}
                    conex.close();%>
            </tbody>
        </table>

    </div>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br>
</body>
</html>
