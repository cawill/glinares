/* Copyright 2007 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2008/04/15 19:39:59 gmurray71 Exp $
*/
jmaki.namespace("jmaki.widgets.jmaki.feedreader");

jmaki.widgets.jmaki.feedreader.Widget = function(wargs) {

    var _widget = this;   
    var container;
    var list;
    var items = [];
    var index = 0;
    var count = 3;
    var topic = "/jmaki/feedreader";
    var subscribe = ["/jmaki/feedreader"];    
    var filter = "jmaki.widgets.jmaki.feedreader.TAFilter";
    
    var next;
    var prev;
    var shownav = true;
    var nav  = document.getElementById(wargs.uuid + "_nav");
    var navPages  = document.getElementById(wargs.uuid + "_mid");
    var template;
    
    var blockHeight;
    var maxLength = 1024;

    var feed ="https://api.feedburner.com/format/1.0/JSONP?uri=TheAquarium_en";
       
    // JSONP callback
    this.processJSONFeed = function(obj) {
        _widget.model = jmaki.filter(obj, jmaki.widgets.jmaki.feedreader.TAFilter);
        _widget.clearList();
        init();
    };
    
    this.getJSONFeed = function(_url) {
       jmaki.publish("/showWait", {targetId : wargs.uuid, message : "Loading..."});        
        var _jfeed = _url + "&callback=jmaki.getWidget('" + wargs.uuid + "').processJSONFeed"; 
        jmaki.addLibraries([_jfeed], undefined,undefined, true);//, undefined, false);
    };

    this.addItem = function(text) {
        var li = document.createElement("li");
        if (blockHeight) li.style.height = blockHeight + "px";
        li.innerHTML = text;
        list.appendChild(li);
    };
    
    this.destroy = function() {
        delete list;
        delete next;
        delete prev;
        delete container;
    };
    
    this.reize = function() {
        _widget.container.style.height = _widget.dim.h -2 + "px";  
    };

    this.render = function() {
        // remove the innerHTML
        list.innerHTML = "";
        for (var _i=index; _i < items.length && _i < (index + count); _i++) {
          _widget.addItem(items[_i]);
        }
        if ((index + count) >= _widget.model.length) {
            next.style.visibility = "hidden";
        } else {
            next.style.visibility= "visible";
        }
        if (index == 0) {
            prev.style.visibility = "hidden";
        } else {
            prev.style.visibility= "visible";
        }
        // update numbers at the bottom
        if (items.length > count) {
            navPages.innerHTML = "";
            for (var i=0; i < (items.length / count); i++) {
                var a = document.createElement("a");
                a.pageNum = i;
                a.appendChild(document.createTextNode(i));
                a.title = "Page " + i;
                a.onclick = function(e) {            
                    var _t;
                    if (!e) _t = window.event.srcElement;
                    else _t = e.target;                    
                    if (typeof _t.pageNum != 'undefined'){                   
                      _widget.showPage(_t.pageNum);
                    }
                }
                if ((index / count) == i) {
                    a.className = "mid-selected";
                }
                navPages.appendChild(a);
            } 
        }
        _widget.container.style.height = _widget.dim.h -2 + "px";            
    };
    
    this.applyTemplate = function(obj, _t) {
        for (var i in obj) {
            var token = "@{" + i + "}";
            while (_t.indexOf(token) != -1) {
                _t = _t.replace(token, obj[i]);
            }
        }
        return _t;
    };
    
    this.getNext = function() {
        if (index + count < _widget.model.length) index += count;
        _widget.clearList();        
        _widget.render();
    };
    
    this.getPrevious = function() {
        if (index > 0){
            index -= count;
            prev.enabled = "true";
        } else {
            prev.enabled = "false";
            index = 0;
        }
        _widget.clearList();        
        _widget.render();
        
    };
    
    this.showPage = function(num) {    
        if (num * count < items.length) index = num * count;
        _widget.clearList();
        _widget.render();
    };
    
    this.clearList = function() {
        if (!list) return;
        for (var i= list.childNodes.length - 1; i > 0 ; i--) {
           list.removeChild(list.childNodes[i]);
        }
    };

    function init() {
       for (var _i=index; _i < _widget.model.length; _i++) {
         items.push(_widget.applyTemplate(_widget.model[_i], template));
       }
       container = document.getElementById(wargs.uuid);
       var dim = jmaki.getDimensions(container, 52);

       container.style.height = dim.h + "px";
       var content = document.getElementById(wargs.uuid + "_content");
      
       list = document.getElementById(wargs.uuid + "_list");      
       content.style.height = dim.h - 50 + "px";

       next = document.getElementById(wargs.uuid + "_next");
       prev = document.getElementById(wargs.uuid + "_previous");
       next.onclick = _widget.getNext;
       prev.onclick = _widget.getPrevious;
       _widget.render();
       if (shownav) nav.style.display = "block";
       jmaki.publish("/hideWait", {targetId : wargs.uuid});
    }
    
    this.destroy = function() {
        for (var i=0; _widget.subs && i < _widget.subs.length; i++) {
            jmaki.unsubscribe(_widget.subs[i]);
        }
    };       
    
    function doSubscribe(topic, handler) {
        var i = jmaki.subscribe(topic, handler);
        _widget.subs.push(i);     
    }
    
    this.clear = function() {
        items = [];
    
    };
    
    this.postLoad = function() {
        _widget.container = document.getElementById(wargs.uuid);
        _widget.dim =jmaki.getDimensions(_widget.container);

        if (wargs.args) {
            if (wargs.args.count) {
                count = Number(wargs.args.count);
            }
            if (wargs.args.entryMaxLength) {
                maxLength = Number(wargs.args.entryMaxLength);
            }            
            if (wargs.args.blockHeight) {
                blockHeight = Number(wargs.args.blockHeight);
            }
            if (typeof wargs.args.shownavigation != 'undefined') {        
                shownav = wargs.args.shownavigation;  
                if (nav && shownav == false) nav.style.display = "none";
            }
           if (wargs.args.filter) {
               filter = wargs.args.filter;
           }
           if (wargs.args.feed) {
               feed = wargs.args.feed;
           }       
        }
        
        if (wargs.publish){
            topic = wargs.publish;
        }       
        template = unescape(document.getElementById(wargs.uuid + "_template").innerHTML + "");
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
        }
        if (wargs.value) {      	
            if (wargs.args && wargs.args.filter){
                _widget.model = jmaki.filter(wargs.value, wargs.args.filter);
            }else  _widget.model = wargs.value;
            init();
        } else if (wargs.service) {
            jmaki.publish("/showWait", {targetId : wargs.uuid, message : "Loading..."});
            jmaki.doAjax({url: wargs.service, callback: function(req) {
    
                        var _in = eval('(' + req.responseText + ')');
                        if (_in.dataType) {
                            if (_in.dataType == "jmakiRSS") {
                              _widget.model = jmaki.filter(_in, filter);
                            }  else {
                              _widget.model = _in;
                            }
                        } else {
                            _widget.model = _in;
                        }
                        init();
            }});
        } else if (feed) {        	
            _widget.getJSONFeed(feed);
        }        
    };
  jmaki.widgets.jmaki.feedreader.TAFilter = function(_in) {
    var _rows = [];

    for (var _i=0; _i < _in.feed.items.length;_i++) {
      var _des = _in.feed.items[_i].body;
      
        var rex = new RegExp("\\\\n", "g");
        _des =  _des.replace(rex," ");

        rex = new RegExp("\\\\\"","g");
        _des =  _des.replace(rex,"\"");
        var rex2 = new RegExp("<p>.*?</p>");
//      var content = _des.match(rex2)[0];
	    var content = _des;

        if (content.length > maxLength) {
          content = content.substring(0, maxLength) + "... ";
        }
        var row = {      
          title : _in.feed.items[_i].title,
          link : _in.feed.items[_i].link,
          date : _in.feed.items[_i].date,
          body : _des,
          shortContent : content
       };
      _rows.push(row);
    }
    return _rows;  
}    
};

