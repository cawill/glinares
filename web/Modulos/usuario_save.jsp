<%-- 
    Document   : usuario_save
    Created on : 01/03/2012, 11:31:24 AM
    Author     : Pc 04
--%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@include file="conexion.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error de validacion de usuario</title>
        <link href="../css/ultimate.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <%
        
        try{
            
        String orden=request.getParameter("accion");
        
        String login=request.getParameter("login");
        String password=request.getParameter("password");
        String nombres=request.getParameter("nombres");
        String dni=request.getParameter("dni");
        String direccion=request.getParameter("direccion");
        String email=request.getParameter("email");
        String celular=request.getParameter("celular");
        String cargo=request.getParameter("cargo");
        String estado=request.getParameter("estado");
        
        if(orden.equals("guardar")){
            
            consulta="insert into usuario(login,password,"
                    + "nombres,dni,direccion,email,celular,"
                    + "cargo,estado) "
                    + "values(?,?,?,?,?,?,?,?,?)";
            ps=conex.prepareStatement(consulta);
            ps.setString(1, login);
            ps.setString(2, password);
            ps.setString(3, nombres);
            ps.setString(4, dni);
            ps.setString(5, direccion);
            ps.setString(6, email);
            ps.setString(7, celular);
            ps.setString(8, cargo);
            ps.setString(9, estado);
            
            if(ps.executeUpdate()==1){
            response.sendRedirect("usuario_list.jsp");
            }else { out.print("No es posible guardar los datos");}
        
        } else if(orden.equals("editar")){
        consulta="update usuario set password=?,"
                + "nombres=?,dni=?,direccion=?,email=?,"
                + "celular=?,cargo=?,estado=? "
                + "where login=?";
            ps=conex.prepareStatement(consulta);
            
            ps.setString(1, password);
            ps.setString(2, nombres);
            ps.setString(3, dni);
            ps.setString(4, direccion);
            ps.setString(5, email);
            ps.setString(6, celular);
            ps.setString(7, cargo);
            ps.setString(8, estado);
            ps.setString(9, login);
            
            if(ps.executeUpdate()==1){
            response.sendRedirect("usuario_list.jsp");
            }else { out.print("No es posible actualizar los datos");}
        
        } else if(orden.equals("eliminar")){
        
            consulta="delete from usuario where login=?";
            ps=conex.prepareStatement(consulta);
            
            ps.setString(1, login);
            
            if(ps.executeUpdate()==1){
            response.sendRedirect("usuario_list.jsp");
            }else { out.print("No es posible eliminar los datos");}
        
        }else{out.print("Accion invalida");
        }
 
        }catch(SQLException e){
            
                    out.print(
                            " <br>&nbsp;&nbsp;&nbsp;<img src='../imagenes/icons/warning.gif' alt=''> "
                            + "&nbsp;&nbsp;&nbsp;"
                            + "Este usuario ya existe. Por favor, ingrese otro usuario.<br>"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;"
                            );
           out.println(e.getMessage() + ". " + "<a href='usuario_list.jsp'>Regresar</a>");
           
        }
        %>
    </body>
</html>
