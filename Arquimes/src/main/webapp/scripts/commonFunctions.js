//╔═══════════════════════════════════════════════════════════════════╗
//║ desenvolupador : Josep Lagunas Calpe                              ║
//║ versió : 1.0                                                      ║
//║ data : 02 / 02 / 2009                                             ║
//║ compilació : Common functions JAVASCRIPT                          ║
//║ descripció : Funcions javascript útils                            ║
//╚═══════════════════════════════════════════════════════════════════╝
var xmlhttpReq = null;
var showingPreLoader = false;
function getDDMMYYYY() {
    var day = (this.getDate() < 10) ? "0" + String(this.getDate()) : String(this.getDate());
    var month = (this.getMonth() < 9) ? "0" + String(this.getMonth() + 1) : String(this.getMonth() + 1);
    var year = this.getFullYear();
    return day + "\/" + month + "\/" + year;
}
function parseFromDDMMYYYY(DDMMYYYY) {
    if (DDMMYYYY === undefined) return undefined;
    var validDatePattern = /^(0[1-9]|[12][0-9]|3[01])[- \/.](0[1-9]|1[012])[- \/.](19|20)\d\d$/gi;
    if (String(DDMMYYYY).match(validDatePattern)) {
        var day = String(DDMMYYYY).substr(0, 2);
        var month = String(DDMMYYYY).substr(3, 2);
        var year = String(DDMMYYYY).substr(6, 4);
        return new Date(month + "\/" + day + "\/" + year);
    }
}

function CheckAjaxSessionValidation(AjaxResponse) {

    try {

        if ($(document.body).find(".SessionExpiredContainer").size() > 0)
            return;

        if (AjaxResponse === "403") {
            
            var item = "";
            item += "<div class='FullShadow'/>";
            $(document.body).append(item);

            item = "";
            item += "<div class='SessionExpiredContainer'>";
            item += "   <div class='SessionExpiredTitleContainer Title'>";
            item += "       <span class='SessionExpiredTitleText'>Sesión caducada</span>";
            item += "   </div>";
            item += "   <div class='SessionExpiredContentContainer'>";
            item += "       <span class='SessionExpiredContentText'>Su sesión ha caducado, en breve será redirigido a la pantalla de login</span>";
            item += "   </div>";
            item += "</div>";

            var Menu = $(item).appendTo(document.body);
            CenterMenu(Menu);

            setTimeout(function () { window.location.reload(); }, 3000);

        }
         
        
    } catch (e) {
        setTimeout(window.location.reload(), 1000);
    }

}

function CenterMenu(Menu) {

    var CurrentWidth = Number($(Menu).css("width").replace("px", ""));
    var CurrentHeight = Number($(Menu).css("height").replace("px", ""));


    var CalculatedLeft = (window.innerWidth / 2) - (CurrentWidth / 2);
    var CalculatedTop = (window.innerHeight / 2) - (CurrentHeight / 2);

    $(Menu).css("left", CalculatedLeft + "px");
    $(Menu).css("top", CalculatedTop + "px");

    //Do draggable if needed
    $(Menu).draggable({ handle: $(Menu).find(".Title") });

}

function guidGenerator() {
    var S4 = function () {
        return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
    };
    return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
}

