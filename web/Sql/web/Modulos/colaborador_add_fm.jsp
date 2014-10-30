
<%@include file="conexion.jsp" %>

<%-- 
    Document   : conductor_add_fm
    Created on : 16/12/2011, 12:13:46 PM
    Author     : Josmarl
--%>

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%
consulta="select*from cliente where estado='1' order by idcliente desc;";
ps=conex.prepareStatement(consulta);
rs=ps.executeQuery();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        <link href="facturar/recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="facturar/recursos/css/layout.css" media="screen" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="../Js/jquery.js" ></script>
        <script type="text/javascript">
            nuevo=function()
            {
                var d = "";
                $.ajax
                ({
                    type:"POST",
                    url:"colaborador_add_fm.jsp",
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
        <br/>
        <br/>
        <center>
		
        <form action="colaborador_save.jsp"  method="post" >
            <table id="rounded-corner" align="center">
                <tr>
                    <th class="rounded-company" colspan="1"></th>
                    <th align="right" style="padding: 7px" colspan="2">
                        
                        REGISTRO DE PERSONALES
                    </th>
                    <th colspan="2" class="rounded-q4" ></th>
                </tr>
            <tr>
                
                <td align="right" width="70"> Razon Social :</td>
              <td>

                    <select name="idCliente">
                       
                        <%while(rs.next()){%>
                        <option label="<%=rs.getString("razonSocial")%>" value="<%=rs.getString("idCliente")%>">
                            <%=rs.getString("razonSocial")%>
                        </option>
                        <%}%>
                </select><a href="cliente_add_fm.jsp" target="../" title="Nuevo Cliente"><img alt="" src="../imagenes/icons/empresa.png" width="30" height="30"/></a>
                <a href="colaborador_add_fm.jsp" title="Actualizar"><img alt="" src="../imagenes/icons/actualizar.png" width="30" height="30"/></a>
				</td>
                <td align="right">Nombres :</td>
                <td><input name="nombreape" type="text" value="" size="60" maxlength="95" placeholder="Ingrese nombres y apellidos" required onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                
            </tr>
            <tr>
                <td align="right"> Telefono :</td>
                <td><input name="telf" type="text" value="" size="40" maxlength="20" /></td>
                <td align="right"> Celular :</td>
                <td><input name="cell" type="text" value="" size="50" maxlength="20" /></td>
                
            </tr>
            <tr>
                <td align="right"> Celular :</td>
                <td><input name="cell2" type="text" value="" size="40" maxlength="20" /></td>
                <td align="right"> Nextel :</td>
                <td><input name="nextel" type="text" value="" size="40" maxlength="20" /></td>
                
            </tr>
            <tr>
                <td align="right"> Enexo :</td>
                <td><input name="anexo" type="text" value="" size="40" maxlength="20" /></td>
                <td align="right"> E-mail :</td>
                <td><input name="email" type="email" value="" size="60" maxlength="80" placeholder="correo@email.com" /></td>
                
            </tr>
            <tr>
                <td align="right"> E-mail :</td>
                <td ><input name="email2" type="email" value="" size="60" maxlength="80" placeholder="correo@email.com"/></td>
                <td colspan="2"></td>
                
            </tr>
            <tr>
                <th colspan="3" class="rounded-foot-left"><a href="colaborador_list.jsp" title="Buscar Personal"><img alt="" src="../imagenes/icons/buscar.png" width="40" height="40"/>[&nbsp; BUSCAR&nbsp; ]</a></th>
                <th><button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
            </tr>
        </table>
                    <input type="hidden" name="accion" value="guardar">
        </form>
		</center>
             <br>
            <%conex.close();%>
    </body>
</html>
