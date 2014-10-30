/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function requerir(){
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


function requerirPlaca(){
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

//--------------------------------------
function requerirMarca(){
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

function requerirNumero(){
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

function requerirCap(){
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

function requerirAnio(){
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
function requerirPlacaRampla(){
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

function requerirCodigoCamion(){
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

var peticionDir=requerirDir();
var peticion=requerir();
var peticionRuc=requerirRuc();
var peticionPlaca=requerirPlaca();
var peticionPlacaRampla=requerirPlacaRampla();
var peticionCodigoCamion=requerirCodigoCamion();


function llamarAjaxGETdireccion()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cliente").value;
    var url="direccion.jsp?valor="+valor+"&r="+aleatorio;
    peticionDir.open("GET", url, true);
    peticionDir.onreadystatechange=respuestaAjaxdireccion;
    peticionDir.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionDir.send(null);
}

function llamarAjaxGETcodigoCamion()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cliente").value;
    var url="codigo_camion.jsp?valor="+valor+"&r="+aleatorio;
    peticionCodigoCamion.open("GET", url, true);
    peticionCodigoCamion.onreadystatechange=respuestaAjaxcodigoCamion;
    peticionCodigoCamion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionCodigoCamion.send(null);
}

function llamarAjaxGETplacaRampla()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cliente").value;
    var url="placa_rampla.jsp?valor="+valor+"&r="+aleatorio;
    peticionPlacaRampla.open("GET", url, true);
    peticionPlacaRampla.onreadystatechange=respuestaAjaxplacaRampla;
    peticionPlacaRampla.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionPlacaRampla.send(null);
}

function llamarAjaxGETruc()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cliente").value;
    var url="ruc.jsp?valor="+valor+"&r="+aleatorio;
    peticionRuc.open("GET", url, true);
    peticionRuc.onreadystatechange=respuestaAjaxruc;
    peticionRuc.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionRuc.send(null);
}

function llamarAjaxGETplaca()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cliente").value;
    var url="placa.jsp?valor="+valor+"&r="+aleatorio;
    peticionPlaca.open("GET", url, true);
    peticionPlaca.onreadystatechange=respuestaAjaxplaca;
    peticionPlaca.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionPlaca.send(null);
}
function recogerDirRucPlacaofRol(){

   llamarAjaxGETdireccion();
   llamarAjaxGETplaca();
   llamarAjaxGETruc();   
   llamarAjaxGETplacaRampla();
   llamarAjaxGETcodigoCamion();
   
}


function llamarAjaxGETmarca()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa").value;
    var url="marca.jsp?valor="+valor+"&r="+aleatorio;
    peticionMarca.open("GET", url, true);
    peticionMarca.onreadystatechange=respuestaAjaxmarca;
    peticionMarca.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionMarca.send(null);
}

function llamarAjaxGETnumero()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa").value;
    var url="numero.jsp?valor="+valor+"&r="+aleatorio;
    peticionNumero.open("GET", url, true);
    peticionNumero.onreadystatechange=respuestaAjaxnumero;
    peticionNumero.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionNumero.send(null);
}

function llamarAjaxGETcapacidad()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa").value;
    var url="capacidad.jsp?valor="+valor+"&r="+aleatorio;
    peticionCap.open("GET", url, true);
    peticionCap.onreadystatechange=respuestaAjaxcapacidad;
    peticionCap.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionCap.send(null);
}

function llamarAjaxGETanio()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa").value;
    var url="anio.jsp?valor="+valor+"&r="+aleatorio;
    peticionAnio.open("GET", url, true);
    peticionAnio.onreadystatechange=respuestaAjaxanio;
    peticionAnio.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionAnio.send(null);
}

var peticionMarca=requerirMarca();
var peticionNumero=requerirNumero();
var peticionCap=requerirCap();
var peticionAnio=requerirAnio();

function recogerMarNumCapAnOfPlaca(){
    llamarAjaxGETmarca();
    llamarAjaxGETnumero();
    llamarAjaxGETcapacidad();
    llamarAjaxGETanio();
}
//---------------------------------------------------------------------