function callServerMethod(async, getAsJSON, locationFile, method, parameters, mustShowPreloader, callback) {
    //Aquesta funcio permet fer una crida a un mètode de servidor i retorna el resultat parsejat com objecte JSON
    //async type=BOOLEAN, indica si la crida es farà de manera asincrónica
    //getAsJSON type=BOOLEAN, true = es retorna el resultat parsejat com objecte javascript (requereix que el mètode cridat
    // retorni un String amb format JSON vàlid).
    // false = el retorna un string sense parsejar, el valor retornat tal i com es rep.
    //localFile type=String, conté el nom i extensió del fitxer que conté el mètode que és cridat.
    //method type=String, conté el nom del mètode que és cridat.
    //parameters type=String, conté els paràmetres passats al mètode cridat (EN FORMAT JSON!) http://www.json.org
    //showPreloader type=Boolean, indica si cal mostrar a l'usuari que es fa una crida al servidor en segon pla
    //callback type=function, mètode que serà invocat un cop finalitzada la crida AJAX i que ha de tenir dos paràmetres d'entrada. El primer amb l'status de la crida
    // El segon per rebre el valor resultant,
    // si en té.
    //while (cancelPreviousAjaxPetition() == false);
    if (mustShowPreloader) {
        showPreloader();
    }
    xmlhttpReq = $.ajax({
        type: "POST",
        url: locationFile + "/" + method,
        data: parameters,
        dataType: "json",
        async: async,
        contentType: "application/json; charset=utf-8",
        success: function (data, textStatus) {
            
            //Check Session Time Out
            CheckAjaxSessionValidation(data.d);
        
            var result = "";
            if (getAsJSON == true) {
                try {
                    result = eval('(' + data.d + ')');
                } catch (e) { }
            } else {
                result = data.d;
            }
            if (mustShowPreloader) {
                hidePreloader();
            }
            callback(textStatus, result);
        },
        error: function (msg) {
            //alert(msg.responseText);
            hidePreloader();
            callback(msg.responseText);
        }
    });

    return xmlhttpReq;
}
function callServerMethodJSP(async, getAsJSON, locationFile, parameters, mustShowPreloader, callback) {
    //Aquesta funcio permet fer una crida a un mètode de servidor i retorna el resultat parsejat com objecte JSON
    //async type=BOOLEAN, indica si la crida es farà de manera asincrónica
    //getAsJSON type=BOOLEAN, true = es retorna el resultat parsejat com objecte javascript (requereix que el mètode cridat
    // retorni un String amb format JSON vàlid).
    // false = el retorna un string sense parsejar, el valor retornat tal i com es rep.
    //localFile type=String, conté el nom i extensió del fitxer que conté el mètode que és cridat.
    //method type=String, conté el nom del mètode que és cridat.
    //parameters type=String, conté els paràmetres passats al mètode cridat (EN FORMAT JSON!) http://www.json.org
    //showPreloader type=Boolean, indica si cal mostrar a l'usuari que es fa una crida al servidor en segon pla
    //callback type=function, mètode que serà invocat un cop finalitzada la crida AJAX i que ha de tenir dos paràmetres d'entrada. El primer amb l'status de la crida
    // El segon per rebre el valor resultant,
    // si en té.
    //while (cancelPreviousAjaxPetition() == false);
    if (mustShowPreloader) {
        showPreloader();
    }
    xmlhttpReq = $.ajax({
        type: "GET",
        url: locationFile,
        data: parameters,
        dataType: "html",
        async: async,
        //contentType: "application/json; charset=utf-8",
        success: function (data, textStatus) {
            
            //Check Session Time Out
            CheckAjaxSessionValidation(data);
        
            var result = "";
            if (getAsJSON == true) {
                try {
                    result = eval('(' + data + ')');
                } catch (e) { }
            } else {
                result = data;
            }
            if (mustShowPreloader) {
                hidePreloader();
            }
            callback(textStatus, result);
        },
        error: function (msg) {
            //alert(msg.responseText);
            hidePreloader();
            callback(msg.responseText);
        }
    });

    return xmlhttpReq;
}

