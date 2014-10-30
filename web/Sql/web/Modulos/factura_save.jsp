<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>
<%@page import="utils.*;" %>
<html>
    <head>
        <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>

        <%
                    FechaSistema fs = new FechaSistema();

                    String orden = request.getParameter("accion");

                    String id = request.getParameter("idFactura");

                    String serie = request.getParameter("txtSerieFactura");
                    int numeroFac = Integer.parseInt(request.getParameter("txtNumFactura"));
                    String fechaFactura = request.getParameter("txtFechaFactura");
                    double igv = Double.parseDouble(request.getParameter("txtIgv"));
                    double subTotal = Double.parseDouble(request.getParameter("txtSubTotal"));
                    double total = Double.parseDouble(request.getParameter("txtTotal"));
                    String son = request.getParameter("txtSon");
                    String fechaLetras = request.getParameter("txtFechaLetras");
                    String estado = request.getParameter("txtEstado");
                    String fechaCancelLetras = request.getParameter("txtFechaCancelLetras");
                    String descripcionFac = request.getParameter("txtDescFactura");
                    String descripcionIgv=request.getParameter("txtDescripcionIgv");
                    String idCliente=request.getParameter("txtIdCliente");

                    if (orden.equals("edit")) {

                        consulta = "update factura set serieFactura=?,numFactura=?,fechaFactura=?," +
                                "igv=?,subtotal=?,total=?,son=?,fechaLetras=?,estado=?," +
                                "fechaCancelLetras=?,descFactura=?,descripcionigv=?,idcliente=? where idFactura=?;";

                        ps = conex.prepareStatement(consulta);

                        ps.setString(1, serie);
                        ps.setInt(2, numeroFac);
                        ps.setString(3, fechaFactura);
                        ps.setDouble(4, igv);
                        ps.setDouble(5, subTotal);
                        ps.setDouble(6, total);
                        ps.setString(7, son);
                        ps.setString(8, fechaLetras);
                        ps.setString(9, estado);
                        ps.setString(10, fechaCancelLetras);
                        ps.setString(11, descripcionFac);
                        ps.setString(12, descripcionIgv);
                        ps.setString(13, idCliente);
                        ps.setString(14, id);

                        if (ps.executeUpdate() == 1) {
                            out.print("<h1 align='center'>Se realizó con éxito la actualización!</h1>");
        %>
        <div align="center">
             <a href="factura_edit_fm.jsp?idFactura=<%=id%>"><button type="button">Regresar </button></a>
        </div>
       
             <%} else {
                         out.println("no es posible actualizar..");
                     }
                 }
             %>
             
<%conex.close();%>

    </body>



</html>