function requerirDirRemitente(){
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
function requerirPaisRemitente(){
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

var peticionDirRem=requerirDirRemitente();
var peticionPaisRem=requerirPaisRemitente();

function llamarAjaxGETDirRemitente()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("razRemitente").value;
    var url="dir_remitente.jsp?valor="+valor+"&r="+aleatorio;
    peticionDirRem.open("GET", url, true);
    peticionDirRem.onreadystatechange=respuestaAjaxDirRemitente;
    peticionDirRem.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionDirRem.send(null);
}
function llamarAjaxGETPaisRemitente()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("razRemitente").value;
    var url="pais_remitente.jsp?valor="+valor+"&r="+aleatorio;
    peticionPaisRem.open("GET", url, true);
    peticionPaisRem.onreadystatechange=respuestaAjaxPaisRemitente;
    peticionPaisRem.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionPaisRem.send(null);
}
function recogerDirPaisOfRemitente(){
llamarAjaxGETDirRemitente();
llamarAjaxGETPaisRemitente();
}
//----------------------------------------------------------------------------
function requerirDirDestinatario(){
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
function requerirPaisDestinatario(){
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

var peticionDirDest=requerirDirDestinatario();
var peticionPaisDest=requerirPaisDestinatario();

function llamarAjaxGETDirDestinatario()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("razDestinatario").value;
    var url="dir_destinatario.jsp?valor="+valor+"&r="+aleatorio;
    peticionDirDest.open("GET", url, true);
    peticionDirDest.onreadystatechange=respuestaAjaxDirDestnatario;
    peticionDirDest.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionDirDest.send(null);
}

function llamarAjaxGETPaisDestinatario()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("razDestinatario").value;
    var url="pais_destinatario.jsp?valor="+valor+"&r="+aleatorio;
    peticionPaisDest.open("GET", url, true);
    peticionPaisDest.onreadystatechange=respuestaAjaxPaisDestnatario;
    peticionPaisDest.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionPaisDest.send(null);
}
function recogerDirPaisOfDest(){
    llamarAjaxGETDirDestinatario();
    llamarAjaxGETPaisDestinatario();
}
//---------------------------------------------------------------------------

function requerirDirConsignatario(){
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
function requerirPaisConsignatario(){
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

var peticionDirCons=requerirDirConsignatario();
var peticionPaisCons=requerirPaisConsignatario();

function llamarAjaxGETDirConsignatario()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("razConsignatario").value;
    var url="dir_consignatario.jsp?valor="+valor+"&r="+aleatorio;
    peticionDirCons.open("GET", url, true);
    peticionDirCons.onreadystatechange=respuestaAjaxDirConsignatario;
    peticionDirCons.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionDirCons.send(null);
}

function llamarAjaxGETPaisConsignatario()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("razConsignatario").value;
    var url="pais_consignatario.jsp?valor="+valor+"&r="+aleatorio;
    peticionPaisCons.open("GET", url, true);
    peticionPaisCons.onreadystatechange=respuestaAjaxPaisConsignatario;
    peticionPaisCons.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionPaisCons.send(null);
}
function recogerDirPaisOfCons(){
    llamarAjaxGETDirConsignatario();
    llamarAjaxGETPaisConsignatario();
}
//----------------------------------------------------------------------------
function respuestaAjaxdireccion()
{
    if(peticionDir.readyState==4){
        if(peticionDir.status==200){
            document.getElementById("dir").innerHTML=peticionDir.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionDir.statusText);
        }
    }
}

function respuestaAjaxcodigoCamion()
{
    if(peticionCodigoCamion.readyState==4){
        if(peticionCodigoCamion.status==200){
            document.getElementById("codigo_camion").innerHTML=peticionCodigoCamion.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionCodigoCamion.statusText);
        }
    }
}



function respuestaAjaxplacaRampla()
{
    if(peticionPlacaRampla.readyState==4){
        if(peticionPlacaRampla.status==200){
            document.getElementById("plaram").innerHTML=peticionPlacaRampla.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionPlacaRampla.statusText);
        }
    }
}

function respuestaAjaxruc()
{
    if(peticionRuc.readyState==4){
        if(peticionRuc.status==200){
            document.getElementById("ruc").innerHTML=peticionRuc.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionRuc.statusText);
        }
    }
}

function respuestaAjaxplaca()
{
    if(peticionPlaca.readyState==4){
        if(peticionPlaca.status==200){
            document.getElementById("pla").innerHTML=peticionPlaca.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionPlaca.statusText);
        }
    }
}

