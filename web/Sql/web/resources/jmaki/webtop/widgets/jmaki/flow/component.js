/**
 * jMaki Flow based on  ImageFlow 1.1
 * 
 *
 *	This code is based on Michael L. Perrys Cover flow in Javascript.
 *	For he wrote that "You can take this code and use it as your own" [1]
 *	this is my attempt to improve some things. Feel free to use it! If
 *	you have any questions on it leave me a message in my shoutbox [2].
 *
 *	The reflection is generated server-sided by a slightly hacked  
 *	version of Richard Daveys easyreflections [3] written in PHP.
 *	
 *	The mouse wheel support is an implementation of Adomas Paltanavicius
 *	JavaScript mouse wheel code [4].
 *
 *	Thanks to Stephan Droste ImageFlow is now compatible with Safari 1.x.
 *
 *
 *	[1] http://www.adventuresinsoftware.com/blog/?p=104#comment-1981
 *	[2] http://shoutbox.finnrudolph.de/
 *	[3] http://reflection.corephp.co.uk/v2.php
 *	[4] http://adomas.org/javascript-mouse-wheel/
 */
jmaki.namespace("jmaki.widgets.jmaki.flow");

jmaki.widgets.jmaki.flow.Widget = function(wargs) {
    
    var _widget = this;
    _widget.model = {};

    /* Configuration variables */
    var conf_reflection_p = 0.5;         // Sets the height of the reflection in % of the source image 
    var conf_focus = 4;                  // Sets the numbers of images on each side of the focussed one
    var conf_slider_width = 14;          // Sets the px width of the slider div
    var conf_images_cursor = 'pointer';  // Sets the cursor type for all images default is 'default'
    var conf_slider_cursor = 'default';  // Sets the slider cursor type: try "e-resize" default is 'default'

    /* Id names used in the HTML */
    _widget.container = document.getElementById(wargs.uuid);
    var img_div = document.getElementById(wargs.uuid +'_images');
    
    var conf_captions = wargs.uuid +'_captions';
    var conf_scrollbar = wargs.uuid +'_scrollbar';
    var conf_slider = wargs.uuid +'_slider';

    var scrollbar_div = document.getElementById(conf_scrollbar);
    var slider_div = document.getElementById(conf_slider);
    var caption_div = document.getElementById(conf_captions);
    

    /* Define global variables */
    var caption_id = 0;
    var new_caption_id = 0;
    var current = 0;
    var target = 0;
    var mem_target = 0;
    var timer = 0;
    var array_images = [];
    var new_slider_pos = 0;
    var dragging = false;
    var dragobject = null;
    var dragx = 0;
    var posx = 0;
    var new_posx = 0;
    var xstep = 150;
    var images_left;
    var scrollbar_width;
    var itemMappings = {};
    
    var publish = "/jmaki/flow";
    var subscribe = ["/jmaki/flow", "/imageviewer"];
    
    _widget.useScrollbar = true;
    var useMouseWheel = true;

    if (!jmaki.getExtension("jmami.wait")) {
        jmaki.loadExtension({ name : "jmaki.wait", extensionDir : wargs.widgetDir});
    }

    function step() {
            switch (target < current-1 || target > current+1) {
                    case true:
                            moveTo(current + (target-current)/3);
                            window.setTimeout(step, 50);
                            timer = 1;
                            break;

                    default:
                            timer = 0;
                            break;
            }
    }

    function glideTo(x, new_caption_id) {
        if (!_widget.model || !_widget.model.items) return;
        /* Animate gliding to new x position */
        target = x;
        mem_target = x;
        if (timer == 0) {
            window.setTimeout(step, 50);
            timer = 1;
        }
        
        /* Display new caption */
        caption_id = new_caption_id;
        if (_widget.model.items[caption_id]) caption = _widget.model.items[caption_id].label;
        if (caption == '') caption = '&nbsp;';
        caption_div.innerHTML = caption;
        
        /* Set scrollbar slider to new position */
        if (dragging == false) {
            new_slider_pos = (scrollbar_width * (-(x*100/((max-1)*xstep))) / 100) - new_posx;
            slider_div.style.marginLeft = (new_slider_pos - conf_slider_width) + 'px';
        }
    }
    
    this.select = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        if (itemMappings[targetId]){
            var index = itemMappings[targetId].index;
            var pos = index * -xstep;
            glideTo(pos, index);  
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
    
    this.previous = function() {
            handle(1);  
    };

    this.next = function() {
            handle(-1);  
    };

    function moveTo(x) {
        current = x;
        var zIndex = max;
        
        /* Main loop */
        for (var index = 0; index < max; index++) {
            var image = img_div.childNodes.item(array_images[index]);
            var current_image = index * -xstep;
            
            /* Don't display images that are not conf_focussed */
            if ((current_image+max_conf_focus) < mem_target || (current_image-max_conf_focus) > mem_target) {
                if (image){
                    image.style.visibility = 'hidden';
                    image.style.display = 'none';
                } 
                if (image && image.reflection) {
                    image.reflection.style.visibility = 'hidden';
                    image.reflection.style.visibility = 'hidden';
                    if (image.canvas)image.canvas.style.visibility = 'hidden';
                }
            } else {
                var z = Math.sqrt(10000 + x * x) + 100;
                var xs = x / z * size + size;
                
                /* Still hide images until they are processed, but set display style to block */
                if (image)  {
                    image.style.display = 'block';


                    /* Process new image height and image width */
                    var new_img_h = (image.h / image.w * image.pc) / z * size;
                    var new_img_w;
                    switch ( new_img_h > max_height ) {
                        case false:
                            new_img_w = image.pc / z * size;
                            break;

                        default:
                            new_img_h = max_height;
                            new_img_w = image.w * new_img_h / image.h;
                            break;
                    }

                  var new_img_top = (max_height - new_img_h) + images_top;//+ ((new_img_h / (conf_reflection_p + 1)) * conf_reflection_p);

                  /* Set new image properties */
                  image.style.left = xs - (image.pc / 2) / z * size + images_left + 'px';                     
                  if (new_img_h >0) image.style.height = new_img_h + 'px';
                  if (new_img_w >0) image.style.width = new_img_w + 'px';
                  if (new_img_top >0)image.style.top = new_img_top + 'px';
                  image.style.visibility = 'visible';

                  // reflection
                  if (image.reflection) {	
                      image.reflection.style.visibility = 'visible';
                      image.reflection.style.left = image.style.left;		
                      if (new_img_h >0)image.reflection.style.height = (new_img_h /3) + 'px';
                      image.reflection.style.width = image.style.width;
                      var _tp =  new_img_top + new_img_h;
                      if (_tp > 0) image.reflection.style.top = + _tp + 'px';
                      if (image.canvas) {
                          image.canvas.visibility = 'visible';
                          image.canvas.style.width = image.style.width;
                          if (new_img_h >0)image.canvas.style.height =  (new_img_h / 3)+ 'px';
                      }
                  }
                  if (image.canvas && image.canvas.style) {
                      image.canvas.style.visibility = 'visible';
                  }
                  /* Set image layer through zIndex */
                  switch ( x < 0 ) {
                      case true:
                          zIndex++;
                          break;

                      default:
                          zIndex = zIndex - 1;
                          break;
                  }

                  /* Change zIndex and onclick function of the focussed image */
                  switch ( image.i == caption_id ){
                      case false:
                          image.onclick = function() { glideTo(this.x_pos, this.i); }
                          break;

                      default:
                          zIndex = zIndex + 1;
                          image.onclick = function(e) { 
                              if (!e) _t = window.event.srcElement;
                              else _t = e.target;
                              jmaki.processActions({
                                  topic : _widget.publish,
                                  action : _t.action,
                                  targetId : _t.targetId,
                                  type : "onClick",
                                  value : _t.label                                    
                              });
                              if (_t.item.href) {
                                  document.location = _t.item.href; 
                              }
                          }
                          break;
                  }
                  image.style.zIndex = zIndex;
                }// if image
            }
            x += xstep;
        }
    }

    /* do all the UI work here */
    this.refresh = function(onload) {
        _widget.dimensions = jmaki.getDimensions(_widget.container);
        if (!_widget.dimensions.h) return;
        images_width = img_div.offsetWidth;   
        images_top = 0;
        images_left = 0;
        max_conf_focus = conf_focus * xstep;
        size = images_width * 0.5;
        scrollbar_width = images_width * 0.6;
        conf_slider_width = conf_slider_width * 0.5;    

        if (_widget.dimensions.h > 0) max_height = _widget.dimensions.h * 0.8;
        else max_height = 300;
        /* Change images div properties */
        img_div.style.height = max_height * 0.338 + 'px';
        
        /* Change captions div properties */
        caption_div.style.width = images_width + 'px';
        caption_div.style.marginTop = max_height * .55 + 'px';
        
        /* Change scrollbar div properties */
        scrollbar_div.style.top = max_height + 'px';
        scrollbar_div.style.marginLeft = images_width * 0.2 + 'px';
        scrollbar_div.style.width = scrollbar_width + 'px';
        
        /* Set slider attributes */
        slider_div.onmousedown = function () { dragstart(this); };
        slider_div.style.cursor = conf_slider_cursor;
        
        /* Cache EVERYTHING! */
        max = img_div.childNodes.length;
        var i = 0;
        for (var index = 0; index < max; index++) { 
            var image = img_div.childNodes.item(index);
            if (image.nodeType == 1) {
                array_images[i] = index;
                
                /* Set image onclick by adding i and x_pos as attributes! */
                image.onclick = function() { glideTo(this.x_pos, this.i); }
                image.x_pos = (-i * xstep);
                image.i = i;
                
                /* Add width and height as attributes ONLY once onload */
                if(onload == true){
                    image.w = image.width;
                    image.h = image.height;
                }
                
                /* create a relection */
                if (!image.reflection) {
                    var r = document.createElement("div");
                    _widget.container.appendChild(r);
                    image.canvas  = getReflection(image);
                    if (image.canvas) {
                        image.canvas.style.visibility = 'hidden';                           
                        r.appendChild(image.canvas);
                    }
                    image.reflection = r;
                    image.reflection.style.visibility = 'hidden';
                    image.reflection.style.position = "absolute";
                }
                /* Check source image format. Get image height minus reflection height! */
                switch ((image.w + 1) > (image.h / (conf_reflection_p + 1))) {
                    /* Landscape format */
                    case true:
                        image.pc = 118;
                        break;
                    
                    /* Portrait and square format */
                default:
                    image.pc = 100;
                    break;
                }
                /* Set ondblclick event */
                image.ondblclick = function() {
                    if (!e) _t = window.event.srcElement;
                    else _t = e.target;
                    jmaki.processActions({
                        topic : _widget.publish,
                        action : _t.action,
                        targetId : _t.targetId,
                        type : "onClick",
                        value : _t.label
                    }
                );
                if (_t.href) {
                    document.location = _t.href; 
                }
            }
                /* Set image cursor type */
                image.style.cursor = conf_images_cursor;
                i++;
            }
        }
        max = array_images.length;
    
        /* Display images in current order */
        moveTo(current);
        glideTo(current, caption_id);
    };

    /* Show/hide element functions */
    function show(id) {
        var element = document.getElementById(id);
        if (element.style) element.style.visibility = 'visible';
    }

    function hide(id) {
        var element = document.getElementById(id);
        element.style.visibility = 'hidden';
        element.style.display = 'none';
    }
    
    this.init = function() {
        var imgs = [];
        for (var i=0;_widget.model.items && i < _widget.model.items.length; i++) {          
            var img = document.createElement("img");
            imgs.push(img);
            img.style.position = "absolute";
            img.style.visibility = 'hidden';
            if (_widget.model.items[i].id) img.targetId = _widget.model.items[i].id;
            else img.targetId = wargs.uuid + "_" + i;
            img.index = i;
            img.src = _widget.model.items[i].imgSrc;
            img.label = _widget.model.items[i].label;
            img.action = _widget.model.items[i].action;
            img.item = _widget.model.items[i]; 
            itemMappings[img.targetId] = img;           
            img_div.appendChild(img);
        }
        loadImages(imgs, function() {
            if (_widget.useScrollbar == true) {
                show(conf_scrollbar);
            }             
            show(wargs.uuid +'_images');            
            _widget.refresh(true);
            jmaki.publish("/hideWait", {targetId : wargs.uuid});
        });
    };

    function clearImages() {
         for (var i in itemMappings) {
             if (itemMappings[i].canvas) {
                 if (itemMappings[i].canvas.parentNode){
                     itemMappings[i].canvas.parentNode.removeChild(itemMappings[i].canvas);
                 }
             }
             if (itemMappings[i].parentNode) {
                 itemMappings[i].parentNode.removeChild(itemMappings[i]);
             }
             delete itemMappings[i];
         }
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

    function processFlickr(obj) {
        _widget.model = {};
        _widget.model.items = [];
        clearImages();
        for (var l = 0;  l < obj.items.length; l++) {          
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
        _widget.init();
    }

    this.loadTags = function(tags) {      
       if (tags.value)tags = tags.value.label;
       jmaki.publish("/hideWait", {targetId : wargs.uuid});
       jmaki.publish("/showWait", {targetId : wargs.uuid, message : "Loading " + tags});        
        if (!_widget.flicrkLoader)_widget.flicrkLoader = new jmaki.FlickrLoader(_widget.flickrApiKey);
        _widget.flicrkLoader.load(tags.toLowerCase(), processFlickr);
    };
    
    function serviceLoad(){
        jmaki.doAjax({
            url : wargs.service,
            callback : function(req) {
                if (req.responseText) {
                    var obj = eval("(" + req.responseText + ")");                 
                    _widget.model.items = obj.items;
                    _widget.init();                    
                }

            }
        });
    }    

    /* Hide loading bar, show content and initialize mouse event listening after loading */
    this.postLoad = function() {
        var tags;
        if (wargs.args) {
            if (typeof wargs.args.useScrollbar == "boolean") {
                _widget.useScrollbar = wargs.args.useScrollbar;  
            }
            if (wargs.args.useMouseWheel == "boolean") {
                useMouseWheel = wargs.args.useMouseWheel;
            }
            if (wargs.args.tags) {
                tags = wargs.args.tags;
            }
            if (typeof wargs.args.flickrApiKey) {
                _widget.flickrApiKey = wargs.args.flickrApiKey;
            }
        }      
        if (wargs.value) {
            _widget.model = wargs.value;
            _widget.init();
        } else if (wargs.service) {
            serviceLoad();
        } else if (tags) {     
           _widget.loadTags(tags);
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

        if (useMouseWheel)initMouseWheel();

        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {          
            doSubscribe(subscribe[_i]  + "/select", _widget.select);
            doSubscribe(subscribe[_i]  + "/loadTags", _widget.loadTags);
            doSubscribe(subscribe[_i]  + "/selectNext", _widget.next);
            doSubscribe(subscribe[_i]  + "/selectPrevious", _widget.previous);
        }
        if (window.addEventListener) {
             window.addEventListener('resize', _widget.refresh, true);
            if (_widget.useScrollbar) {
                 _widget.container.addEventListener('mousemove', drag, true);
                 window.addEventListener('mouseup', dragStop, true);
            }
             _widget.keyListener = function(e) {
                 switch (e.keyCode) {	
                     case 37: _widget.previous();
                     break;
                     case 39: _widget.next(); 
                     break;
                 }    		
             };    
             // add key navigation listener
             _widget.container.addEventListener("keydown", _widget.keyListener, true);

        } else if (window.attachEvent) {
             window.attachEvent('onresize', _widget.refresh);
             if (_widget.useScrollbar) {
                 _widget.container.attachEvent('onmousemove', drag);
                 document.attachEvent('onmouseup', dragStop);             
             }
             // add key navigation listener
             _widget.container.keyListener =  function() {
                 switch (window.event.keyCode) {			
                     case 37: _widget.previous();
                     break;
                     case 39: _widget.next(); 
                     break;
                 }    
             };
             _widget.container.attachEvent("onkeydown",  _widget.container.keyListener);  
        }

    };
    
    this.resize = this.refresh;



  /* Handle the wheel angle change (delta) of the mouse wheel */
  function handle(delta) {
          var change = false;
          switch (delta > 0){
                  case true:
                          if(caption_id >= 1) {
                                  target = target + xstep;
                                  new_caption_id = caption_id - 1;
                                  change = true;
                          }
                          break;
                  default:
                          if(caption_id < (max-1)){
                                  target = target - xstep;
                                  new_caption_id = caption_id + 1;
                                  change = true;
                          }
                          break;
          }

          /* Glide to next (mouse wheel down) / previous (mouse wheel up) image */
          if (change == true) {
                  glideTo(target, new_caption_id);
          }
  }

  /* Event handler for mouse wheel event */
  function wheel(event) {
          var delta = 0;
          if (!event) event = window.event;
          if (event.wheelDelta){
                  delta = event.wheelDelta / 120;
          }
          else if (event.detail){
                  delta = -event.detail / 3;
          }
          if (delta) handle(delta);
          if (event.preventDefault) event.preventDefault();
          event.returnValue = false;
  }

  /* Initialize mouse wheel event listener */
  function initMouseWheel() {
          if(window.addEventListener) _widget.container.addEventListener('DOMMouseScroll', wheel, false);
          _widget.container.onmousewheel = wheel;
  }

  /* This function is called to drag an object (= slider div) */
  function dragstart(element) {
          dragobject = element;
          dragx = posx - dragobject.offsetLeft + new_slider_pos;
  }

  /* This function is called to stop dragging an object */
  function dragStop() {
          dragobject = null;
          dragging = false;
  }

  /* This function is called on mouse movement and moves an object (= slider div) on user action */
  function drag(e) {
      posx = document.all ? window.event.clientX : e.pageX;
      if(dragobject != null){
          dragging = true;
          new_posx = (posx - dragx) + conf_slider_width;
          
          /* Make sure, that the slider is moved in proper relation to previous movements by the glideTo function */
          if(new_posx < ( - new_slider_pos)) new_posx = - new_slider_pos;
          if(new_posx > (scrollbar_width - new_slider_pos)) new_posx = scrollbar_width - new_slider_pos;
          
          var slider_pos = (new_posx + new_slider_pos);
          var step_width = slider_pos / ((scrollbar_width) / (max-1));
          var image_number = Math.round(step_width);
          var new_target = (image_number) * -xstep;
          var new_caption_id = image_number;
          
          dragobject.style.left = new_posx + "px";
          glideTo(new_target, new_caption_id);
      }
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