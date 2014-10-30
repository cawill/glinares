
<%-- 
    Document   : transportista_add_fm
    Created on : 14/12/2011, 11:43:11 PM
    Author     : Josmarl
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Usuarios</title>
      <link  rel="stylesheet" href="../css/ultimate.css" type="text/css" media="all">
    </head>
    <body>
        
        <form action="usuario_save.jsp" method="post">
            <br>
            <table id="rounded-corner-list_1" align="center">
                <tr>
                    <th  style="padding: 7px" colspan="1"  class="rounded-company"></th>
                    <th colspan="1" class="rounded-q4">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        REGISTRO DE USUARIOS
                    </th>
                </tr>

                    <tr>
                        <td align="right" >Login :</td>
                        <td><input type="text" name="login" maxlength="11" size="30" required/></td>
                    </tr>
                    <tr>
                        <td align="right" >Password :</td>
                        <td><input type="password" name="password" maxlength="11" size="30" required/></td>
                    </tr>
                    <tr>
                        <td align="right" >Nombres y Apellidos :</td>
                        <td><input type="text" name="nombres" size="50" required onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                    </tr>
                    <tr>
                        <td align="right" >DNI :</td>
                        <td><input type="text" name="dni" size="10" maxlength="8" required/></td>
                    </tr>
                    <tr>
                        <td align="right" >Dirección :</td>
                        <td><input type="text" name="direccion" size="50" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Email :</td>
                        <td><input type="email" name="email" size="30"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Celular :</td>
                        <td><input type="text" name="celular" size="30" /></td>
                    </tr>
                    <tr>
                        <td align="right" >Cargo :</td>
                        <td><input type="text" name="cargo" size="30" /></td>
                    </tr>
                    <tr>
                        <td align="right" >Estado</td>
                        <td>
                            <label class="rad">Activo</label>
                            <input  type="radio" value="1" name="estado" required checked />
                            <label class="rad">Inactivo</label>
                            <input  type="radio" value="0" name="estado" required/>

                        </td>
                    </tr>
                    
                    <tr align="right" >
                        <th colspan="1" class="rounded-foot-left"></th>
                        <th colspan="1" class="rounded-foot-right"><input type="submit" value="Guardar"/></th>
                    </tr>

            </table>
    <input type="hidden" name="accion" value="guardar"/>

        </form>
    </body>
</html>