function respuestaAjaxmarca()
{
    if(peticionMarca.readyState==4){
        if(peticionMarca.status==200){
            document.getElementById("mar").innerHTML=peticionMarca.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionMarca.statusText);
        }
    }
}

function respuestaAjaxnumero()
{
    if(peticionNumero.readyState==4){
        if(peticionNumero.status==200){
            document.getElementById("num").innerHTML=peticionNumero.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionNumero.statusText);
        }
    }
}

function respuestaAjaxcapacidad()
{
    if(peticionCap.readyState==4){
        if(peticionCap.status==200){
            document.getElementById("cap").innerHTML=peticionCap.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionCap.statusText);
        }
    }
}


function respuestaAjaxanio()
{
    if(peticionAnio.readyState==4){
        if(peticionAnio.status==200){
            document.getElementById("ani").innerHTML=peticionAnio.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionAnio.statusText);
        }
    }
}

function respuestaAjaxDirRemitente()
{
    if(peticionDirRem.readyState==4){
        if(peticionDirRem.status==200){
            document.getElementById("rdi").innerHTML=peticionDirRem.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionDirRem.statusText);
        }
    }
}

function respuestaAjaxPaisRemitente()
{
    if(peticionPaisRem.readyState==4){
        if(peticionPaisRem.status==200){
            document.getElementById("rpa").innerHTML=peticionPaisRem.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionPaisRem.statusText);
        }
    }
}

function respuestaAjaxDirDestnatario()
{
    if(peticionDirDest.readyState==4){
        if(peticionDirDest.status==200){
            document.getElementById("ddi").innerHTML=peticionDirDest.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionDirDest.statusText);
        }
    }
}

function respuestaAjaxPaisDestnatario()
{
    if(peticionPaisDest.readyState==4){
        if(peticionPaisDest.status==200){
            document.getElementById("dpa").innerHTML=peticionPaisDest.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionPaisDest.statusText);
        }
    }
}


function respuestaAjaxDirConsignatario()
{
    if(peticionDirCons.readyState==4){
        if(peticionDirCons.status==200){
            document.getElementById("cdi").innerHTML=peticionDirCons.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionDirCons.statusText);
        }
    }
}

function respuestaAjaxPaisConsignatario()
{
    if(peticionPaisCons.readyState==4){
        if(peticionPaisCons.status==200){
            document.getElementById("cpa").innerHTML=peticionPaisCons.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionPaisCons.statusText);
        }
    }
}



function respuestaAjaxchofer()
{
    if(peticionChofer.readyState==4){
        if(peticionChofer.status==200){
            document.getElementById("cho").innerHTML=peticionChofer.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionChofer.statusText);
        }
    }
}



function respuestaAjaxlicencia()
{
    if(peticion.readyState==4){
        if(peticion.status==200){
            document.getElementById("lic").innerHTML=peticion.responseText;
        }else{
            alert("Ha ocurrido un error" +peticion.statusText);
        }
    }
}


