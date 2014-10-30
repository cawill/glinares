<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="conexion.jsp" %>
<%@page import="utils.*;" %>
<%
            FechaSistema fs = new FechaSistema();

            String orden = request.getParameter("accion");

            String idboleta = request.getParameter("idboleta");

            String fechaCancel = "";
            String fechaCancelLetras = "";
            String estado = "";

            if (orden.equals("cancelar")) {
                consulta = "update boleta set fechacancelacion=?,fechaCancelLetras=?," +
                        "estado='CANCELADO' where idboleta=?";
                fechaCancel = fs.fecha().toString();
                fechaCancelLetras = "Tacna, " + fs.diaEnNumeros() + " de " + fs.mesEnLetras() + " del " + fs.anioEnNumeros(fs.fecha());
                ps = conex.prepareStatement(consulta);

                ps.setString(1, fechaCancel);
                ps.setString(2, fechaCancelLetras);
                ps.setString(3, idboleta);

                if (ps.executeUpdate() == 1) {
                    response.sendRedirect("detalleBoleta_list.jsp");
                } else {
                    out.print("Es imposible actualizar, revice los campos vacios");
                }

            } else if (orden.equals("anular")) {

                consulta = "update boleta set fechacancelacion=?,fechaCancelLetras=?," +
                        "estado='ANULADO' where idboleta=?";
                fechaCancel = fs.fecha().toString();
                fechaCancelLetras = "Tacna, " + fs.diaEnNumeros() + " de " + fs.mesEnLetras() + " del " + fs.anioEnNumeros(fs.fecha());
                ps = conex.prepareStatement(consulta);

                ps.setString(1, fechaCancel);
                ps.setString(2, fechaCancelLetras);
                ps.setString(3, idboleta);

                if(ps.executeUpdate()==1){
                    response.sendRedirect("detalleBoleta_list.jsp");
                }else{out.print("revise los campos vacios");}
            }

            conex.close();
%>