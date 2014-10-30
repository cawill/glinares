<!DOCTYPE html>
<title>Bienvenido al Sistema</title>
 <link rel="stylesheet" type="text/css" href="css/ddsmoothmenu_presentation.css" />
        <script type="text/javascript" src="Js/topmenu/jquery.min.js"></script>
        <script type="text/javascript" src="Js/topmenu/ddsmoothmenu.js"></script>
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
<link rel="stylesheet" href="css/elegant-press.css" type="text/css" />
<script src="Js/presentation/elegant-press.js" type="text/javascript"></script>
<link href="css/stylelog.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet"  type="text/css" href="css/stylelp1.css" /> 
</head>
<body>

        
<div class="main-container">
<div class="main-container">
    <br/><br/><br/><br/><br/><br/><br/><br/>
</div>
</div>

     <div id="templatemo_menu" class="ddsmoothmenu">

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
        </ul>

        <br style="clear: left" />
      </div>
    <br/><br/>
<div class="main-container">
    <div class="container1" align="center">
  <div id="mySlides">
    <div id="slide1">
        <img src="imagenes/gl_presentation/slider1.jpg" alt="Slide 1 jFlow Plus" />

    </div>
    <div id="slide2">
        <img src="imagenes/gl_presentation/slider2.jpg" alt="Slide 2 jFlow Plus" />

    </div>
    <div id="slide3">
        <img src="imagenes/gl_presentation/slider3.jpg" alt="Slide 3 jFlow Plus" />

    </div>
    <div id="slide4">
        <img src="imagenes/gl_presentation/slider4.jpg" alt="Slide 4 jFlow Plus" />

    </div>
    <div id="slide5">
        <img src="imagenes/gl_presentation/slider5.jpg" alt="Slide 5 jFlow Plus" />
    </div>    
</div>

<div id="myController">
   <span class="jFlowControl"></span>
   <span class="jFlowControl"></span>
   <span class="jFlowControl"></span>
   <span class="jFlowControl"></span>
   <span class="jFlowControl"></span>
</div>
<section class="jFlowPrev"><div></div></section>
<section class="jFlowNext"><div></div></section>
 </div>
    <div style="font-size:10px;font-family:Arial;color:white" align="center">
        Copyright © 2012, Tacna-Perú UPeU Systems Todos los derechos reservados<br>
        Para mayor información contactenos al celular: 952624449 ó 953633245<br>
        Email: josmarl567@gmail.com , elmagwi@gmail.com 
    </div>
</div>
    <div class="divlogin">
            <form id="form1" name="form1" action="Modulos/usuario_login.jsp">
            <table border="0">
                <thead>
                    <tr>
                        <th colspan="2" class="titlelogin" >LOGIN</th>                        
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="right">Usuario:</td>
                        <td><input type="text" class="textImput" name="login" value="" /></td>
                    </tr>
                    <tr>
                        <td align="right">Password:</td>
                        <td><input type="password" class="textImput" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit"  class="button" value="Ingresar" /> 
                            <div align="center"style="color:red;font-size:10px;font-family:Tahoma;text-decoration:blink">Este Usuario no existe</div>
                        </td>                        
                    </tr>
                </tbody>
            </table>                
            </form>
            </div>
       


    </body>
</html>