//-----------------------------------------------------------
function requerirDS(){
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

function requerirPlacaRamplaSubs(){
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

function requerirRS(){
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
function requerirPS(){
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

function requerirCCamS(){
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


var peticionCliSubs=requerirDS();
var peticionRucSubs=requerirRS();
var peticionPlaSubs=requerirPS();
var peticionPlaRamSubs=requerirPlacaRamplaSubs();
var peticionCodCamSubs=requerirCCamS();

function llamarAjaxGETdirSubs()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cl_subs").value;
    var url="cliente_subs.jsp?valor="+valor+"&r="+aleatorio;
    peticionCliSubs.open("GET", url, true);
    peticionCliSubs.onreadystatechange=respuestaAjaxdirSubs;
    peticionCliSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionCliSubs.send(null);
}



function respuestaAjaxdirSubs()
{
    if(peticionCliSubs.readyState==4){
        if(peticionCliSubs.status==200){
            document.getElementById("cli_s").innerHTML=peticionCliSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionCliSubs.statusText);
        }
    }
}


function llamarAjaxGETcodCamSubs()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cl_subs").value;
    var url="codigo_camion_subs.jsp?valor="+valor+"&r="+aleatorio;
    peticionCodCamSubs.open("GET", url, true);
    peticionCodCamSubs.onreadystatechange=respuestaAjaxcodCamSubs;
    peticionCodCamSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionCodCamSubs.send(null);
}


function respuestaAjaxcodCamSubs()
{
    if(peticionCodCamSubs.readyState==4){
        if(peticionCodCamSubs.status==200){
            document.getElementById("codigo_camion_subs").innerHTML=peticionCodCamSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionCodCamSubs.statusText);
        }
    }
}


function llamarAjaxGETrucSubs()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cl_subs").value;
    var url="ruc_subs.jsp?valor="+valor+"&r="+aleatorio;
    peticionRucSubs.open("GET", url, true);
    peticionRucSubs.onreadystatechange=respuestaAjaxrucSubs;
    peticionRucSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionRucSubs.send(null);
}
function respuestaAjaxrucSubs()
{
    if(peticionRucSubs.readyState==4){
        if(peticionRucSubs.status==200){
            document.getElementById("ruc_s").innerHTML=peticionRucSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionRucSubs.statusText);
        }
    }
}
function llamarAjaxGETplacaSubs()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cl_subs").value;
    var url="placa_subs.jsp?valor="+valor+"&r="+aleatorio;
    peticionPlaSubs.open("GET", url, true);
    peticionPlaSubs.onreadystatechange=respuestaAjaxplacaSubs;
    peticionPlaSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionPlaSubs.send(null);
}
function respuestaAjaxplacaSubs()
{
    if(peticionPlaSubs.readyState==4){
        if(peticionPlaSubs.status==200){
            document.getElementById("pla_s").innerHTML=peticionPlaSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionPlaSubs.statusText);
        }
    }
}

function llamarAjaxGETplaRamSubs()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cl_subs").value;
    var url="placa_rampla_subs.jsp?valor="+valor+"&r="+aleatorio;
    peticionPlaRamSubs.open("GET", url, true);
    peticionPlaRamSubs.onreadystatechange=respuestaAjaxplaRamSubs;
    peticionPlaRamSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionPlaRamSubs.send(null);
}
function respuestaAjaxplaRamSubs()
{
    if(peticionPlaRamSubs.readyState==4){
        if(peticionPlaRamSubs.status==200){
            document.getElementById("plaramSubs").innerHTML=peticionPlaRamSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionPlaRamSubs.statusText);
        }
    }
}



function recogerDirForCS(){

    llamarAjaxGETdirSubs();
    llamarAjaxGETrucSubs();
    llamarAjaxGETplacaSubs();
    llamarAjaxGETplaRamSubs();
    llamarAjaxGETcodCamSubs();
}

//--------------------------------------------------------------------

function requerirMarS(){
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
function requerirNumS(){
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
function requerirCapS(){
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
function requerirAnioS(){
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
var peticionMarSubs=requerirMarS();
var peticionNumSubs=requerirNumS();
var peticionCapSubs=requerirCapS();
var peticionAnioSubs=requerirAnioS();

function llamarAjaxGETmarcaS()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa_subs").value;
    var url="marca_s.jsp?valor="+valor+"&r="+aleatorio;
    peticionMarSubs.open("GET", url, true);
    peticionMarSubs.onreadystatechange=respuestaAjaxmarcaS;
    peticionMarSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionMarSubs.send(null);
}

function llamarAjaxGETnumeroS()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa_subs").value;
    var url="numero_s.jsp?valor="+valor+"&r="+aleatorio;
    peticionNumSubs.open("GET", url, true);
    peticionNumSubs.onreadystatechange=respuestaAjaxnumeroS;
    peticionNumSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionNumSubs.send(null);
}

function llamarAjaxGETcapacidadS()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa_subs").value;
    var url="capacidad_s.jsp?valor="+valor+"&r="+aleatorio;
    peticionCapSubs.open("GET", url, true);
    peticionCapSubs.onreadystatechange=respuestaAjaxcapacidadS;
    peticionCapSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionCapSubs.send(null);
}

function llamarAjaxGETanioS()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("placa_subs").value;
    var url="anio_s.jsp?valor="+valor+"&r="+aleatorio;
    peticionAnioSubs.open("GET", url, true);
    peticionAnioSubs.onreadystatechange=respuestaAjaxanioS;
    peticionAnioSubs.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionAnioSubs.send(null);
}
function respuestaAjaxmarcaS()
{
    if(peticionMarSubs.readyState==4){
        if(peticionMarSubs.status==200){
            document.getElementById("mar_s").innerHTML=peticionMarSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionMarSubs.statusText);
        }
    }
}
function respuestaAjaxnumeroS()
{
    if(peticionNumSubs.readyState==4){
        if(peticionNumSubs.status==200){
            document.getElementById("num_s").innerHTML=peticionNumSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionNumSubs.statusText);
        }
    }
}
function respuestaAjaxcapacidadS()
{
    if(peticionCapSubs.readyState==4){
        if(peticionCapSubs.status==200){
            document.getElementById("cap_s").innerHTML=peticionCapSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionCapSubs.statusText);
        }
    }
}
function respuestaAjaxanioS()
{
    if(peticionAnioSubs.readyState==4){
        if(peticionAnioSubs.status==200){
            document.getElementById("anio_s").innerHTML=peticionAnioSubs.responseText;
        }else{
            alert("Ha ocurrido un error" +peticionAnioSubs.statusText);
        }
    }
}

