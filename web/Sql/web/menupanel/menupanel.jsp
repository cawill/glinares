<%-- 
    Document   : menupanel
    Created on : 09/05/2012, 06:48:04 PM
    Author     : magwi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>PANEL DE CONTROL</title>

        <link rel="stylesheet" href="main.css" />
        <!--[if IE 7]><link rel="stylesheet" href="styles/ie7.css" /><![endif]-->    

        <!-- DO NOT USE THESE FILES. they are compiled for fast http access -->
        <!-- if you�re looking for source, download or read documentation -->
        <script src="jquery-1.4.1-and-plugins.min.js" type="text/javascript"></script>
        <script src="main.js" type="text/javascript"></script></head>
    <body>

    <center>

        <div id="site">
            <div id="title">
                <h1>PANEL GL</h1>

            </div>

            <!-- this isn�t part of the plugin, just a control for demo -->
            <ul class="splitter">
            </ul>

            <div class="demo">
                <!-- read the documentation to understand what�s going on here -->
                <ul id="list" class="image-grid">
                    <li data-id="id-1" class="app">

                        <a href="../Modulos/cliente_add_fm.jsp" target="con">
                            <img src="B49618E14.png" width="100" height="100" alt="" /></a>
                        <strong>CLIENTE</strong>
                    </li>
                    
                    <li data-id="id-10" class="app">
                        <a href="../Modulos/tracto_list.jsp" target="con">
                            <img src="../imagenes/icons/tracto.png" width="100" height="100" alt="" /></a>
                        <strong>TRACTO</strong>
                    </li>
                    <li data-id="id-11" class="app">
                        <a href="../Modulos/rampla_list.jsp" target="con">
                            <img src="../imagenes/icons/rampla.png" width="100" height="100" alt="" /></a>
                        <strong>RAMPLA</strong>
                    </li>
                    <li data-id="id-12" class="app">
                        <a href="../Modulos/conductor_list.jsp" target="con">
                            <img src="../imagenes/icons/driver_icon.jpg" width="100" height="100" alt="" /></a>
                        <strong>CONDUCTOR</strong>
                    </li>
                    
                    <li data-id="id-3" class="app">
                        <a href="../Modulos/colaborador_list.jsp" target="con">
                            <img src="address-book.png" width="100" height="100" alt="" /></a>
                        <strong>CLIENTE_COLABORADOR</strong>
                    </li>
                    <li data-id="id-22" class="app">
                        <a href="../Modulos/pais_list.jsp" target="con">
                            <img src="../imagenes/icons/maps.png" width="100" height="100" alt="" /></a>
                        <strong>DESTINOS</strong>
                    </li>
                    <li data-id="id-6" class="">
                        <a href="../Modulos/gasto_list.jsp" target="con">
                            <img src="carrito.png" width="100" height="100" alt="" />
                        </a>
                        <strong>GASTOS</strong>
                    </li>
                    <li data-id="id-21" class="util">
                        <a href="../working.jsp">
                            <img src="textedit.png" width="100" height="100" alt=""/></a>
                        <strong>DESCARGO_VIAJES</strong>
                    </li>
                    <li data-id="id-23" class="util">
                        <a href="../working.jsp">
                            <img src="finder.png" width="100" height="100" alt=""/></a>
                        <strong>CONTIZACIONES</strong>
                    </li>
                    <li data-id="id-23" class="util">
                        <a href="../working.jsp">
                            <img src="pasajero.png" width="100" height="100" alt=""/></a>
                        <strong>RELACION_PASAJEROS</strong>
                    </li>
                    <li data-id="id-7" class="app">
                        <a href="../Modulos/usuario_form.jsp" target="con">
                            <img src="keychain-access.png" width="100" height="100" alt="" />
                        </a>
                        <strong>ADMIN_USER</strong>
                    </li>
                    <li data-id="id-8" class="util">
                        <a href="http://190.41.56.88:8080/track/Track?page=map.device">
                            <img src="network-utility.png" width="100" height="100" alt=""/></a>
                        <strong>GPS</strong></li>
                    <li data-id="id-8" class="util">
                        <a href="http://174.133.209.92/siseperu/">
                            <img src="Satellite-icon.png" width="100" height="100" alt=""/></a>
                        <strong>GPS</strong></li>
                    

                </ul>

            </div>


        </div>
    </center>

</body>
</html>
