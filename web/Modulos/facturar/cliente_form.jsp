<%-- 
    Document   : transportista_add_fm
    Created on : 14/12/2011, 11:43:11 PM
    Author     : Josmarl
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<%@include file="../session_verifica.jsp" %>

<html>
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>JSP Page</title>
        
        <link href="facturar/recursos/css/tabla.css" media="screen" rel="stylesheet" type="text/css" />
        <link href="facturar/recursos/css/layout.css" media="screen" rel="stylesheet" type="text/css" />
        
        
    </head>
    <body>
        <%--
        <form name="formBuscar" action="cliente_add_validation.jsp" target="con">
        <table>
             <tr>
                 <td>BUSCAR :</td>
                 <td class="7" >
                     <input type="text" class="textImput" id="nombre" name="nombre" value="" size="30" /> 
                     <input type="submit" value="Buscar" name="buscar" />
                 </td>                 
             </tr>            
        </table>            
        </form>
        <iframe name="con" frameborder="0" height="50" width="400" src="cliente_add_validation.jsp">
            
        </iframe>
        --%>
    <center>
        
        <form action="cliente_save.jsp" method="post">
            <br>
            <table width="785" align="center" id="rounded-corner-list_1">
                <tr>
                    <th width="273" colspan="1"  class="rounded-company" style="padding: 7px"></th>
                    <th width="615" colspan="1" class="rounded-q4">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        REGISTRO DE CLIENTES                    </th>
                    
                </tr>

                    <tr>
                        <td>RUC:</td>
                        <td><input type="text" name="ruc" maxlength="19" size="70" required/>
                        <input type="hidden" name="login"  maxlength="15" size="30" value="<%=session_login%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" >Razon Social :</td>
                        <td><input name="razonSocial" type="text" size="70" maxlength="70" required onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Direccion :</td>
                        <td><input name="direccion" type="text" size="70" maxlength="62" required onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Pais :</td>
                        <td><input name="pais" type="text" size="70" maxlength="20" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Departamento :</td>
                        <td><input name="departamento" type="text" size="50" maxlength="30" onChange="javascript:this.value=this.value.toUpperCase();"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Codigo :</td>
                      <td><input name="codigocli" type="text" size="50" maxlength="10"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Telefono :</td>
                        <td><input name="telefono" type="text" size="50" maxlength="50" /></td>
                    </tr>
                    <tr>
                        <td align="right" >Email :</td>
                        <td><input type="email" name="email" size="50" maxlength="50"/></td>
                    </tr>
                    <tr>
                        <td align="right" >Descripcion :</td>
                        <td>
                            <textarea name="descrip" cols="40" rows="2" maxlength="70"></textarea>                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" >Estado :</td>
                        <td>
                            <label class="rad">Activo</label>
                            <input  type="radio" value="1" name="estado" required checked />
                            <label class="rad">Inactivo</label>
                            <input  type="radio" value="0" name="estado" required/>                        </td>
                    </tr>
                    <tr>
                    <td align="right" >Tipo :</td>
                    <td>
                        <select name="tipo" size="4" style="width:143px" required>
                        <option value="CLIENTE">CLIENTE</option>
                        <option value="TRANSPORTISTA" >TRANSPORTISTA</option>
                        <option value="PROVEEDOR" >PROVEEDOR</option>
			<option value="Otros">OTROS</option>
                        </select>                    </td>
            </tr>
                    <tr align="right" >
                        <th colspan="1" class="rounded-foot-left"></th>
                        <th><button type="submit" title="Guardar"><img alt="" src="../imagenes/icons/listo.png" height="50" width="50"/></button></th>
                    </tr>
          </table>
    <input type="hidden" name="accion" value="guardar">

        </form>
                        </center>
    </body>
</html>