function recogerMarNumCapAnoForCS(){
    llamarAjaxGETmarcaS();
    llamarAjaxGETnumeroS();
    llamarAjaxGETcapacidadS();
    llamarAjaxGETanioS();
}

//-------------------------------------------------------------------------
var peticionChofer=requerirConductor();

function llamarAjaxGETchofer()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cliente").value;
    var url="chofer.jsp?valor="+valor+"&r="+aleatorio;
    peticionChofer.open("GET", url, true);
    peticionChofer.onreadystatechange=respuestaAjaxchofer;
    peticionChofer.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticionChofer.send(null);
}

function llamarAjaxGETlicencia()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("chofer").value;
    var url="licencia.jsp?valor="+valor+"&r="+aleatorio;
    peticion.open("GET", url, true);
    peticion.onreadystatechange=respuestaAjaxlicencia;
    peticion.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    peticion.send(null);
}

//------------------------------------------------bultos----------------------------

function requerirCodigoBulto(){
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

var requerirCodBulto=requerirCodigoBulto();

function llamarCodigoBulto()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("glosa_bulto").value;
    var url="codigo_bulto.jsp?valor="+valor+"&r="+aleatorio;
    requerirCodBulto.open("GET", url, true);
    requerirCodBulto.onreadystatechange=respuestaCodigoBulto;
    requerirCodBulto.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    requerirCodBulto.send(null);
}

function respuestaCodigoBulto()
{
    if(requerirCodBulto.readyState==4){
        if(requerirCodBulto.status==200){
            document.getElementById("cod_bulto").innerHTML=requerirCodBulto.responseText;
        }else{
            alert("Ha ocurrido un error" +requerirCodBulto.statusText);
        }
    }
}


//-------------------------------codigo aduana de destino----------------------


function requerirCodigoAduanaDestino(){
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

var requerirCodAdDest=requerirCodigoAduanaDestino();

function llamarCodigoAduanaDestino()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("aduana_destino").value;
    var url="codigo_aduana_destino.jsp?valor="+valor+"&r="+aleatorio;
    requerirCodAdDest.open("GET", url, true);
    requerirCodAdDest.onreadystatechange=respuestaCodigoAduanaDestino;
    requerirCodAdDest.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    requerirCodAdDest.send(null);
}

function respuestaCodigoAduanaDestino()
{
    if(requerirCodAdDest.readyState==4){
        if(requerirCodAdDest.status==200){
            document.getElementById("codigo_aduana").innerHTML=requerirCodAdDest.responseText;
        }else{
            alert("Ha ocurrido un error" +requerirCodAdDest.statusText);
        }
    }
}


//-----------------------------------------codigo origen mercancias---------------



function requerirCodigoOrigenMercancias(){
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

var requerirCodOrgMerc=requerirCodigoOrigenMercancias();

function llamarCodigoOrigenMercancias()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("origen_mercancias").value;
    var url="codigo_aduana_origen.jsp?valor="+valor+"&r="+aleatorio;
    requerirCodOrgMerc.open("GET", url, true);
    requerirCodOrgMerc.onreadystatechange=respuestaCodigoOrigenMercancias;
    requerirCodOrgMerc.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    requerirCodOrgMerc.send(null);
}