function cancelPreviousAjaxPetition() {
    if (xmlhttpReq != null) {
        if (xmlhttpReq.readyState == 1 || xmlhttpReq.readyState == 2) {
            xmlhttpReq.onreadystatechange = function () { };
            xmlhttpReq.abort();
            hidePreloader();
        }
        return (xmlhttpReq.readyState == 4 || xmlhttpReq.readyState == 0);
    }
}
function doContentUnselectable(id) {
    try {
        $("#" + id).css({ "-moz-user-select": "none", "user-select": "none", "-webkit-user-select": "none", "-o-user-select": "none", "-khtml-user-select": "none" });
        document.getElementById(id).onselectstart = new Function("return false");
    } catch (e) {
    }
}
function convertirEnDatePicker(controlId) {
    $("#" + controlId).css("cursor", "pointer");
    //$("#" + controlId).datepicker({ altField: '#actualDate', onSelect: normalizeDate });
    $("#" + controlId).datepicker({ dateFormat: 'dd/mm/yy' });
    $("#" + controlId).attr("autocomplete", "off");
}
function mostrarVentanaDias(controlId, fechaMin, fechaMax) {
    $("#" + controlId).datepicker("option", "minDate", parseFromDDMMYYYY(fechaMin));
    $("#" + controlId).datepicker("option", "maxDate", parseFromDDMMYYYY(fechaMax));
}
//funció que escriu la data que retorna el datePicker de jquery (MM/DD/YYYY) a (DD/MM/YYYY)
function normalizeDate(date, inst) {
    var dateDDMMYYY = date.charAt(3) + date.charAt(4) + "/" + date.charAt(0) + date.charAt(1) + "/" + Right(date, 4);
    $(this).val(dateDDMMYYY);
}
function LTrim(s) {
    // Devuelve una cadena sin los espacios del principio
    var i = 0;
    var j = 0;
    // Busca el primer caracter <> de un espacio
    for (i = 0; i <= s.length - 1; i++)
        if (s.substring(i, i + 1) != ' ') {
            j = i;
            break;
        }
    return s.substring(j, s.length);
}
//preloader
function showPreloader() {
    if (showingPreLoader == false) {
        showingPreLoader = true;
        var width = screen.width;
        var height = screen.height;
        var left = (width / 2) - 150;
        $(parent.document).find("#divPreloader").css("left", left + "px");
        $(parent.document).find("#divPreloader").animate({ top: "-1px" }, { duration: 500, easing: "easeOutQuart" });
        // $(parent.document).find("#divPreloader").corner("bottom 3px");
    }
}
function hidePreloader() {
    $(parent.document).find("#divPreloader").animate({ top: "-61px" }, { duration: 500, easing: "easeOutQuart", complete: function () { showingPreLoader = false; } });
    //$(parent.document).find("#divPreloader").clearQueue();
}
//mostra un missatge amb informació per l'usuari
function message(idContainer, message, messageType) {
    //messageType = 1 -> information , 2 -> Critical
    doContentUnselectable(idContainer);
    var backColor = "";
    var fontColor = "";
    switch (messageType) {
        case 1:
            backColor = "#66FF33";
            fontColor = "#FFFFFF";
            ico = "info.png";
            break;
        case 2:
            backColor = "#FF0000";
            fontColor = "#FFFFFF";
            ico = "warning.png";
            break;
        default:
            backColor = "#FFFFFF";
            fontColor = "#000000";
    }
    var item = "";
    item = " <div id='divUIMessageBackBlockDiv' style='display:none;position:absolute;left:0px;top:0px;height:100%;width:100%;background-color:transparent;opacity:0.8;filter:(alpha=80);z-index:1000;'>";
    item += " </div>";
    $("#" + idContainer).append(item);
    //$($(document.ownerDocument)[0].body).append(item);
    item = "<div id='divUIMessage' style='display:none;border:solid 1px #ffffff; position: absolute;opacity:0.95;filter:(alpha=95); left: 25%; top: 40%; height: 120px; width: 50%; background-color:" + backColor + "; z-index: 1001; text-align: center;'>";
    item += " <div id='divUIMessageHeader' style='position:absolute;top:0px;left:0px; height:20px;width:100%;background-color:#666666;border-bottom:solid 1px #666666;font-family:arial;color;#ffffff;font-size:10pt;font-weight:bold;'>";
    item += " <div id='divUIMessageHeaderShadow' style='position: absolute; top: 12px; height: 8px; width: 100%; background-color: rgb(0, 0, 0); opacity: 0.3;filter:(alpha=30);'>";
    item += " </div>";
    item += " <span id='spanUIMessageHeader' style='position:absolute;height:auto;width:auto;top:2px;left:10px;z-index:10;color:#ffffff;font-family:arial;font-size:10pt;font-weight:bold;'>";
    item += " Ondema ";
    item += " </span>";
    item += " </div>";
    item += " <div id='divUIMessageBodyShadow' style='position: absolute; top: 70%; height: 30%; width: 100%; background-color: rgb(0, 0, 0); opacity: 0.1;filter:(alpha=10);'>";
    item += " </div>";
    item += " <span style='position: absolute; font-family: arial; font-size: 15pt; height: auto;left:0px;top: 35%; width: 100%; color:" + fontColor + "; text-align: center; vertical-align: middle;'>";
    item += message;
    item += " </span> ";
    item += " <img id='icon' alt='' src='./../img/iconos/" + ico + "' style='position:absolute;top: 35%; left: 5%; width: 32px;' />";
    item += "</div>";
    $("#" + idContainer).append(item);
    /*$("#divUIMessageBackBlockDiv").corner("15px");
    $("#divUIMessageHeader").corner("top 15px");
    $("#divUIMessageBodyShadow").corner("bottom 15px");
    $("#divUIMessage").corner("15px");*/
    $("#divUIMessageBackBlockDiv").fadeIn(500);
    $("#divUIMessage").fadeIn(500, function () { hideMessage("divUIMessageBackBlockDiv", "divUIMessage"); });
}
function hideMessage(idShadow, idMessage) {
    var timerID = setTimeout(function () { clearTimeout(timerID); hideMessage2(idShadow, idMessage); }, 2000);
}
function hideMessage2(idShadow, idMessage) {
    $("#" + idShadow).fadeOut(500);
    $("#" + idMessage).fadeOut(500, function () { removeMessage(idShadow, idMessage); });
}
function removeMessage(idShadow, idMessage) {
    $("#" + idMessage).remove();
    $("#" + idShadow).remove();
}
function RTrim(s) {
    // Quita los espacios en blanco del final de la cadena
    var j = 0;
    // Busca el último caracter <> de un espacio
    for (var i = s.length - 1; i > -1; i--)
        if (s.substring(i, i + 1) != ' ') {
            j = i;
            break;
        }
    return s.substring(0, j + 1);
}
function Trim(s) {
    // Quita los espacios del principio y del final
    return LTrim(RTrim(s));
}
function Left(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else {
        return String(str).substring(0, n);
    }
}
function Right(str, n) {
    if (n <= 0)
        return "";
    else if (n > String(str).length)
        return str;
    else {
        var posini = (String(str).length - n);
        return String(str).substring(posini, String(str).length);
    }
}
var Url = {
    // public method for url encoding
    encode: function (string) {
        return escape(this._utf8_encode(string));
    },
    // public method for url decoding
    decode: function (string) {
        return this._utf8_decode(unescape(string));
    },
    // private method for UTF-8 encoding
    _utf8_encode: function (string) {
        string = string.replace(/\r\n/g, "\n");
        var utftext = "";
        for (var n = 0; n < string.length; n++) {
            var c = string.charCodeAt(n);
            if (c < 128) {
                utftext += String.fromCharCode(c);
            }
            else if ((c > 127) && (c < 2048)) {
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else {
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }
        }
        return utftext;
    },
    // private method for UTF-8 decoding
    _utf8_decode: function (utftext) {
        var string = "";
        var i = 0;
        var c = c1 = c2 = 0;
        while (i < utftext.length) {
            c = utftext.charCodeAt(i);
            if (c < 128) {
                string += String.fromCharCode(c);
                i++;
            }
            else if ((c > 191) && (c < 224)) {
                c2 = utftext.charCodeAt(i + 1);
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));
                i += 2;
            }
            else {
                c2 = utftext.charCodeAt(i + 1);
                c3 = utftext.charCodeAt(i + 2);
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));
                i += 3;
            }
        }
        return string;
    }
}