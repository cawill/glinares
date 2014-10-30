/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function requerirDir(){
                try{
                    req=new XMLHttpRequest();
                }catch(err1){
                    try{
                        req=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(err2){
                        try{
                            req=new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(err3){
                            req=false;
                        }
                    }
                }
                return req;
            }

            function requerirRuc(){
                try{
                    req=new XMLHttpRequest();
                }catch(err1){
                    try{
                        req=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(err2){
                        try{
                            req=new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(err3){
                            req=false;
                        }
                    }
                }
                return req;
            }
            function requerirDescIgv(){
                try{
                    req=new XMLHttpRequest();
                }catch(err1){
                    try{
                        req=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(err2){
                        try{
                            req=new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(err3){
                            req=false;
                        }
                    }
                }
                return req;
            }


            var peticion=requerirDir();
            var peticionRuc=requerirRuc();
            var peticionDescIgv=requerirDescIgv();
            
             function llamarAjaxGETdescripcionIgv()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("igv").value;
                var url="descripcion_igv.jsp?valor="+valor+"&r="+aleatorio;
                peticionDescIgv.open("GET", url, true);
                peticionDescIgv.onreadystatechange=respuestaAjaxdescripcionIgv;
                peticionDescIgv.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionDescIgv.send(null);
            }

              function respuestaAjaxdescripcionIgv()
            {
                if(peticionDescIgv.readyState==4){
                    if(peticionDescIgv.status==200){
                        document.getElementById("igvr").innerHTML=peticionDescIgv.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionDescIgv.statusText);
                    }
                }
            }


            function llamarAjaxGETdireccionFactura()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("cliente").value;
                var url="direccion_factura.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxdireccionFactura;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }

              function respuestaAjaxdireccionFactura()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("dir").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }


             function llamarAjaxGETrucFactura()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("cliente").value;
                var url="ruc_factura.jsp?valor="+valor+"&r="+aleatorio;
                peticionRuc.open("GET", url, true);
                peticionRuc.onreadystatechange=respuestaAjaxrucFactura;
                peticionRuc.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionRuc.send(null);
            }

              function respuestaAjaxrucFactura()
            {
                if(peticionRuc.readyState==4){
                    if(peticionRuc.status==200){
                        document.getElementById("ruc").innerHTML=peticionRuc.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionRuc.statusText);
                    }
                }
            }

function recogerDirAndRuc(){
    llamarAjaxGETdireccionFactura();
    llamarAjaxGETrucFactura();
}
             function llamarAjaxGETfechaCancelLetrasFactura()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("estado").value;
                var url="fechaCancelLetras_factura.jsp?valor="+valor+"&r="+aleatorio;
                peticion.open("GET", url, true);
                peticion.onreadystatechange=respuestaAjaxfechaCancelLetrasFactura;
                peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticion.send(null);
            }

              function respuestaAjaxfechaCancelLetrasFactura()
            {
                if(peticion.readyState==4){
                    if(peticion.status==200){
                        document.getElementById("fechCL").innerHTML=peticion.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticion.statusText);
                    }
                }
            }

//--------------------para busqueda de facturas---------------------

/*
function requerirTipoInputBusFac(){
                try{
                    req=new XMLHttpRequest();
                }catch(err1){
                    try{
                        req=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(err2){
                        try{
                            req=new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(err3){
                            req=false;
                        }
                    }
                }
                return req;
            }

            peticionIBF=requerirTipoInputBusFac();

           function llamarInputBusFac()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("opcionBusquedaFac").value;
                var url="input_bus_fac.jsp?valor="+valor+"&r="+aleatorio;
                peticionIBF.open("GET", url, true);
                peticionIBF.onreadystatechange=respuestaInputBusFac;
                peticionIBF.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionIBF.send(null);
            }

              function respuestaInputBusFac()
            {
                if(peticionIBF.readyState==4){
                    if(peticionIBF.status==200){
                        document.getElementById("textBusFac").innerHTML=peticionIBF.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionIBF.statusText);
                    }
                }
            }*/
              
//------------------------------------------Refresh Cliente para facturas y boletas--------------------


function requerirRefreshCliente(){
                try{
                    req=new XMLHttpRequest();
                }catch(err1){
                    try{
                        req=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(err2){
                        try{
                            req=new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(err3){
                            req=false;
                        }
                    }
                }
                return req;
            }

            peticionRefreshCliente=requerirRefreshCliente();

           function llamarRefreshCliente()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("cli").value;
                var url="cliente_ref_factura.jsp?valor="+valor+"&r="+aleatorio;
                peticionRefreshCliente.open("GET", url, true);
                peticionRefreshCliente.onreadystatechange=respuestaRefreshCliente;
                peticionRefreshCliente.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionRefreshCliente.send(null);
            }

              function respuestaRefreshCliente()
            {
                if(peticionRefreshCliente.readyState==4){
                    if(peticionRefreshCliente.status==200){
                        document.getElementById("cli").innerHTML=peticionRefreshCliente.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionRefreshCliente.statusText);
                    }
                }
            }
            
            //--------------------------moneda letras-------------------------------
            
         function requerirMoneda(){
                try{
                    req=new XMLHttpRequest();
                }catch(err1){
                    try{
                        req=new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(err2){
                        try{
                            req=new ActiveXObject("Msxml2.XMLHTTP");
                        }catch(err3){
                            req=false;
                        }
                    }
                }
                return req;
            }

            peticionMoneda=requerirMoneda();

           function llamarMoneda()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("moneda").value;
                var url="moneda.jsp?valor="+valor+"&r="+aleatorio;
                peticionMoneda.open("GET", url, true);
                peticionMoneda.onreadystatechange=respuestaMoneda;
                peticionMoneda.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionMoneda.send(null);
            }

              function respuestaMoneda()
            {
                if(peticionMoneda.readyState==4){
                    if(peticionMoneda.status==200){
                        document.getElementById("mon").innerHTML=peticionMoneda.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionMoneda.statusText);
                    }
                }
            }   