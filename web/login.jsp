<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">


    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet"  type="text/css" href="css/skin1.css" ></link>   
        <link href="../css/stylelog.css" rel="stylesheet" type="text/css" />
        <%-- <link rel="stylesheet"  type="text/css" href="css/stylelp1.css" ></link>    --%>
        <title>--Grupo Linreas S.A.--</title>
        
                
    </head>
        
    <body>
        <div class="divlogin">
            <form id="form1" name="form1" method="post" action="Modulos/usuario_login.jsp">
            <table border="0">
                <thead>
                    <tr>
                        <th colspan="2" class="titlelogin" >Ingreso al Sistema</th>                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Usuario:</td>
                        <td><input type="text" class="textImput" name="login" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" class="textImput" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit"  class="button" value="Ingresar" /> 
                            <input type="button" class="button" value="Cancelar" />
                        </td>                        
                    </tr>
                </tbody>
            </table>                
            </form>
            </div>
    </body>
</html>