jmaki.namespace("jmaki.extensions.jmaki.wait");

jmaki.extensions.jmaki.wait.Extension = function(eargs) { 
 this.showWait = function(args) {     
   if (args.targetId) {  
       var target = document.getElementById(args.targetId);        
       if (target) {
          var loc = jmaki.getPosition(target);
          var dim = jmaki.getDimensions(target);        
          var cw = target.clientWidth;
          var ch = target.clientHeight;
          if (ch==0) {
               ch = dim.h;
               cw = dim.w;
          }
          var splashW = 150;
          var splashH = 150;
          var iconW = 128;
          var iconH = 128;
          // resize the loader to be poportioinal
          if (ch < iconH && ch) {
              splashH = ch -10;
              splashW = splashH;
              iconH = splashH - 15;
              iconW = iconH;
          }
          var splash = document.createElement("div");
          splash.id = args.targetId + "_splash";
          splash.style.position = "absolute";
          splash.style.background = "#000";
          splash.style.zIndex = 9998;

          document.body.appendChild(splash);

          splash.style.opacity = .65;
          // TODO : Need this for IE
          var icon = document.createElement("img");
          icon.style.position = "relative";
          icon.src = eargs.extensionDir + "/images/loading.gif";
       
          splash.appendChild(icon);
          icon.style.width = iconW + "px";
          icon.style.height = iconH + "px";
          icon.style.top = (splash.clientHeight / 2) - (iconH / 2)  +  "px";
                    
          if (args.message) {       
              var message = document.createElement("div");
              message.innerHTML = args.message;
              message.style.color = "#FFF";             
              message.style.position = "absolute";
              message.style.width = "97%";
              message.style.textAlign = "center";
              message.style.fontSize = "12px"; 
              message.style.top = iconH + 10 + "px";
              message.style.left = '5px';
              splash.appendChild(message);

              splashH += 25;
              splashW += 25;      
          }                    
       }
       if (typeof args.modal !='undefined' && args.modal == true) {
             splash.style.width = cw + "px";
             splash.style.height = ch + "px";
             splash.style.top = loc.y + "px";
             splash.style.left = loc.x + "px";              
         } else {
             splash.style.width = splashW + "px";
             splash.style.height = splashH + "px";
             splash.style.left = loc.x + (cw / 2) - (splashW / 2) +  "px";
             splash.style.top = loc.y  + (ch / 2) - (splashH / 2) +  "px";                            
         }
         icon.style.left = (splash.clientWidth / 2) - (iconW / 2)  +  "px";
     }

   };
  jmaki.subscribe("/showWait", this.showWait);
 
   this.hideWait = function(args) {
     if (args.targetId) { 
         var target = document.getElementById(args.targetId + "_splash");
         if (target) {
             target.parentNode.removeChild(target);
         }
     }
   };
   jmaki.subscribe("/hideWait", this.hideWait); 
};

