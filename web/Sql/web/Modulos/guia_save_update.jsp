<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String idGuia = request.getParameter("ProximoIdAInsertar");
                String orden = request.getParameter("accion");

                consulta = "select cantidad,pesoTotal from detalleguiaremision where idGuia=?";
                PreparedStatement psg = conex.prepareStatement(consulta);
                psg.setString(1, idGuia);
                ResultSet rsg = psg.executeQuery();
                while (rsg.next()) {

                    if (orden.equals("update") && rsg.getString("cantidad").equals("0.00") && rsg.getString("pesoTotal").equals("0.00")) {
                        consulta = "UPDATE detalleguiaremision SET cantidad='',pesoTotal='' "
                                + "WHERE idGuia=? AND cantidad='0.00' AND pesoTotal='0.00';";
                        ps = conex.prepareStatement(consulta);
                        ps.setString(1, idGuia);
                        ps.executeUpdate();
                        response.sendRedirect("detalleGuia_list.jsp");
                    } else if (orden.equals("update") && rsg.getString("cantidad").equals("0.00")) {
                        consulta = "UPDATE detalleguiaremision SET cantidad='' "
                                + "WHERE idGuia=? AND cantidad='0.00';";
                        ps = conex.prepareStatement(consulta);
                        ps.setString(1, idGuia);
                        ps.executeUpdate();
                        response.sendRedirect("detalleGuia_list.jsp");
                    } else if (orden.equals("update") && rsg.getString("pesoTotal").equals("0.00")) {
                        consulta = "UPDATE detalleguiaremision SET pesoTotal='' "
                                + "WHERE idGuia=? AND pesoTotal='0.00';";
                        ps = conex.prepareStatement(consulta);
                        ps.setString(1, idGuia);
                        ps.executeUpdate();
                        response.sendRedirect("detalleGuia_list.jsp");
                    } else {
                        consulta = "UPDATE detalleguiaremision SET cantidad='',pesoTotal='' "
                                + "WHERE idGuia=? AND cantidad='0.00' AND pesoTotal='0.00';";
                        ps = conex.prepareStatement(consulta);
                        ps.setString(1, idGuia);
                        ps.executeUpdate();
                        response.sendRedirect("detalleGuia_list.jsp");


                    }
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        %>




    </body>
</html>
