<!DOCTYPE html>
<head>
    <title>Bienvenido al Sistema</title>
    <link href="Modulos/facturar/recursos/css/facebox.css" media="screen" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="Modulos/facturar/recursos/css/layout.css" />
    <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu_presentation.css" />
    <script type="text/javascript" src="Modulos/facturar/recursos/js/jquery.min.js"></script>
    <script type="text/javascript" src="Js/topmenu/ddsmoothmenu.js"></script>
    <script src="Modulos/facturar/recursos/js/facebox.js" type="text/javascript" ></script>
    <script type="text/javascript">
    jQuery(document).ready(function($) {
      $('a[rel*=facebox]').facebox({
        loadingImage : 'Modulos/facturar/recursos/img/loading.gif',
        closeImage   : 'Modulos/facturar/recursos/img/closelabel.gif'
      })
    })
  </script>
    <script type="text/javascript">

        ddsmoothmenu.init({
            mainmenuid: "templatemo_menu", //menu DIV id
            orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
            classname: 'ddsmoothmenu', //class added to menu's outer DIV
            //customtheme: ["#1c5a80", "#18374a"],
            contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
        })

    </script>
    <meta charset="ISO-8859-1" />

    <script src="Js/presentation/elegant-press.js" type="text/javascript"></script>
    <link href="css/stylelog.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet"  type="text/css" href="css/stylelp1.css" /> 
</head>
<body OnLoad="document.form1.login.focus();">
    <%-- <link rel="stylesheet" href="css/elegant-press.css" type="text/css" />         --%>
    <div class="main-container">
        <div class="main-container">
            <br/><br/>
        </div>
    </div>

    <div id="templatemo_menu" class="ddsmoothmenu" >
        <ul>
            <li><a href="index.jsp">Home</a></li>

            <li>
                <a href="index.jsp">Nosotros</a>
                <ul>
                    <li><a href="index.jsp">¿Quienes somos?</a></li>
                    <li><a href="index.jsp">Misión</a></li>
                    <li><a href="index.jsp">Visión</a></li>

                </ul>
            </li>
            <li>
                <a href="index.jsp">Contactenos</a>
                <ul>
                    <li><a href="index.jsp">Información</a></li>
                    <li><a href="http://www.grupolinares.com.pe/">Ir a Pagina Web</a></li>
                </ul>
            </li>
            <li>
                <a href="index.jsp">Ayuda</a>
                <ul>
                    <li><a href="index.jsp">Manuales</a></li>
                </ul>
            </li>
            <li><a href="index.jsp" onclick="return alert('Todos los derechos reservados Copyright © 2012 UPeU Systems')">Acerca de</a></li>
            <li><a href="#info" data-clone="Login" rel="facebox"><th>Login</th></a></li>
        </ul>

        <br style="clear: left" />
    </div>
    <br/><br/>
    <div class="main-container">
        <div class="container1" align="center">
            <div id="mySlides">

                <div id="slide1">
                    <img src="imagenes/gl_presentation/logo.png" alt="Slide 1 jFlow Plus" />

                </div>
                <div id="slide2">
                    <img style="border-radius: 10px; box-shadow:0px 0px 20px rgba(0,0,0,2);" src="imagenes/gl_presentation/slider2.jpg" alt="Slide 2 jFlow Plus" />

                </div>
                
                <div id="slide4">
                    <img style="border-radius: 10px; box-shadow:0px 0px 20px rgba(0,0,0,2);" src="imagenes/gl_presentation/slider4.jpg" alt="Slide 4 jFlow Plus" />
                </div>

            </div>

            <div id="myController">
                <span class="jFlowControl"></span>
                <span class="jFlowControl"></span>
                <span class="jFlowControl"></span>

            </div>
            <section class="jFlowPrev"><div></div></section>
            <section class="jFlowNext"><div></div></section>
        </div>
        <div style="font-size:10px;font-family:Arial;color: buttonshadow " align="center">
            Copyright © 2012, Tacna-Perú UPeU Systems Todos los derechos reservados<br>
            Para mayor información contactenos al celular: 952624449 ó 952633245<br>
            Email: josmarl567@gmail.com , elmagwi@gmail.com 
        </div>
    </div>
    
    
    <div id="info" style="display:none;">
        <form name="form1" action="Modulos/usuario_login.jsp">
            <table id="loginId" >
                <thead>
                    <tr>

                    </tr>
                </thead>
                <tbody>
                <center>
                    <th id="titlelogin" colspan="3">
                    Grupo Linares S.A.
                </th>
                </center>
                <tr co>
                    <td align="right">User:</td>
                    <td><input type="text" class="textImput" name="login" value="" /></td>
                </tr>
                <tr>
                    <td align="right">Pass:</td>
                    <td><input type="password" class="textImput" name="password" value="" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit"  class="button" value="Ingresar" /> 
                        <div align="center"style="color:red;font-size:10px;font-family:Tahoma;text-decoration:blink"></div>
                    </td>                        
                </tr>
                </tbody>
            </table>                
        </form>
    </div>



</body>
</html>