function respuestaCodigoOrigenMercancias()
{
    if(requerirCodOrgMerc.readyState==4){
        if(requerirCodOrgMerc.status==200){
            document.getElementById("codigo_aduana_origen").innerHTML=requerirCodOrgMerc.responseText;
        }else{
            alert("Ha ocurrido un error" +requerirCodOrgMerc.statusText);
        }
    }
}

//---------------------------codigo aduana partida--------------------


function requerirCodigoAduanaPartida(){
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

var requerirCodAdPart=requerirCodigoAduanaPartida();

function llamarCodigoAduanaPartida()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("aduana_partida").value;
    var url="codigo_aduana_partida.jsp?valor="+valor+"&r="+aleatorio;
    requerirCodAdPart.open("GET", url, true);
    requerirCodAdPart.onreadystatechange=respuestaCodigoAduanaPartida;
    requerirCodAdPart.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    requerirCodAdPart.send(null);
}

function respuestaCodigoAduanaPartida()
{
    if(requerirCodAdPart.readyState==4){
        if(requerirCodAdPart.status==200){
            document.getElementById("codigo_aduana_partida").innerHTML=requerirCodAdPart.responseText;
        }else{
            alert("Ha ocurrido un error" +requerirCodAdPart.statusText);
        }
    }
}

//------------------------------codigo aduana destino final-------------------------------------



function requerirCodigoAduanaDestinoFinal(){
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

var requerirCodAdDestFin=requerirCodigoAduanaDestinoFinal();

function llamarCodigoAduanaDestinoFinal()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("destino_final").value;
    var url="codigo_aduana_final.jsp?valor="+valor+"&r="+aleatorio;
    requerirCodAdDestFin.open("GET", url, true);
    requerirCodAdDestFin.onreadystatechange=respuestaCodigoAduanaDestinoFinal;
    requerirCodAdDestFin.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    requerirCodAdDestFin.send(null);
}

function respuestaCodigoAduanaDestinoFinal()
{
    if(requerirCodAdDestFin.readyState==4){
        if(requerirCodAdDestFin.status==200){
            document.getElementById("codigo_destino_final").innerHTML=requerirCodAdDestFin.responseText;
        }else{
            alert("Ha ocurrido un error" +requerirCodAdDestFin.statusText);
        }
    }
}

//----------------------------refresh conductor---------------


function requerirRefreshChofer(){
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

var requerirRefreshChofer=requerirRefreshChofer();

function llamarRChofer()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cho").value;
    var url="conductor_ref.jsp?valor="+valor+"&r="+aleatorio;
    requerirRefreshChofer.open("GET", url, true);
    requerirRefreshChofer.onreadystatechange=respuestaRChofer;
    requerirRefreshChofer.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    requerirRefreshChofer.send(null);
}

function respuestaRChofer()
{
    if(requerirRefreshChofer.readyState==4){
        if(requerirRefreshChofer.status==200){
            document.getElementById("cho").innerHTML=requerirRefreshChofer.responseText;
        }else{
            alert("Ha ocurrido un error" +requerirRefreshChofer.statusText);
        }
    }
}

//------------------------------------refresh camion original-----------------------------

function requerirRefreshCamionOrig(){
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

var requerirRefreshCamionOrig=requerirRefreshCamionOrig();

function llamarCOrig()
{
    var aleatorio=parseInt(Math.random()*999999999);
    valor=document.getElementById("cli").value;
    var url="cliente_ref.jsp?valor="+valor+"&r="+aleatorio;
    requerirRefreshCamionOrig.open("GET", url, true);
    requerirRefreshCamionOrig.onreadystatechange=respuestaCOrig;
    requerirRefreshCamionOrig.setRequestHeader('Content-Type', 'Application/x-www-form-urlencoded');
    requerirRefreshCamionOrig.send(null);
}

function respuestaCOrig()
{
    if(requerirRefreshCamionOrig.readyState==4){
        if(requerirRefreshCamionOrig.status==200){
            document.getElementById("cli").innerHTML=requerirRefreshCamionOrig.responseText;
        }else{
            alert("Ha ocurrido un error" +requerirRefreshCamionOrig.statusText);
        }
    }
}

