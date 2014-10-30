/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function requerirTracto(){
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

function requerirRampla(){
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

function requerirConductor(){
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

            function requerirDatosTrans(){
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

            var peticionTracto=requerirTracto();
            var peticionRampla=requerirRampla();
            var peticionConductor=requerirConductor();
            var peticionDatosTrans=requerirDatosTrans();

            function llamarTracto()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("cliente").value;
                var url="tracto_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionTracto.open("GET", url, true);
                peticionTracto.onreadystatechange=respuestaTracto;
                peticionTracto.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionTracto.send(null);
            }

             function respuestaTracto()
            {
                if(peticionTracto.readyState==4){
                    if(peticionTracto.status==200){
                        document.getElementById("tracto").innerHTML=peticionTracto.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionTracto.statusText);
                    }
                }
            }

            function llamarDatosRampla()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("rampla").value;
                var url="rampla_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionRampla.open("GET", url, true);
                peticionRampla.onreadystatechange=respuestaDatosRampla;
                peticionRampla.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionRampla.send(null);
            }

            function respuestaDatosRampla()
            {
                if(peticionRampla.readyState==4){
                    if(peticionRampla.status==200){
                        document.getElementById("ram").innerHTML=peticionRampla.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionRampla.statusText);
                    }
                }
            }            
            
            function llamarConductor()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("cliente").value;
                var url="conductor_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionConductor.open("GET", url, true);
                peticionConductor.onreadystatechange=respuestaConductor;
                peticionConductor.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionConductor.send(null);
            }

              function respuestaConductor()
            {
                if(peticionConductor.readyState==4){
                    if(peticionConductor.status==200){
                        document.getElementById("conductor").innerHTML=peticionConductor.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionConductor.statusText);
                    }
                }
            }


            function llamarDatosTrans()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("cliente").value;
                var url="datosTrans_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionDatosTrans.open("GET", url, true);
                peticionDatosTrans.onreadystatechange=respuestaDatosTrans;
                peticionDatosTrans.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionDatosTrans.send(null);
            }

              function respuestaDatosTrans()
            {
                if(peticionDatosTrans.readyState==4){
                    if(peticionDatosTrans.status==200){
                        document.getElementById("datosTrans").innerHTML=peticionDatosTrans.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionDatosTrans.statusText);
                    }
                }
            }

function recogerDatosGuia(){
    llamarTracto();
    //llamarRampla();
    llamarConductor();
    llamarDatosTrans();
}

//------------------------------------------------------------

function requerirDatosTracto(){
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


            var peticionDatosTracto=requerirDatosTracto();

            function llamarDatosTracto()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("trac").value;
                var url="datosTracto_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionDatosTracto.open("GET", url, true);
                peticionDatosTracto.onreadystatechange=respuestaDatosTracto;
                peticionDatosTracto.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionDatosTracto.send(null);
            }

              function respuestaDatosTracto()
            {
                if(peticionDatosTracto.readyState==4){
                    if(peticionDatosTracto.status==200){
                        document.getElementById("tra").innerHTML=peticionDatosTracto.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionDatosTracto.statusText);
                    }
                }
            }
//---------------------------------------------------------------------------------------------

function requerirLicencia(){
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


            var peticionLic=requerirLicencia();

            function llamarLicencia()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("conductor_lic").value;
                var url="licencia_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionLic.open("GET", url, true);
                peticionLic.onreadystatechange=respuestaLicencia;
                peticionLic.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionLic.send(null);
            }

              function respuestaLicencia()
            {
                if(peticionLic.readyState==4){
                    if(peticionLic.status==200){
                        document.getElementById("lic").innerHTML=peticionLic.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionLic.statusText);
                    }
                }
            }
            
            
            
            
            //-------------------------------------------refresh cliente-------------------------------



function requerirRefreshClienteGuia(){
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

            peticionRefreshClienteGuia=requerirRefreshClienteGuia();

           function llamarRefreshClienteGuia()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("clg").value;
                var url="cliente_ref_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionRefreshClienteGuia.open("GET", url, true);
                peticionRefreshClienteGuia.onreadystatechange=respuestaRefreshClienteGuia;
                peticionRefreshClienteGuia.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionRefreshClienteGuia.send(null);
            }

              function respuestaRefreshClienteGuia()
            {
                if(peticionRefreshClienteGuia.readyState==4){
                    if(peticionRefreshClienteGuia.status==200){
                        document.getElementById("clg").innerHTML=peticionRefreshClienteGuia.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionRefreshClienteGuia.statusText);
                    }
                }
            }
            
            
            //---------------------------refrescar cliente guia destinatario-----------------------
            
            
            function requerirRefreshClienteGuiad(){
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

            peticionRefreshClienteGuiad=requerirRefreshClienteGuiad();

           function llamarRefreshClienteGuiad()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("clg_d").value;
                var url="cliente_ref_guia_dest.jsp?valor="+valor+"&r="+aleatorio;
                peticionRefreshClienteGuiad.open("GET", url, true);
                peticionRefreshClienteGuiad.onreadystatechange=respuestaRefreshClienteGuiad;
                peticionRefreshClienteGuiad.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionRefreshClienteGuiad.send(null);
            }

              function respuestaRefreshClienteGuiad()
            {
                if(peticionRefreshClienteGuiad.readyState==4){
                    if(peticionRefreshClienteGuiad.status==200){
                        document.getElementById("clg_d").innerHTML=peticionRefreshClienteGuiad.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionRefreshClienteGuiad.statusText);
                    }
                }
            }
            
            // -----------------------------------refresh rampla----------------------
            
                        function requerirRefreshRamplaGuia(){
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

            peticionRefreshRamplaGuia=requerirRefreshRamplaGuia();

           function llamarRefreshRamplaGuia()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("rram").value;
                var url="rampla_ref_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionRefreshRamplaGuia.open("GET", url, true);
                peticionRefreshRamplaGuia.onreadystatechange=respuestaRefreshRamplaGuia;
                peticionRefreshRamplaGuia.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionRefreshRamplaGuia.send(null);
            }

              function respuestaRefreshRamplaGuia()
            {
                if(peticionRefreshRamplaGuia.readyState==4){
                    if(peticionRefreshRamplaGuia.status==200){
                        document.getElementById("rram").innerHTML=peticionRefreshRamplaGuia.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionRefreshRamplaGuia.statusText);
                    }
                }
            }
            
            
            
                        // -----------------------------------refresh tracto----------------------
            
                        function requerirRefreshTractoGuia(){
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

            peticionRefreshTractoGuia=requerirRefreshTractoGuia();

           function llamarRefreshTractoGuia()
            {
                var aleatorio=parseInt(Math.random()*999999999);
                valor=document.getElementById("rtra").value;
                var url="tracto_ref_guia.jsp?valor="+valor+"&r="+aleatorio;
                peticionRefreshTractoGuia.open("GET", url, true);
                peticionRefreshTractoGuia.onreadystatechange=respuestaRefreshTractoGuia;
                peticionRefreshTractoGuia.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
                peticionRefreshTractoGuia.send(null);
            }

              function respuestaRefreshTractoGuia()
            {
                if(peticionRefreshTractoGuia.readyState==4){
                    if(peticionRefreshTractoGuia.status==200){
                        document.getElementById("rtrac").innerHTML=peticionRefreshTractoGuia.responseText;
                    }else{
                        alert("Ha ocurrido un error" +peticionRefreshTractoGuia.statusText);
                    }
                }
            }