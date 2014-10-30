/* Copyright 2008 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2007/04/15 19:39:59 gmurray71 Exp $
*/
/**
 * jMaki Revolver
 * 
 * version 1.1
 *
 * Author : Greg Murray
 * gmurray71 (a) dev.java.com
 * 
 * 
 */
 
jmaki.namespace("jmaki.widgets.jmaki.revolver");

jmaki.widgets.jmaki.revolver.Widget = function(wargs) {

  var _widget = this;

  var offset;
  var arrowRight;
  var arrowLeft;
  var status;

  var index = 0;
  var opacitysetting = 0.1;
  var fadetimer1;
  
  _widget.container = document.getElementById(wargs.uuid);
  _widget.contentPane = document.getElementById(wargs.uuid + "-content-pane");    
  _widget.titleDiv = document.getElementById(wargs.uuid + "-title-pane");
  
  var degree = 0;
    
  // this should also account for the image widths
  var padding = 90;
  var publish = "/jmaki/revolver";
  var subscribe = ["/jmaki/revolver", "/imageviewer"];
  _widget.model = {};

  _widget.dimensions = jmaki.getDimensions(_widget.container);
   
  this.xRadius = (_widget.dimensions.w / 2) - padding;  
  _widget.yRadius = 10;  
  this.centerX = (_widget.dimensions.w / 2);

  this.centerY = 35;

  var gap = 0;
  var speed = 'auto';
  var delay = 5;
  var increment = 3;
  var selected = -1;
  var animate = true;
  var processing = false;
  var range;
  var max = 9;
  
  var aspect = "verticle";

    if (!jmaki.getExtension("jmami.wait")) {
        jmaki.loadExtension({ name : "jmaki.wait", extensionDir : wargs.widgetDir});
    }
    
    function serviceLoad(){
        jmaki.doAjax({
            url : wargs.service,
            callback : function(req) {
                if (req.responseText) {
                    var obj = eval("(" + req.responseText + ")");
                    _widget.model.items = obj.items;    
                }
                if (_widget.model.items != null && _widget.model.items.length == 0) { 
                    return;
                }
                preInit();
                setTimeout(function(){_widget.doAnimation(true)}, 0);
            }
        });
    }
  
    function loadLink(_l) {
        if (selected != _l) {
            var _degree = 0;
            if (degree + _widget.model.items[_l].degree > 360) _degree = (360 - (degree + _widget.model.items[_l].degree)) * -1;
            else _degree =  degree + _widget.model.items[_l].degree;          
            if (_degree > 0 && _degree < 180) {
                _widget.getPrevious();
            } else {
                _widget.getNext();
            }
        }
    }
  
    this.resize = function() {
        _widget.dimensions = jmaki.getDimensions(_widget.container);   
        _widget.xRadius = (_widget.dimensions.w / 2) - padding;   
        _widget.centerX = (_widget.dimensions.w / 2);
        _widget.titleDiv.style.top  = (_widget.dimensions.h ) - 25 + "px";
        _widget.titleDiv.style.left  = 0 + "px";
        _widget.titleDiv.style.width = _widget.dimensions.w + "px";
        if ( _widget.arrowRight) {
            _widget.arrowRight.style.top = (_widget.dimensions.h) - 45  + "px";
            _widget.arrowRight.style.left = (_widget.dimensions.w ) - 55 + "px";
        }
        if (_widget.arrowLeft) {
            _widget.arrowLeft.style.top = (_widget.dimensions.h) - 45 + "px";
            _widget.arrowLeft.style.left = ( 5) + "px";    
        }
        reposition();
    }
    
    function doSubscribe(topic, handler) {
        var i = jmaki.subscribe(topic, handler);
        _widget.subs.push(i);
    }
      
    this.postLoad = function() {
        var tags;
        if (wargs.args) {
            if (wargs.args.padding) {
                padding = wargs.args.padding;
                if (!wargs.args.xRadius) xRadius = (_widget.dimensions.w / 2) - padding;
            }
            if (wargs.args.centerX) {
                _widget.centerX = wargs.args.centerX;
            }
            if (wargs.args.centerY) {
                _widget.centerY = wargs.args.centerY;
            }
            if (wargs.args.xRadius) {
                _widget.xRadius = wargs.args.xRadius;
            }     
            if (wargs.args.yRadius) {
                _widget.yRadius = wargs.args.yRadius;
            }
            if (wargs.args.xRadius) {
                _widget.xRadius = wargs.args.xRadius;
            }
            if (wargs.args.speed) {
                speed = wargs.args.speed;
            }      
            if (wargs.args.aspect) {
                aspect = wargs.args.aspect;
            }
            if (wargs.args.tags) {
                tags = wargs.args.tags;
            }
            if (wargs.args.max) {
                max = wargs.args.max;
            }
        }
        if (wargs.subscribe){
            if (typeof wargs.subscribe == "string") {
                subscribe = [];
                subscribe.push(wargs.subscribe);
            } else {
                subscribe = wargs.subscribe;
            }
        }
        
        if (wargs.publish) {
            publish = wargs.publish;
        }        
        range = Math.round(increment / 2) + 1;  
        // default is auto which will do a speed test
        if (speed == 'auto') {
            var rate = testAnimation();
            if (rate > 75) {
                increment = 15;
                delay = 5;
            }
        } else if (speed == 'slow') {
            delay = 35;
            increment = 1;
        } else if (speed == 'medium') {
            delay = 25;
            increment = 3;
        } else if (speed == 'fast') {
            increment = 4;
            delay = 5;    
        }
        
        
        // attatch the resize listener
        if (window.addEventListener) {
            window.addEventListener('resize', _widget.resize, true);
            _widget.keyListener = function(e) {
                switch (e.keyCode) {	
                    case 37: _widget.getPrevious();
                        break;
                    case 39: _widget.getNext(); 
                        break;
                }    		
            };
            // add key navigation listener
            document.addEventListener("keydown", _widget.keyListener, true);
        } else if (window.attachEvent) {
            window.attachEvent('onresize', _widget.resize);
            // add key navigation listener
            _widget.keyListener =  function() {
                switch (window.event.keyCode) {			
                    case 37: getPrevious();
                        break;
                    case 39: _widget.getNext(); 
                        break;
                }    
            };
            document.attachEvent("onkeydown",  _widget.keyListener);     
        }
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i]  + "/loadTags", _widget.loadTags);            
            doSubscribe(subscribe[_i]  + "/select", _widget.select);
            doSubscribe(subscribe[_i]  + "/selectNext", _widget.getNext);
            doSubscribe(subscribe[_i]  + "/selectPrevious", _widget.getPrevious);
        }
        if (wargs.value) {
            _widget.model.items = wargs.value.items;
            preInit();
        } else if  (wargs.service) {
            serviceLoad();
        } else if (tags) {
            _widget.loadTags(tags);
        }          
    };
    
    function clearImages() {
        for (var _l=0; _widget.model.items && _l < _widget.model.items.length; _l++) {
            _widget.model.items[_l].link.parentNode.removeChild(_widget.model.items[_l].link);
            _widget.model.items[_l].image.parentNode.removeChild(_widget.model.items[_l].image);
            delete _widget.model.items[_l];
        }
        _widget.model.items = [];        
    }
    
    
    function processFlickr(obj) {
        clearImages();
        for (var l = 0;  l < obj.items.length && l < max; l++) {
            
            var description = obj.items[l].description;     
            var start = description.indexOf("src=") + 10;
            var stop =  description.indexOf("_m.jpg");
            var imageBase = description.substring(start,stop);
            var thumbURL = imageBase + "_s.jpg";
            var murl = imageBase + "_m.jpg";
            var name = obj.items[l].title;
            var i = {label : name, url: thumbURL, imgSrc: murl, href : obj.items[l].link};
            _widget.model.items.push(i);
        }
        preInit();
    }


    this.loadTags = function(tags) {
       if (tags.value)tags = tags.value.label;
       jmaki.publish("/hideWait", {targetId : wargs.uuid});
       jmaki.publish("/showWait", {targetId : wargs.uuid, message : "Loading " + tags});
        if (!_widget.flicrkLoader)_widget.flicrkLoader = new jmaki.FlickrLoader(_widget.flickrApiKey);
        _widget.flicrkLoader.load(tags.toLowerCase(), processFlickr);
    };              
        
    this.destroy = function() {
        for (var i=0; _widget.subs && i < _widget.subs.length; i++) {
            jmaki.unsubscribe(_widget.subs[i]);
        }        
        clearImages();      
        if (window.addEventListener) {
             window.removeEventListener('resize', _widget.resize, false);
             document.removeEventListener("keydown", _widget.keyListener, false);
        } else if (window.attachEvent) {
             window.detachEvent('onresize', _widget.resize);
             // add key navigation listener
             document.detachEvent("onkeydown", _widget.keyListener);     
        }     
    };

    var IMG_RELOAD_RETRY_MAX = 30;

    // load an array of images and allow for up to IMG_RELOAD_RETRY_MAX tries
    function loadImages(images, callback) {
	    if (!images[0].complete) {
	        if (!images[0].imageReloadTries) {
	            images[0].imageReloadTries = 0;
	            setTimeout(function(){
                    images[0].imageReloadTries += 1;
                    loadImages(images, callback);
                    },
                    50);
	        } else if (images[0].imageReloadTries < IMG_RELOAD_RETRY_MAX) {
                setTimeout(function(){        
                    images[0].imageReloadTries += 1;
                    loadImages(images, callback);
                    },
                    250);
            } else {
                // failed so ignore
                jmaki.log("failed to load " + images[0].src + " retries=" + images[0].imageReloadTries);
      	        images.shift();
                if (images.length == 0) {
                    callback();
                } else {
                    loadImages(images, callback);
                }
            }
        } else {
               // remove the first item
            images.shift();
            if (images.length == 0) {
                callback();
            } else {
                loadImages(images, callback);
            }
        }
    }

    // preload the styles and images
    function preInit() {
      var imgs = [];
      for (var _l=0; _l < _widget.model.items.length; _l++) {
          var img = document.createElement("img");
          img.src = _widget.model.items[_l].imgSrc;
          imgs.push(img);
      }
      loadImages(imgs, function() {
          init();
      });
    }
    
  function initImages() {
        jmaki.publish("/hideWait", {targetId : wargs.uuid});
        for (var _l=0; _l < _widget.model.items.length; _l++) {
          _widget.model.items[_l].link = document.createElement('a');
          _widget.model.items[_l].image = document.createElement("img");
          _widget.model.items[_l].image.id = _l;
          _widget.model.items[_l].image.style.visibility = 'hidden';
          _widget.model.items[_l].image.style.position = "absolute";
          _widget.model.items[_l].image.src = _widget.model.items[_l].imgSrc;
          _widget.model.items[_l].originalWidth = _widget.model.items[_l].image.width;
          _widget.model.items[_l].originalHeight = _widget.model.items[_l].image.height;   
          _widget.model.items[_l].aspectRatio = _widget.model.items[_l].originalHeight /_widget.model.items[_l].originalWidth;
          _widget.model.items[_l].image.style.height = _widget.maxWidth + 'px';
          _widget.model.items[_l].image.style.width = _widget.maxWidth * _widget.model.items[_l].aspectRatio + 'px';
          _widget.model.items[_l].image.border = '0px';          
          _widget.model.items[_l].image.style.zIndex =  _l;
          _widget.model.items[_l].image.style.cursor = "pointer";
          _widget.model.items[_l].reflection = getReflection(_widget.model.items[_l].image);
          _widget.model.items[_l].reflection.style.position = "absolute";
          _widget.model.items[_l].reflection.border = '0px'; 
          _widget.model.items[_l].image.onclick = function(e) {
          if (!e) _t = window.event.srcElement;
          else _t = e.target;
          if (!_t.selected){
                  loadLink(Number(_t.id));
              }
          }
          // calculate initial radius for each item based on # of images
         _widget.model.items[_l].degree = _l * (360 / _widget.model.items.length);
         _widget.model.items[_l].link.appendChild(_widget.model.items[_l].image);
         _widget.model.items[_l].link.appendChild(_widget.model.items[_l].reflection);
         _widget.contentPane.appendChild(_widget.model.items[_l].link);
      }
      gap = (360 / _widget.model.items.length);
      _widget.resize();
      for (var _ll=0; _ll < _widget.model.items.length; _ll++) {
          _widget.model.items[_ll].image.style.visibility = 'visible'; 
      }
    }
    
    function init(){
        
        _widget.arrowRight = document.createElement("div");
        _widget.arrowRight.className = "jmk-revolver-arrow-right";
        _widget.arrowRight.title = "Next";
      
        _widget.arrowRight.onclick = function() {
            _widget.getNext(); 
        }

        _widget.container.appendChild(_widget.arrowRight);	
        _widget.arrowLeft = document.createElement("div");
        _widget.arrowLeft.className = "jmk-revolver-arrow-left";
        _widget.arrowLeft.title = "Previous";
        _widget.arrowLeft.onclick = function() {
            _widget.getPrevious();
        }
        _widget.container.appendChild(_widget.arrowLeft);

        if (aspect == "verticle") _r = .28;
        else _r = .45;
        _widget.maxWidth = _r * _widget.dimensions.w;

        initImages();
    // _widget.getNext();
    }
  
    function scaleImage(_index, percentage) {
        if (_widget.model.items[_index] &&
            _widget.model.items[_index].image) {
            _widget.model.items[_index].image.style.width =  Math.floor(_widget.maxWidth  * percentage) + "px";
            _widget.model.items[_index].image.style.height = Math.floor(_widget.maxWidth * _widget.model.items[_index].aspectRatio * percentage) + "px";
            // for reflection
            var _w = _widget.model.items[_index].image.width;
            _widget.model.items[_index].reflection.style.width =  _w + "px";
            _widget.model.items[_index].reflection.style.height =  Math.round(_widget.model.items[_index].image.height / 3) + "px";
        }
    }
  
  /**
   * Calcuate the size of the image which can also be used to determine z-order.
   * Bigger images mean it should be closer to the top of the stack.
   */
    function processImage(_index, deg) {
        // if between 0 / 180 we should be shrinking
        var size = 1;      
        if (deg >= 0 && deg < 180) {
            size = (180 - deg)/180;

        // if between 180 / 359 we should be growing
        } else if (deg >= 180 && deg <= 360) {
            size = (deg-180)/180;
        }
        scaleImage(_index, size);
        if (_widget.model.items[_index] &&
            _widget.model.items[_index].image) {
            _widget.model.items[_index].image.style.zIndex = Math.round(size * 100);
            _widget.model.items[_index].reflection.style.zIndex = Math.round(size * 100) -1;
        }
    }
  
    this.getNext = function() {

        _widget.titleDiv.innerHTML = "";
        if (!processing) {
            processing = true;     
            _widget.doAnimation(true);
        }
    };
  
    this.getPrevious = function() {
        _widget.titleDiv.innerHTML = "";
        if (!processing) {
            processing = true;      
            _widget.doAnimation(false);
        }
    };
  
    this.select = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        if (targetId){
            if (!processing) {
                processing = true;              
                _widget.doAnimation(true, targetId);
            }  
        }
    };
  
    function reposition() {
        var dim = jmaki.getDimensions(_widget.container);
        if (aspect == "verticle") _r = .28;
        else _r = .45;
        _widget.maxWidth = _r * dim.w;
        for (var _l = 0; _l < _widget.model.items.length; _l++) {
            var _degree = 0;
            if (degree + _widget.model.items[_l].degree > 360) _degree = (360 - (degree + _widget.model.items[_l].degree)) * -1;
            else _degree =  degree + _widget.model.items[_l].degree;
            var pt = getElipticalPoint(_degree);        
            processImage(_l, _degree);
            if (_widget.model.items[_l] &&
                _widget.model.items[_l].image) {        
                _widget.model.items[_l].image.style.top = pt.y  + "px";
                _widget.model.items[_l].image.style.left = pt.x - (_widget.model.items[_l].image.width / 2) + "px";
                // for reflection
        
                var _top = pt.y + _widget.model.items[_l].image.height -4;
                _widget.model.items[_l].reflection.style.top = _top  + "px";
                _widget.model.items[_l].reflection.style.left =  _widget.model.items[_l].image.style.left;
            }        
       		
        }     
    }

  this.doAnimation = function(forward, _in) {
    if (!animate && !processing) return;
    // stop at a specic item
    var _mt = undefined;
    if (typeof _in != 'undefined') {
        _mt = _in;
    }
    var found = false;
    
    for (var _l = 0;_l < _widget.model.items.length; _l++) {
        var _degree = 0;
        if (degree + _widget.model.items[_l].degree > 360) _degree = (360 - (degree + _widget.model.items[_l].degree)) * -1;
        else _degree =  degree + _widget.model.items[_l].degree;
        if (forward && degree >= 360) {
            degree = 0;
      	} else if (!forward &&  degree < 0) {
            degree = 360;
      	}

        if ( _degree > 360 - range ||
            _degree < range) {              
            var onTarget = false;
            if (_mt && _mt == _widget.model.items[_l].id) onTarget = true;
            if (!_mt) onTarget = true;
            if (onTarget) {    
                                
                if (selected != _l){
                    _widget.model.items[_l].selected = true;
                    selected = _l;
                    found = true;
                    processing = false;
          	        break;   
          	    } else if (_mt) {
          	        _widget.model.items[_l].selected = true;
          	        found = true;
                    processing = false;
          	        break;   
          	    }
            }
        }
        var pt = getElipticalPoint(_degree);     	
        processImage(_l, _degree);
        _widget.model.items[_l].image.style.top = pt.y  + "px";
        var _t =  Math.floor(_widget.model.items[_l].image.height + pt.y - 5);
        _widget.model.items[_l].reflection.style.top = _t + "px";
        _widget.model.items[_l].image.style.left = pt.x - (_widget.model.items[_l].image.width / 2) + "px";
        _widget.model.items[_l].reflection.style.left = _widget.model.items[_l].image.style.left;          	
        _widget.model.items[_l].link.href = '#';
        _widget.model.items[_l].link.target = "_self";     		
      }
      if (found == true) {  
          reposition();
          // center the selected div
          _widget.model.items[selected].image.style.left = (_widget.dimensions.w / 2) - (_widget.model.items[selected].image.width / 2) + "px"; 
          _widget.model.items[selected].reflection.style.left = _widget.model.items[selected].image.style.left;
          
          _widget.model.items[selected].image.style.zIndex = 400;
          _widget.model.items[selected].reflection.style.zIndex = 399;
          var target = "";
          if (_widget.model.items[selected].target) target = " target='" + _widget.model.items[selected].target + "'";
    	  _widget.titleDiv.innerHTML = "<a href='" + _widget.model.items[selected].href + "' class='jmk-revolver-title-link jmakiFont'" + target + ">"+ _widget.model.items[selected].label + "</a>";
          _widget.model.items[selected].link.href = _widget.model.items[selected].href;
          if (_widget.model.items[selected].target)_widget.model.items[selected].link.target = _widget.model.items[selected].target;
          if (_widget.model.items.length == 1) selected = -1;
      } else {
        if (forward) degree = degree + increment;
        else degree = degree - increment;
        if (animate && processing){
           setTimeout(function(){_widget.doAnimation(forward, _mt)}, delay);
        }
      }      
   }
   
   function clearSelected() {
       for (var _l = 0; _l < _widget.model.items.length; _l++) {
           _widget.model.items[_l].selected = false;
       } 
   }

  function getElipticalPoint(_d) {
      var rad = _d * (Math.PI / 180);
      var _x = Math.round(_widget.centerX + _widget.xRadius * Math.sin(rad));
      var _y =  Math.round(_widget.centerY + _widget.yRadius * Math.cos(rad));
      return {x : _x, y : _y};
  }

  function testAnimation() {
      var ao = document.createElement("div");
      ao.style.position = "absolute";
      document.body.appendChild(ao);

      var start = new Date();
   
      function animate(x) {
          ao.style.left = x + "px";
      }
      
      for (var _i=0; _i < 100; _i++) {
          animate(_i);
      }
      var end = new Date();

      return (end - start);
   }

