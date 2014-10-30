<%@include file="conexion.jsp" %>
<%-- 
    Document   : transportista_add_fm
    Created on : 14/12/2011, 11:43:11 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <title>Usuarios</title>
      <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all"/>
    </head>
    <body>
        <div align="center">
        <form action="usuario_save.jsp" method="post">
            <h3>EDICION DE USUARIOS</h3>
                
            <br/>
            <table id="rounded-corner-list_1" align="center">
                <%
                consulta="select * from usuario where login=?";
                ps=conex.prepareStatement(consulta);
                ps.setString(1, request.getParameter("login"));
                rs=ps.executeQuery();
                
                if(rs.next()){
                %>
                <tr>
                    <th  style="padding: 7px" colspan="1"  class="rounded-company"></th>
                    <th colspan="1" class="rounded-q4">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        REGISTRO DE USUARIOS
                    </th>
                </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">Login :</td>
                        <td><input value="<%=rs.getString("login")%>" type="text" name="login"  size="30" /></td>
                    </tr>

                    <tr>
                        <td align="right" style="font-size: 11px">Password :</td>
                        <td><input value="<%=rs.getString("password")%>" type="text" name="password" maxlength="11" size="30" /></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">Nombres y Apellidos :</td>
                        <td><input value="<%=rs.getString("nombres")%>" type="text" name="nombres" size="50" /></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">DNI :</td>
                        <td><input value="<%=rs.getString("dni")%>" type="text" name="dni" size="10" maxlength="8" /></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">Dirección :</td>
                        <td><input value="<%=rs.getString("direccion")%>" type="text" name="direccion" size="50"/></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">Email :</td>
                        <td><input value="<%=rs.getString("email")%>" type="email" name="email" size="30"/></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">Celular :</td>
                        <td><input value="<%=rs.getString("celular")%>" type="text" name="celular" size="30" /></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">Cargo :</td>
                        <td><input value="<%=rs.getString("cargo")%>" type="text" name="cargo" size="30" /></td>
                    </tr>
                    <tr>
                        <td align="right" style="font-size: 11px">Estado</td>
                        <td>
                            <select name="estado">
                                <option value="<%=rs.getString("estado")%>">
                                    <%
                                    if(rs.getString("estado").equals("1"))
                                    {
                                        out.print("Activo");
                                    }else
                                    {
                                        out.print("Inactivo");
                                    }
                                    %>
                                </option>
                                <option value="1">Activo</option>
                                <option value="0">Inactivo</option>
                            </select>
                                    
                        </td>
                    </tr>
                    
                    <tr align="right" >
                        
                        <th colspan="1" class="rounded-foot-left"></th>
                        <th colspan="1" class="rounded-foot-right"><input type="submit" value="Actualizar"/></th>
                    </tr>
                    <%}%>
            </table>
            <input type="hidden" name="login" value="<%=rs.getString("login")%>" />
            <input type="hidden" name="accion" value="editar"/>
        </form>
        <%conex.close();%>
        </div>
    </body>
</html>
    
   

        
        
        

