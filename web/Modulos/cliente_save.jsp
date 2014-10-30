<%@include file="session_verifica.jsp" %>
<%@include file="conexion.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>d</title>
    </head>


    <body>
        <%
            String orden = request.getParameter("accion");

            String idCliente = request.getParameter("idCliente");
            String ruc = request.getParameter("ruc");
            String razonSocial = request.getParameter("razonSocial");
            String codigocli = request.getParameter("codigocli");
            String pais = request.getParameter("pais");
            String departamento = request.getParameter("departamento");
            String estado = request.getParameter("estado");
            String tipo = request.getParameter("tipo");
            String direccion = request.getParameter("direccion");
            String login = request.getParameter("login");
            String telefono=request.getParameter("telefono");
            String email=request.getParameter("email");
            String descripcion=request.getParameter("descrip");

            if (orden.equals("guardar") && (ruc.length() > 0)) {
                consulta = "INSERT INTO cliente(ruc, razonSocial,"
                        + "codigocli, pais,departamento,estado,"
                        + "tipo,login) "
                        + "VALUES (?,?,?,?,?,?,?,?);";
                ps = conex.prepareStatement(consulta);
                ps.setString(1, ruc);
                ps.setString(2, razonSocial);
                ps.setString(3, codigocli);
                ps.setString(4, pais);
                ps.setString(5, departamento);
                ps.setString(6, estado);
                ps.setString(7, tipo);
                ps.setString(8, login);
                ps.executeUpdate();

                consulta = "SELECT LAST_INSERT_ID(idCliente) "
                        + "AS ProximoIdAInsertar "
                        + "FROM cliente where login=?"
                        + "ORDER BY idCliente "
                        + "DESC LIMIT 1";
                ps = conex.prepareStatement(consulta);
                ps.setString(1, session_login);
                rs = ps.executeQuery();
                if (rs.next()) {

                    consulta = "INSERT INTO detallecliente"
                            + "(idCliente,direccion,telefono,"
                            + "email,descrip) "
                            + "VALUES(?,?,?,?,?);";
                    ps = conex.prepareStatement(consulta);
                    ps.setString(1, rs.getString("ProximoIdAInsertar"));
                    ps.setString(2, direccion);
                    ps.setString(3, telefono);
                    ps.setString(4, email);
                    ps.setString(5, descripcion);
                    ps.executeUpdate();
                }
              //  if (ps.executeUpdate() == 1) {
                    response.sendRedirect("cliente_list.jsp");
             //   } else {
                    out.print("No es posible guardar contacto");
              //  }
            } else if (orden.equals("actualizar") ) {
                consulta = "UPDATE cliente SET ruc=?, razonSocial=?, codigocli=?,pais=?,departamento=?, estado=?, tipo=? WHERE idCliente=? ;";
                ps = conex.prepareStatement(consulta);
                ps.setString(1, ruc);
                ps.setString(2, razonSocial);
                ps.setString(3, codigocli);
                ps.setString(4, pais);
                ps.setString(5, departamento);
                ps.setString(6, estado);
                ps.setString(7, tipo);
                ps.setString(8, idCliente);
                ps.executeUpdate();
                
                consulta="update detalleCliente set direccion=?,"
                        + "telefono=?,email=?,descrip=? "
                        + "where idCliente=?";
                ps=conex.prepareStatement(consulta);
                ps.setString(1, direccion);
                ps.setString(2, telefono);
                ps.setString(3, email);
                ps.setString(4, descripcion);
                ps.setString(5, idCliente);
                ps.executeUpdate();
             //   if (ps.executeUpdate() == 1) {
                    response.sendRedirect("cliente_list.jsp");
             //   } else {
                    out.print("No es posible actualizar contacto");
             //   }
            } else if (orden.equals("eliminar") && (idCliente.length() > 0)) {
                consulta = "DELETE FROM cliente WHERE idCliente=? ;";
                ps = conex.prepareStatement(consulta);
                ps.setString(1, idCliente);
                ps.executeUpdate();
                
                consulta="DELETE FROM detalleCliente WHERE idCliente=?";
                ps = conex.prepareStatement(consulta);
                ps.setString(1, idCliente);
                ps.executeUpdate();
             //   if (ps.executeUpdate() == 1) {
                    response.sendRedirect("cliente_list.jsp");
             //   } else {
                    out.print("No es posible eliminar contacto");
            //    }
            } else {
                out.print("Accion invalida...");
            }

            conex.close();
            %>
    </body>
</html>