/**
 * reflection.js v1.7
 *
 * Contributors: Cow http://cow.neondragon.net
 *               Gfx http://www.jroller.com/page/gfx/
 *               Sitharus http://www.sitharus.com
 *               Andreas Linde http://www.andreaslinde.de
 *               Tralala, coder @ http://www.vbulletin.org
 *
 * Freely distributable under MIT-style license.
 */
 
  function getReflection(image, options) {	
      var defaultHeight = 0.5;
      var defaultOpacity =0.5;	
      doptions = { "height" : defaultHeight, "opacity" : defaultOpacity }
      if (options) {
          for (var i in doptions) {
              if (!options[i]) {
                  options[i] = doptions[i];
              }
          }
      } else {
          options = doptions;
      }
      
      try {
          var p = image;
          var reflectionHeight = Math.floor(p.height*options['height']);
          var divHeight = Math.floor(p.height*(1+options['height']));
          
          var reflectionWidth = p.width;
          
          if (document.all && !window.opera) {
              var reflection = document.createElement('img');
              reflection.src = p.src;
              reflection.style.width = reflectionWidth+'px';
              reflection.style.filter = 'flipv progid:DXImageTransform.Microsoft.Alpha(opacity='+(options['opacity']*100)+', style=1, finishOpacity=0, startx=0, starty=0, finishx=0, finishy='+(options['height']*100)+')';
              return reflection;
          } else {
              
              var canvas = document.createElement('canvas');
              if (canvas.getContext) {				
                  var context = canvas.getContext("2d");
                  
                  canvas.style.height = reflectionHeight+'px';
                  canvas.style.width = reflectionWidth+'px';
                  canvas.height = reflectionHeight;
                  canvas.width = reflectionWidth;
                  context.save();					
                  context.translate(0,image.height-1);
                  context.scale(1,-1);
                  
                  context.drawImage(image, 0, 0, reflectionWidth, image.height);
                  
                  context.restore();
                  
                  context.globalCompositeOperation = "destination-out";
                  var gradient = context.createLinearGradient(0, 0, 0, reflectionHeight);
                  
                  gradient.addColorStop(1, "rgba(255, 255, 255, 1.0)");
                  gradient.addColorStop(0, "rgba(255, 255, 255, "+(1-options['opacity'])+")");
                  
                  context.fillStyle = gradient;
                  if (navigator.appVersion.indexOf('WebKit') != -1) {
                      context.fill();
                  } else {
                      context.fillRect(0, 0, reflectionWidth, reflectionHeight*2);
                  }
                  return canvas;
              }
          }
          return d;
          
      } catch (e) {
      }
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

if (!jmaki.FlickrLoader) {
/**
*  Insert a script tag in the head of the document which will inter load the flicker photos
*  and call jsonFlickrFeed(obj) with the corresponding object.
*
*/
jmaki.FlickrLoader = function(apiKey) {
  
    this.load = function(tags, callback) {
        if (typeof _globalScope.flickrListeners == 'undefined') {
            _globalScope.flickrListeners = {};
        }
        var listeners = _globalScope.flickrListeners[tags];
        if (typeof listeners == 'undefined') {
            listeners = [];
        }
        listeners.push(callback);
        _globalScope.flickrListeners[tags] = listeners;      
        
        _globalScope.jsonFlickrFeed = function(args) {           
            var title = args.title;
            var tagsEnd = title.indexOf("tagged ");
            var tagNames = title.substring(tagsEnd + "tagged ".length, title.length);
            tagNames = tagNames.replace(/ and /, ',');
            var tListeners = _globalScope.flickrListeners[tagNames];                 
            if (tListeners != null) {
                for (var i = 0; i < tListeners.length; i++) {
                    tListeners[i](args,tagNames);           
                }
                // release the listeners for this tag
                delete _globalScope.flickrListeners[tagNames];
            }
        }
        var s = document.createElement("script");
        var url ="http://www.flickr.com/services/feeds/photos_public.gne?tags=" + tags + "&format=json";
        if (typeof apiKey != 'undefined') {
            url += "&appid=" + apiKey;
        }
        s.src = url;
        s.type = "text/javascript";
        s.charset = "utf-8";
        document.body.appendChild(s);      
    };
    };

}