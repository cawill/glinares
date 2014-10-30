/* Copyright 2008 You may not modify, use, reproduce, or distribute this software except in compliance with the terms of the License at:
 http://developer.sun.com/berkeley_license.html
 $Id: component.js,v 1.0 2007/04/15 19:39:59 gmurray71 Exp $
*/
jmaki.namespace("jmaki.widgets.jmaki.webtop");

jmaki.widgets.jmaki.webtop.Widget = function(wargs) {

    var _widget = this;
    var publish = "/jmaki/webtop";
    var subscribe =  ["/jmaki/webtop"];
    
    _widget.widgetRoot = jmaki.resourcesRoot;
    
    var counter = 0;
    _widget.columns = [];
    var columnWidth;
    var columnCount = 3;
    this.columnSizes = [];
    // for debuging
    var columnColors = ["#fde4ed", "#fdfde6", "#f1fdf1"];
    
    var nextColumn = 0;
    
    _widget.targetColumn = -1;
    // use google gears by default
    _widget.useGears = true;
  
    // used to simulate what a drop node looks like
    _widget.dropNode = null;
    var dropid = wargs.uuid + "_dropNode";
    // whether the webtop uses static size measurements
    // using static sizes can be messy when shared across browsers
    _widget.staticSize = false;
    // put widget in debug mode;
    _widget.debug = false;
    
    _widget.columnPadding = 5;
    var initialized = false;
    
    _widget.autosave = true;
    
    function genId() {
        return wargs.uuid + "_wt_" + counter++;
    }
    
    this.init = function() {
    	if (initialized) return;
        _widget.columnWidth = _widget.getColumnWidth(0) - 2;
        _widget.container = document.getElementById(wargs.uuid);
        _widget.dim = jmaki.getDimensions(_widget.container); 


        var _tNode = _widget.container.parentNode;
        while(_tNode != null &&
            (_tNode.clientHeight == 0 ||
                typeof _tNode.clientWidth == 'undefined')) {
            _tNode = _tNode.parentNode;
        }
        if (_tNode == null) {
            _widget.width = 500;
            _widget.height = 300
        } else {
            _widget.width = _tNode.clientWidth;
            _widget.height = _tNode.clientHeight;
        }
        _widget.frames = {};
        _widget.lightboxes = {};
        _widget.pos = jmaki.getPosition(_widget.container);
        
        for (var _i =0; _i < columnCount; _i++) {
            _widget.columns.push(document.getElementById(wargs.uuid + "_column_" + _i));
        }
        _widget.resetColumns();
        initPallette();
        _widget.loadSettings();
        jmaki.publish(publish + "/loadComplete", {});
        initialized = true;
    };
    
    this.showPallette = function() {
        if (_widget.pallette)_widget.pallette.show();
        _widget.palletteVisible  = true;
        _widget.saveSettings();    
    };
    
    this.hidePallette = function() {
        _widget.pallette.hide();
        _widget.palletteVisible = false;
        _widget.saveSettings(); 
    };
    
    this.refreshPallette = function() {
        if (wargs.value) {      	
            _widget.model = wargs.value;
            if (_widget.pallette)_widget.pallette.setItems( _widget.model.items);
            _widget.init();
        } else if (wargs.service) {
            jmaki.doAjax({url: wargs.service, callback: function(req) {
                var _in = eval('(' + req.responseText + ')');         
                _widget.model = _in;
                if (_widget.pallette)_widget.pallette.setItems(_widget.model.items);
                _widget.init();
            }});
        }    	
    };
    
    function initPallette() {
        var _args = {uuid : wargs.uuid + "_pallette"};
        _args.parentNode = document.getElementById("leftSidebar");
        _args.value = _widget.model.items;
        _args.value = _widget.model.items;
        _args.args = {webtopId : wargs.uuid };
        _args.widgetDir = wargs.widgetDir;
        _widget.pallette = new jmaki.widgets.jmaki.webtop.Pallette(_args);
    }
    
    this.showSettings = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        else targetId = o;      
        var _f = _widget.frames[targetId];
        if (_f) {
            if (!_widget.settingsDialog)buildSettingsDialog();
            populateSettingsDialog(_f);
        }
    };

    function populateSettingsDialog(f) {        
        var _dialog = _widget.settingsDialog;
        _dialog.currentFrame = f;
        _dialog.lightbox.titleNode.innerHTML = f.label + " Settings";
        _widget.lbm.showLightbox("settings");
        _dialog.cardLayout.selectView('settings'); 
        _dialog.serviceField.value = "";
        _dialog.valueField.value = "";
        _dialog.heightField.value = f.startHeight;
        if (typeof f.center == 'boolean' && f.center == true) _dialog.centerCheckbox.checked = true;
        var args;
        var service;
        var defaultValue;
        if (f.wjson) args = jmaki.clone(f.wjson.args);

        // mix in existing settings
        if (f.settings) {
            if (f.settings.value) {
                defaultValue = jmaki.inspect(f.settings.value, -1);
            }
            if (f.settings.service) {
                service = f.settings.service;
            }
        }
        if (f.widget) { 
           if (!service && f.widget.service) {
               service = f.widget.service;
           }
           if (f.wimpl && typeof f.wimpl.getValue == "function") {
               defaultValue = jmaki.inspect(f.wimpl.getValue(), -1);
           } else if (!defaultValue && f.widget.value) {
               defaultValue = jmaki.inspect(f.startValue, -1);
           }
           // else if (!defaultValue && f.wjson && f.wjson.value &&
           //    f.wjson.value.defaultValue) {
           //    defaultValue = jmaki.inspect(f.wjson.value.defaultValue, -1);  
          // }
        }

        // TODO : use a better eval here
        // check the frame widget for a value or use the one from the widget.json.
        if (defaultValue) {
            _dialog.valueField.value = defaultValue;
        }
        if (service) {
            _dialog.serviceField.value = service;
        }
        _dialog.table.clear();
        for (var i=0; args && i < args.length; i++) {          
            var _tls = _dialog.table;        
            var _r1 = _tls.createRow();

            // the first property that is an object is the arg name
            if (typeof args[i] == "object") {
                var _name;
                for (var _o in args[i]) {
                     if (typeof args[i][_o] == "object") {
                         _name = _o;
                     }
                }
                var _val = "";
                if (args[i][_name]) _val = args[i][_name];
                // pick up the override from widget
                if (f.widget.args[_name]) {
                	_val.value = f.widget.args[_name];
                } else if (f.settings && f.settings.args[_name]) {
                    _val.value = f.settings.args[_name];
                } 
                var nCell = document.createElement("td");
                nCell.innerHTML = _name;
                _tls.addCell(_r1, _name);            
                var _description = "";
                if (_val.description) {
                    _description = _val.description;
                }
                _tls.addCell(_r1, _description);                
                _tls.addCell(_r1, _val);
            }
        }
    }
    
    this.showBorder = function() {
        _widget.container.style.border = "1px solid darkGray";
    };
    
    this.hideBorder = function() {
        _widget.container.style.border = "1px solid #FFF";
    };
    
    this.table = function() {
        var _table = this;
        _table.node = document.createElement("table");
        
        this.clear = function(){
            var _rc = _table.getRowCount();
            for (var _ri=_rc-1; _ri >= 0; _ri--) {
                if (jmaki.MSIE) {
                     _table.node.deleteRow(_ri);
                } else {
                    _table.node.removeChild(_table.node.childNodes[_ri]);
                }
            }
        };
        
        this.getRow= function(_i) {
            if (jmaki.MSIE) {
                return _table.node.rows[_i];
            } else {
                return _table.node.childNodes[_i];
            }
        };
        
        this.getCell = function(_ri, _i) {
            var _row = _table.getRow(_ri);
            if (jmaki.MSIE) {
                return _row.cells[_i];
            } else {
                return _row.childNodes[_i];
            }
        };
        
        this.getCellCount = function() {
            if (jmaki.MSIE) {
                if (!_table.node.rows[0]) return 0;
                return _table.node.rows[0].cells.length;
            } else {
                if (!_table.node.childNodes[0]) return 0;
                return _table.node.childNodes[0].childNodes.length;
            }
        };        
        
        this.getRowCount = function() {
            if (jmaki.MSIE) {
                return _table.node.rows.length;
            } else {
                return _table.node.childNodes.length;
            }
        };
        
        this.getData = function() {
            var _rc = _table.getRowCount();
            var _cc = _table.getCellCount();
            var _data = {};
            for (var _ri=0; _ri < _rc; _ri++) {
                var _val = null;
                var _cell = _table.getCell(_ri, 2);              
                if (_cell.renderType == "select") {
                    _val = _cell.renderNode.value;
                } else if (_cell.renderType == "number-select") {
                    _val = Number(_cell.renderNode.value);                    
                } else if (_cell.renderType == "checkbox") {            
                    if (_cell.renderNode.checked == true) _val = true;
                    else _val = false;
                } else if (_cell.renderType == "inlinetext") {
                    if (_cell.contentType == "number") _val = Number(_cell.renderNode.value);
                    else _val = _cell.renderNode.value;
                } else {
                    _val = _cell.renderNode.value;
                }
                if (_val != null) _data[_table.getCell(_ri, 0).innerHTML] = _val;       
            }          
            return _data;
        };
        
        this.createRow = function() {
            var _row;
            if (jmaki.MSIE) {
                _row = _table.node.insertRow(-1);
            } else {
                _row = document.createElement("tr");
                _table.node.appendChild(_row);
            }
            return _row;
        };
        
        this.addCell = function(_row, _val) {
            var _cell;
            if (jmaki.MSIE) {
              _cell = _row.insertCell(-1);
            } else {
                _cell = document.createElement("td");
                _row.appendChild(_cell);
            }
            // if string insert otherwise assume a node
            if (typeof _val == "string") {
                _cell.innerHTML = _val;
            } else if (typeof _val != "undefined") {
                 if (_val.type.toUpperCase() == "BOOLEAN") {       
                      _cell.renderType = "checkbox";
                      _cell.renderNode = document.createElement("input");
                      _cell.renderNode.type = "checkbox";                  
                      var checked = _val.defaultValue;
                      if (_val.value) checked = _val.value;                                 
                      _cell.appendChild(_cell.renderNode);
                      _cell.renderNode.checked = (checked) ? true : undefined;             
                } else if (_val.type.toUpperCase() == "STRING") {
                    if (typeof _val.values != "undefined") {
                      _cell.renderType = "select";
                      _cell.renderNode = document.createElement("select");
                      _cell.renderNode.style.width = "100%";
                      for (var _r=0; _r < _val.values.length; _r++) {
                          var _opt = document.createElement("option");
                          _opt.innerHTML = _val.values[_r].name;
                          _opt.value = _val.values[_r].value;
                          if (_opt.value == _val.value) {
                              _opt.selected = true;
                          } else if (! _val.value &&
                                     _opt.value == _val.defaultValue) {
                              _opt.selected = true;
                          }
                          _cell.renderNode.appendChild(_opt);
                      }
                      _cell.appendChild(_cell.renderNode);
                    } else {
                        _cell.renderType = "inlinetext";
                        _cell.renderNode = document.createElement("input");
                        _cell.renderNode.type = "text";
                        _cell.renderNode.style.width = "95%";
                        if (_val.value )_cell.renderNode.value =_val.value  + "";
                        else if (_val.defaultValue )_cell.renderNode.value =_val.defaultValue  + "";
                        _cell.appendChild(_cell.renderNode);
                    }
                } else if (_val.type.toUpperCase() == "NUMBER") {
                    if (typeof _val.values != "undefined") {
                      _cell.renderType = "number-select";
                      _cell.renderNode = document.createElement("select");
                      _cell.renderNode.style.width = "100%";
                      for (var i=0; i < _val.values.length; i++) {
                          var _opt2 = document.createElement("option");
                          _opt2.innerHTML = _val.values[i].name;
                          _opt2.value = _val.values[i].value;
                          if (_opt2.value == _val.value) {
                              _opt2.selected = true;
                          } else if (!_val.value &&
                                     _opt2.value == _val.defaultValue) {
                              _opt2.selected = true;
                          }
                          _cell.renderNode.appendChild(_opt);
                      }
                      _cell.appendChild(_cell.renderNode);
                    } else {
                        _cell.contentType = "number";
                        _cell.renderType = "inlinetext";
                        _cell.renderNode = document.createElement("input");
                        _cell.renderNode.type = "text";
                        _cell.renderNode.style.width = "95%";
                        if (_val.value )_cell.renderNode.value =_val.value  + "";
                        else if (_val.defaultValue )_cell.renderNode.value =_val.defaultValue  + "";
                        _cell.appendChild(_cell.renderNode);
                    }
                }
            }
            return _cell;
        };
    };
    
    this.loadSettings = function() {       
        if (!_widget.gears && _widget.useGears ) {
            jmaki.loadExtension({ name : "google.gears", extensionDir : wargs.widgetDir});
            _widget.gears = true;          
        }        
        jmaki.publish("/google/gears/execute", 
            { query : 'select * from webtop order by Timestamp desc',
             callback : function(_rs) {
                 if (typeof _rs != "undefined" &&
                     typeof _rs.isValidRow != "undefined" &&
                     _rs.isValidRow()) {
                     // set data on the global window object for later access
                     var _data;
                     if (typeof _rs.field != "undefined") _data= _rs.field(0);
                     var widgets = eval("(" + _data + ")");                
                     if (widgets) {                        
                           if (typeof widgets.palletteVisible == "boolean") {                    
                             if (widgets.palletteVisible) {                                 
                                 _widget.pallette.show();
                                 _widget.palletteVisible = true;
                             } else {
                                 _widget.pallette.hide();
                                 _widget.palletteVisible = false;
                             }
                         }                      
                         _widget.initColumns(widgets.columns);                     
                         _widget.initFrames(widgets.frames);                     
                     }
                 } else {
                     jmaki.log("No data available");
                 }
         }
        });          
    };
        
    this.getValue = function() {
        var frames = _widget.getFrames();
        var _data = {};
        _data.frames = [];
        for (var j=0; j < frames.length; j++) {
           var _tf = frames[j];
           var _f = { label : _tf.label, id : _tf.id, startHeight : _tf.startHeight, column : _tf.column};
           if (_tf.widget) _f.widget = _tf.widget;
           if (typeof _tf.center == 'boolean') _f.center = _tf.center;
           if (_tf.wimpl && typeof _tf.wimpl.getValue == "function") {
               _f.widget.value = jmaki.clone(_tf.wimpl.getValue());
               if (_tf.settings) _tf.settings.value = _f.value;
           } else if (_tf.settings) {
               if (_tf.settings.value && _tf.widget)_f.widget.value = _tf.settings.value;      
           }          
           if (_tf.settings) {
               _f.settings = _tf.settings;
               if (_tf.settings.args && _tf.widget)_f.widget.args = _tf.settings.args;
               if (_tf.settings.service && _tf.widget) _f.widget.service = _tf.settings.service;
           }

           if (_tf.include) _f.include = _tf.include;
           if (typeof _tf.iframe == "boolean") _f.iframe = _tf.iframe;
           _data.frames.push(_f);          
        }
        _data.columns = [];
        _data.palletteVisible = _widget.palletteVisible;
        var _dim = jmaki.getDimensions(_widget.container);
        // get size including padding
        for (var i=0; i < columnCount; i++) {
            var _cw = _widget.getColumnWidth(i);
            if (!_widget.staticSize) {       
                _cw = Math.floor(((_cw - 2) / (_dim.w -2)) * 100) + "%";
            }
            _data.columns.push({ index : i, width : _cw});
        }       
        return _data;
    };
    
    /*
     *  Remove all frames
     */
    this.clear = function() {

        for (var i in _widget.frames) {
            if (_widget.frames[i].uuid) {
                _widget.removeFrame(_widget.frames[i].uuid);
            }
        }
    };
    
    this.saveSettings = function() { 
        if (_widget.useGears) {
            if (!_widget.gears) {
                jmaki.loadExtension({ name : "google.gears", extensionDir : wargs.widgetDir});
               _widget.gears = true;
            }                
            var _data = _widget.getValue();
            jmaki.publish("/google/gears/execute",
                { query : 'delete from webtop',
                 callback : function() {
                   jmaki.log("Removing Previous Values");
                   var _d = jmaki.inspect(_data, -1);
                   jmaki.publish("/google/gears/execute",
                      { query : 'insert into webtop values (?, ?)',
                         args : [_d, new Date()],
                     callback : function() {
                         jmaki.log("Saved " + _d);
                     }
                    });
                   }
                });            
        }
        jmaki.publish(publish + "/save", { widgetId : wargs.uuid});

    };    
    
    function buildSettingsDialog() {
        _widget.settingsDialog = {};
        var _dialog = _widget.settingsDialog;
        _dialog.node = document.createElement("div");
        var _tabs = document.createElement("div");
         _dialog.tabMenu = new jmaki.widgets.jmaki.webtop.TabMenu({container : _tabs});
        _dialog.node.appendChild(_tabs);    
        var _cardNode = document.createElement("div");
        _cardNode.style.height = "315px";    
        _dialog.cardLayout = new jmaki.widgets.jmaki.webtop.CardLayout({ container : _cardNode});
        _dialog.node.appendChild(_cardNode);
        
        var buttonsPanel = document.createElement("div");
        buttonsPanel.style.height = "25px";
        buttonsPanel.style.marginLeft = "460px";
        
        var saveButton = document.createElement("button");
        saveButton.innerHTML = "Save";
        // save handler here - aggregate the settings
        saveButton.onclick = function(){
          var settings = {};
          settings.args = _dialog.table.getData();
          // do whaevever you need to do.
          if (_dialog.serviceField.value != '') settings.service = _dialog.serviceField.value;
          // TODO : need a better eval
          settings.defaultValue = undefined;
          if (_dialog.valueField.value != "") {
              try {
                  settings.value = eval("(" +_dialog.valueField.value + ")");                 
                  _dialog.defaultValue = jmaki.clone(settings.value);
              } catch (e) {
                  jmaki.log("Error with value data : " + e);
              }
          }
          _dialog.currentFrame.settings = settings;          

          // set the height
          var _h = Number(_dialog.heightField.value);
          _dialog.currentFrame.setHeight(_h);
          
          // reload the widget with new settings
          if (_dialog.currentFrame &&
              _dialog.currentFrame.widget) {
             var i = _dialog.currentFrame;
             jmaki.clearWidgets(i.contentNode);
             i.startHeight = _dialog.heightField.value;
             if (_dialog.centerCheckbox.checked == true) {
                 i.center = true;
             }
             i.contentNode.innerHTML = "";
             // reload widget
             var _wn = document.createElement("div");
             i.contentNode.appendChild(_wn);
             _wn.style.height = i.startHeight + "px";
             var _w = jmaki.clone(i.widget);
             _w.args = settings.args;
             _w.value = settings.value;
             _w.service = settings.service;
             var _callback;
            // use css to do cenerting

            _callback = function(_wimpl, _wargs){
                i.wimpl = _wimpl;
                if (i.center && i.center == true) {                  
                    var _dn = document.getElementById(_wargs.uuid);
                    var _tn = _dn.parentNode;
                    _tn.className += " jmk-wt-centered";                                  
                    if (_dn.style.width != "") {                                        
                        _tn.style.width = _dn.style.width;
                    } else if (_dn.clientWidth != 0) {                                    
                        _tn.style.width = _dn.clientWidth + "px";
                    }
                }
                _widget.saveSettings();  
            };
            
            jmaki.ext.widgetFactory.add(_w,
                                    _wn,
                                    _w.wjson,
                                    _callback
                                    );          
          }
          _dialog.lightbox.hide();
        
        };
        buttonsPanel.appendChild(saveButton);
        
        var cancelButton = document.createElement("button");
        cancelButton.innerHTML = "Cancel";
        cancelButton.onclick = function(){
          _dialog.lightbox.hide(); 
        };
        buttonsPanel.appendChild(cancelButton);
        _dialog.node.appendChild(buttonsPanel);
        // properties panel
        var pane1 = document.createElement("div");
       
        var spacer2 = document.createElement("div");
        spacer2.style.height = "10px";
        pane1.appendChild(spacer2);        
        var _tls = new _widget.table();
        _tls.node.className = "jmk-wt-settings-argslabel";
        var _r1 = _tls.createRow();
        _tls.addCell(_r1, "Name");
        _tls.addCell(_r1, "Description");
        _tls.addCell(_r1, "Value");    
        pane1.appendChild(_tls.node);
        var argsScroller = document.createElement("div");
        argsScroller.className = "jmk-wt-settings-argspane";
        _dialog.table = new _widget.table();
        argsScroller.appendChild(_dialog.table.node);
        pane1.appendChild(argsScroller);        
        
        var sp0 = document.createElement("div");
        sp0.style.height = "10px";
        pane1.appendChild(sp0); 
        
        var hp = document.createElement("div");    
        hp.className = "jmk-wt-settings-argspane-hsettings";
        var hl = document.createElement("div");
        hl.innerHTML = "Height:";
        hl.className = "jmk-wt-settings-argspane-hsettings-label";
        hp.appendChild(hl);
        var hv = document.createElement("div");
        _dialog.heightField = document.createElement("input");
        _dialog.heightField.type = "text";
        hv.appendChild(_dialog.heightField);
        hp.appendChild(hv);

        pane1.appendChild(hp);
        
        var cp = document.createElement("div");    
        cp.className = "jmk-wt-settings-argspane-csettings";
        var cl = document.createElement("div");
        cl.innerHTML = "Center Horizontal :";
        cl.className = "jmk-wt-settings-argspane-csettings-label";
        cp.appendChild(cl);    
        
        var cv = document.createElement("div");
        _dialog.centerCheckbox = document.createElement("input");
        _dialog.centerCheckbox.type = "checkbox";
        cv.appendChild(_dialog.centerCheckbox);
        cp.appendChild(cv);        
        
        pane1.appendChild(cp);

        // data panel
        var dataPanel = document.createElement("div");
        var spacer = document.createElement("div");
        spacer.style.height = "10px";
        spacer.style.clear = "both";
        dataPanel.appendChild(spacer);        
        var sp = document.createElement("div");    
        sp.className = "jmk-wt-settings-datapane-service";
        var sl = document.createElement("div");
        sl.innerHTML = "Service:";
        sl.className = "jmk-wt-settings-datapane-label";
        sp.appendChild(sl);
        var sv = document.createElement("div");
        _dialog.serviceField = document.createElement("input");
        _dialog.serviceField.type = "text";
        sv.appendChild(_dialog.serviceField);
        sp.appendChild(sv);
        dataPanel.appendChild(sp);
        var sp3 = document.createElement("div");
        sp3.style.height = "10px";
        sp3.style.clear = "both";
        dataPanel.appendChild(sp3);          
        // data panel
        var vp = document.createElement("div");    
        vp.className = "jmk-wt-settings-datapane-data";
        var vl = document.createElement("div");
        vl.className = "jmk-wt-settings-datapane-label";
        vl.innerHTML = "Value:";
        vp.appendChild(vl);
        var vv = document.createElement("div");
        _dialog.valueField = document.createElement("textarea");
        vv.appendChild(_dialog.valueField);
        vp.appendChild(vv);
        dataPanel.appendChild(vp);        
        // about panel
        var about = document.createElement("div");
        about.innerHTML = "About your widget.";          
        // configure 
        _dialog.cardLayout.addView({id : 'settings', container : pane1});
        _dialog.cardLayout.addView({id : 'data', container : dataPanel});
        _dialog.cardLayout.addView({id : 'about', container : about});
        _dialog.cardLayout.selectView('settings');

        _widget.settingsDialog.lightbox = _widget.lbm.addLightbox({ id : "settings",
            label : "Settings",
            startHeight : 400,
            startWidth : 600,
            contentNode : _dialog.node
        });
        _dialog.tabMenu.addItem({ label : 'Properties', selected : true,
            clickHandler : function () {
                _dialog.cardLayout.selectView('settings');              
            }  
        });
        _dialog.tabMenu.addItem({ label : 'Data',
            clickHandler : function () {
                _dialog.cardLayout.selectView('data');              
            }        
        });            
        _dialog.tabMenu.addItem({ label : 'About',
            clickHandler : function () {
                _dialog.cardLayout.selectView('about');              
            }        
        });    
    }
    
    this.minimizeFrame = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        else targetId = o;      
        var _f = _widget.frames[targetId];
        if (_f) {
            if (!_f.minimized){
                _f.contentNode.style.display = "none";
                _f.minimized = true;
            } else {
                _f.contentNode.style.display = "block";
                _f.minimized = false;
            }
        }
    };    
    
    this.removeFrame = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        else targetId = o;      
        var _f = _widget.frames[targetId];
        if (_f) {
             jmaki.clearWidgets(_f.node);
            _f.node.parentNode.removeChild(_f.node);
            if (typeof _f.destroy == "function")_f.destroy();
            delete _widget.frames[targetId];
        }
        _widget.saveSettings();
    };
    
    this.initColumns = function(_columns) {        
        var _t = 0; 
        var _it = 0;
        // if the total is over 100% reset the columns
        // this code can go away sometime
        var doReset = false;
        for (var k=0; _columns && k < _columns.length; k++) {      
            if (/%/.test(_columns[k].width)) {
                var _n =  Number(_columns[k].width.split('%')[0]);
                _it +=  _n;
                if (_n < 0) {
                    doReset = true;
                    break;
                }
            }  else if (/%/.test(_columns[k].width)) {
                _it +=  Number(_columns[k].width.split('px')[0]); 
            }
        }
        if (_it > 100) {
            doReset = true;
        }
        if (doReset) {
            _widget.resetColumns();
            return;  
        }      
        for (var i=0; _columns && i < _columns.length; i++) {              
            var _w;          
            if (/%/.test(_columns[i].width)) {
                if (i != _columns.length - 1) {
                    _w = _columns[i].width;              
                } else {
                    // fill in the rest
                   var _r = _widget.dim.w - _t - (_widget.columnPadding * (_columns.length ));
                   _w = Math.floor((_r / _widget.dim.w) * 100) + "%";
                }
                _widget.columns[i].style.width = _w;
            } else {
                _w = _columns[i].width;
                if (!/px/.test(_w)) _w += "px";              
            }
             _t += _widget.getColumnWidth(i) + _widget.columnPadding * 2;
             
            if (_widget.debug) {
                _widget.columns[_columns[i].index].style.background = columnColors[_columns[i].index];
            }
  
        }       
        columnCount = _widget.columns.length;
        repositionResizers();
    };
    
    function repositionResizers() {
        var tw = 10;
        if (jmaki.MSIE) tw += 5;
        // adjust for the sizers
        var _epos = jmaki.getPosition(_widget.container);
        for (var ii=0; _widget.sizers && ii < columnCount -1; ii++) {
            var _w = _widget.getColumnWidth(ii);
            _widget.sizers[ii].style.left = _epos.x + tw + _w + "px";
            // keep track of the total width and add 2 px for padding
            tw += _w + 10;
        }  
    }

    this.initFrames = function(frames) {
        for (var i=0; frames && i < frames.length; i++) {
           var _f = _widget.createFrame(frames[i]);              
           _f.dragController = new _widget.DragController(_f, _widget.findDropPoint, _widget.dragComplete);
           if (_widget.columns[_f.column])_widget.columns[_f.column].appendChild(_f.node);
           _f.resize();     
       }
    };
    
    this.addFrame = function(args) {
        var _f;        
        for (var i=0; i < _widget.model.items.length; i++) {
            if (args.id == _widget.model.items[i].id) {
                _f = _widget.createFrame(_widget.model.items[i]);
            }
        }
        if (_f) {
             _f.dragController = new _widget.DragController(_f, _widget.findDropPoint,
                                                    _widget.dragComplete);
             _f.column = nextColumn;                                                   
             _widget.columns[nextColumn++].appendChild(_f.node);

             //alternate the columns to drop in.
             if (nextColumn >= columnCount) nextColumn = 0;
             _widget.saveSettings(); 
        }
    };
    
    /*
     * The resize action
     */ 
    function doResize() {
        _widget.pos = jmaki.getPosition(_widget.container);
        _widget.dim = jmaki.getDimensions(_widget.container);        
        oldWidth = document.body.clientWidth;
        var _cols = [];
        for (var i=0;i < _widget.columns.length; i++) {
            _cols.push({index : i, width : _widget.columns[i].style.width});
        }
        _widget.initColumns(_cols);
        repositionResizers();
        var frames = _widget.getFrames();
        for (var j=0;j < frames.length;j++) {
            frames[j].resize();
        }
    }
    
    // used for resizing with IE
    var oldWidth = 0;
    var resizing = false;
    var lastSize = 0;
    
    /**
     * Fired when a size event happens
     */
    this.resize = function() {
        if (!jmaki.MSIE) {
            doResize();
            return;
        }
        // special handling for ie resizing.
        // we wait for no change for a full second before resizing.
        if (oldWidth != document.body.clientWidth && !resizing) {
            if (!resizing) {
                resizing = true;
                setTimeout(_widget.resize,1000);
            }
        } else if (resizing && document.body.clientWidth == lastSize) {
            resizing = false;
            doResize();
        } else if (resizing) {
            lastSize = document.body.clientWidth;
            setTimeout(_widget.resize,1000);
        }
    };
   
    this.getFrames = function(column) {
        var frames = [];     
        for (var i=0; i < columnCount; i++) {
            if (typeof column == 'undefined' ||
                typeof column != 'undefined' &&
                column == i) {
                var children;
                if (_widget.columns[i]) children = _widget.columns[i].childNodes;
                for (var c=0; children && c < children.length; c++) {
                    if (children[c].frameRef) frames.push(children[c].frameRef);
                }
            }
        }
        return frames;
    };

    this.enableResizableColumns = function() {
        var padding = 2;
        if (_widget.columnSizes.length == 0) {
            var dim = jmaki.getDimensions(_widget.container);
            var epos = jmaki.getPosition(_widget.container);
            _widget.sizers = [];
            var avw = dim.w / columnCount;
            for (var i=0; i < columnCount -1; i++) {
                var xw = ((i  + 1) * avw) - ((i + 1) * padding);                
                _widget.sizers[i] = document.createElement("div");
                _widget.sizers[i].cid = i ;
                _widget.sizers[i].className = "jmk-wt-resizer";
                _widget.sizers[i].style.height = 175 + "px";                
                _widget.sizers[i].style.top = epos.y - 5 + "px";
                if (jmaki.MSIE) xw += 3;
                _widget.sizers[i].style.left = epos.x + xw + "px";
                _widget.sizers[i].x = epos.x + xw;
                _widget.container.parentNode.appendChild(_widget.sizers[i]);
                _widget.sizers[i].controller = new _widget.ResizeController(_widget.sizers[i], _widget.columnResizeComplete, _widget);
            }
        }     
    };
    
    this.columnResizeComplete = function(sizer) {
        var index = sizer.cid;

        var offset = 0;
        for (var i=0; i < index; i++) {
            offset +=_widget.getColumnWidth(i);
        }

        var _to = _widget.getColumnWidth(index) + _widget.getColumnWidth(index + 1);
        var _w = sizer.x - _widget.pos.x - offset - ((index + 2) * _widget.columnPadding);
        var _nw =  _to - _w;

        var ncol = _widget.columns[(index + 1)];
        ncol.style.width = _nw + "px";
        
        var col = _widget.columns[index];
        col.style.width = _w + "px";      

        // resize everything in the respective columns
        var f1 = _widget.getFrames(index);
        var f2 = _widget.getFrames(index +1);        
        var frames = f1.concat(f2);    
        for (var j=0; j < frames.length; j++) {
            frames[j].resize();
        }
        repositionResizers();
        _widget.saveSettings();
    };
    
    this.updateColumnCount = function(c) {
        if (c.value) c = c.value;
        jmaki.log("new count is " + c);
    };
    
    this.resetColumns = function(c) {       
        jmaki.log("resetting columns");  
        var _t = 0; 
        for (var i=0; i < columnCount; i++) {
           if (i != columnCount -1) {
                _widget.columns[i].style.width = (97/columnCount) + "%";
               _t += _widget.getColumnWidth(i);
           } else {
               // calcualate the remainder
               var _r = _widget.dim.w - _t - (_widget.columnPadding * (columnCount + 1));
               var _p = (  _r / _widget.dim.w) * 97;
               _widget.columns[i].style.width = Math.floor(_p) + "%";
           }
        }
        var frames = _widget.getFrames();    
        for (var j=0; j < frames.length; j++) {
            frames[j].resize();
        }
    };
    
    this.getColumnWidth = function(index) {
        var col = document.getElementById(wargs.uuid + "_column_" + index);
        var _w = 0;
        if (col) _w = col.clientWidth;
        return _w;
    };
    
    this.getColumnHeight = function(index) {
        var target = _widget.columns[index];
        var _w = 0;
        if (target) _w = target.clientHeight;
        return _w;
    };
    
    this.calculateRemaining = function(index) {
        var pY = 0;
        var col = document.getElementById(wargs.uuid + "_column_" + index);
        var children = col.childNodes;
        // calculate the height of all the top level nodes
	    for (var i=0; i < children.length; i++) {            
             if (children[i].clientHeight) pY += children[i].clientHeight;
        }
        return _widget.getColumnHeight(index) - pY;
    };
    
    this.getDropNode = function(f) {
        if (_widget.dropNode == null) {
            _widget.dropNode = document.createElement("div");
            _widget.dropNode.style.border = "1px dashed #FF0000";
            _widget.dropNode.id = dropid;
        }
        _widget.dropNode.style.height = f.startHeight - 1 + "px";
        _widget.dropNode.style.display = "block";

        // swap the new one in the drop node
        if (f.column == -1) {
            var cNodes = _widget.columns[0].childNodes;
                if (cNodes && cNodes.length > 0) {
                    _widget.columns[0].insertBefore(_widget.dropNode, cNodes[0]);
                } else {
                    _widget.columns[0].appendChild(_widget.dropNode);
                }         
        } else if ( f.node.nextSibling) {                                  
            f.node.parentNode.insertBefore(_widget.dropNode,  f.node.nextSibling);
        } else if (f.node.parentNode) {                           
            f.node.parentNode.appendChild(_widget.dropNode);
        }
    };
    
    /*
     * This is where all the drag and drop logic is processed after the general
     * column has been calcualated by the findDropPoint function is called.
     *
     * This function will use the y coordinate of the mouse and simulate a div
     * with the size of the dragging frame.
     *
     */
    function simulateDropLocation(f, p, index) {
        var cNodes = _widget.columns[index].childNodes;
        // if the column is empty or mouse below the widget add
        if (cNodes.length == 0 ||
            (p.y  > (_widget.pos.y + _widget.getColumnHeight(index)))) {
            _widget.columns[index].appendChild(_widget.dropNode);
            // if above the widget insert in location 1
        } else if (p.y < _widget.pos.y){          
            _widget.columns[index].insertBefore(_widget.dropNode, cNodes[0]);
            // All elses fails add to the end           
        } else {        
            // find the frame we are over - if greather than 1/2 it's height go before
            var _h = _widget.pos.y;
            // acount for the last node beingthe drop node.
            var _count = cNodes.length;
            if (cNodes[_count -1].id == dropid) _count--;
            for (var i=0; i < _count; i++) {
                // get node height
                var _d = cNodes[i].clientHeight;
                if (_d ==0) _d = cNodes[i].startHeight;
                if (i == _count -1) {
                    if (p.y >= _h + (_d/2) ) {                     
                        // append it
                        if (cNodes[i].nextSibling) {                         
                            _widget.columns[index].insertBefore(_widget.dropNode, cNodes[i].nextSibling);
                        } else {                       
                            _widget.columns[index].appendChild(_widget.dropNode);
                        }                        
                    } else {
                        _widget.columns[index].insertBefore(_widget.dropNode, cNodes[i]);
                    }
                    return;
                } else if (p.y <= _h + _d ) {
                    // if top 1/2 add after
                    if (p.y >= (_h + (_d/2)) ) {
                        // append it
                        if (i+2 < _count) {                         
                            _widget.columns[index].insertBefore(_widget.dropNode, cNodes[i + 2]);
                        } else { 
                            _widget.columns[index].appendChild(_widget.dropNode);
                        }
                        return;
                    } else {                    
                        _widget.columns[index].insertBefore(_widget.dropNode, cNodes[i]);
                    }
                    return;
               } else {
                   _h += _d;  
               }
            }
        }
    }
    
    this.findDropPoint = function(f, p) {
        _widget.targetColumn = -1;
        var _t = _widget.pos.x;
       
        if (p.x < _t) {
             _widget.targetColumn = 0;         
       } else {   
            for (var i =0; i < _widget.columns.length; i++) {
                var _cw = _widget.getColumnWidth(i);
                if (p.x < _t + _cw) {
                    _widget.targetColumn = i;                    
                    break;
                } else {
                    _t += _cw;
                }
            }
        }
        if (_widget.targetColumn == -1 && p.x > _t) {           
             _widget.targetColumn = _widget.columns.length -1;
        }
        if (_widget.targetColumn  != -1) {
            simulateDropLocation(f,p,_widget.targetColumn);
        }
    };
    
    this.dragComplete = function(frame) {
        if (_widget.dropNode &&  _widget.dropNode.parentNode) {             
            if (_widget.targetColumn == -1) {
                var cNodes = _widget.columns[0].childNodes;
                frame.column = 0;                
               
                if (cNodes && cNodes.length > 0) {
                    _widget.columns[0].insertBefore(frame.node, cNodes[0]);
                } else {
                    _widget.columns[0].appendChild(frame.node);
                }
                
            } else {
                frame.column = _widget.targetColumn;             
                _widget.dropNode.parentNode.replaceChild(frame.node, _widget.dropNode);             
            } 
            _widget.dropNode.style.display = "none";
            _widget.saveSettings();
        }
        frame.resize();
    };
        
    this.createFrame = function(o) {
        // global identifier for this frame
        var i = jmaki.clone(o);
        
        i.uuid = genId();
        var _col = 0;
        if (i.column) _col = i.column;
        var _columnW = _widget.getColumnWidth(_col);
        
        var frame = document.createElement("div");
        frame.frameRef = i;
        frame.style.width = _columnW - 6 + "px";

        frame.className = "jmk-wt-frame";
        
        var titleC = document.createElement("div");
        titleC.className = "jmk-wt-frame-title-container";
        frame.appendChild(titleC);
        
        var title = document.createElement("div");
        title.className = "jmk-wt-frame-title";
        if (_columnW  > 53) title.style.width = _columnW - 53 + "px";
        else title.style.width = "0px";
        title.innerHTML = i.label;        
        titleC.appendChild(title);
        // create the icons
        var icons = document.createElement("div");
        icons.className = "jmk-wt-frame-icons";

        var settings = jmaki.ext.loadImage(wargs.widgetDir + "/images/gear.png");
        settings.frameId = i.uuid;
        settings.onclick = function(e) {
            var t;
            if (!e) _t = window.event.srcElement;
            else _t = e.target;
            if (_t.frameId){
                _widget.showSettings(_t.frameId);  
            }
        };
        settings.title = "Settings";
        icons.appendChild(settings);
        
        var minimize = jmaki.ext.loadImage(wargs.widgetDir + "/images/minimize.png");
        minimize.frameId = i.uuid;
        minimize.onclick = function(e) {
            var t;
            if (!e) _t = window.event.srcElement;
            else _t = e.target;
            if (_t.frameId){
                _widget.minimizeFrame(_t.frameId);  
            }
        };
        minimize.title = "Minimize";        
        icons.appendChild(minimize);

        var close = jmaki.ext.loadImage(wargs.widgetDir + "/images/close.png");
        close.frameId = i.uuid;
        close.onclick = function(e) {
            var _t;
            if (!e) _t = window.event.srcElement;
            else _t = e.target;
            if (_t.frameId){
                _widget.removeFrame(_t.frameId);  
            }
        };
        close.title = "Close";

        icons.appendChild(close);    
        titleC.appendChild(icons);
        
        
        i.contentNode  = document.createElement("div");
        i.contentNode.style.height = i.startHeight -22 + "px";
        
        if (!i.startWidth) i.startWidth = _columnW - 8;
        i.contentNode.style.width = i.startWidth + "px"; 
        frame.appendChild(i.contentNode);
        
        var _content = "";  

        if (i.widget) {
            if (i.widget.value) i.startValue = jmaki.clone(i.widget.value);
            jmaki.attributes.put("startValue", i.startValue);
            var _w = document.createElement("div");

            _w.style.visiblity = "hidden";
            i.contentNode.appendChild(_w);           
            _w.style.height = (i.startHeight  - 22) + "px";
            //_w.style.height = ((jmaki.MSIE) ? i.startHeight  - 20 : i.startHeight  - 22) + "px";
            i.contentWrapper = _w;
            _w.style.width = i.startWidth  + "px";
            var wname = i.widget.name.split('.').join('/');
            i.widget.widgetDir = jmaki.webRoot +
                _widget.widgetRoot +  "/" + 
                wname + "/";

            jmaki.doAjax({ url : i.widget.widgetDir + "widget.json",
                    asynchronous : false,
                    callback : function(req) {
                        // use a secure eval                      
                        i.wjson = eval("(" + req.responseText + ")");                 
                    }
            });

            var _callback = function(_wimpl, _wargs, _container){
            	//    _container.style.position = "relative";
                    i.wimpl = _wimpl;
                    if (i.center) {                        
                        var _dn = document.getElementById(_wargs.uuid);
                        if (_dn) {
                            var _tn = _dn.parentNode;
                            _tn.className += " jmk-wt-centered";                                  
                            if (_dn.style.width != "") {                                       
                                _tn.style.width = _dn.style.width;
                            } else if (_dn.clientWidth != 0) {
                                _tn.style.width = _dn.clientWidth + "px";
                            }
                        }
                  } 
            };
            var _wargs = jmaki.clone(i.widget);
            jmaki.ext.widgetFactory.add(_wargs,
                                    _w,
                                    i.wjson,
                                    _callback
                                    );
        }
       
        frame.startHeight = i.startHeight;
        i.setHeight = function(_h) {
            i.dcontainer.setSize({ h: _h});
        };
        var _dargs = {
             target:  i.contentNode,
             useIframe : i.iframe,
             overflow : "hidden",
             overflowY : "hidden",
             overflowX : "hidden",
             content : _content,
             startWidth : i.startWidth,
             startHeight : i.startHeight - 22,
             autoSizeW : true,
             autoSizeH : true
        };
        i.dcontainer = new jmaki.DContainer(_dargs);

        if (i.include)i.dcontainer.loadURL(i.include);
        i.node = frame;
        i.titleNode = title;
        _widget.frames[i.uuid] = i;
        // TODO : create a better object structure and use prototype
        i.resize = function(_size) {
            var c = this.column;
            if (c == -1) c = 0;
            var cw = _widget.getColumnWidth(c) - 6 ; 
            if (cw > 0) {
               this.node.style.width = ((jmaki.MSIE) ? cw + 2 : cw ) + "px";
               if (cw > 53) this.titleNode.style.width = cw - 53 + "px";
               else this.titleNode.style.width = "0px";
               if (this.contentWrapper) this.contentWrapper.style.width = cw + "px";          
               this.dcontainer.setSize({ w: cw});             
                if (this.wimpl && this.wimpl.resize) {                   
                    this.wimpl.resize();
                }
            } 
        };
        if (!i.iframe)i.resize();
        return i;
    };

    this.destroy = function() {
        for (var i in _widget.frames) {
           var _f = _widget.frames[i];
           // watch out for functions or other mods to JS types
           if (typeof _f == 'object' && _f.dragController) {
               f.dragController.destroy();
          }
        }        
        for (var j=0; _widget.subs && j < _widget.subs.length; j++) {
            jmaki.unsubscribe(_widget.subs[j]);
        }
    };  
    
    function doSubscribe(topic, handler) {
        var i = jmaki.subscribe(topic, handler);
        _widget.subs.push(i);
    }  
     
    this.postLoad = function() {        
        _widget.container = document.getElementById(wargs.uuid);
        if (wargs.args) {
            if (wargs.args.widgetRoot) {
                _widget.widgetRoot = wargs.args.widgetRoot;
            }
            if (typeof wargs.args.useGears == "boolean") {
                 _widget.useGears = wargs.args.useGears;
            }
            if (wargs.args.debug) {
                _widget.debug = wargs.args.debug;
            }
            if (typeof wargs.args.autosave == 'boolean') {
                _widget.autosave = wargs.args.autosave;
            }
        }

        //auto save when any sub-widget publishes to save.   
        if (wargs.value) {
            items = wargs.value.menu;
        }
        if (wargs.publish) {
            publish = wargs.publish;
        }

        if (wargs.subscribe){
            if (typeof wargs.subscribe == "string") {
                subscribe = [];
                subscribe.push(wargs.subscribe);
            } else {
                subscribe = wargs.subscribe;
            }
        }
        _widget.subs = [];
        _widget.lbm = new jmaki.ext.lightboxManager(wargs);
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i]  + "/addFrame", _widget.addFrame);
            doSubscribe(subscribe[_i]  + "/addLightbox", _widget.lbm.addLightbox);
            doSubscribe(subscribe[_i]  + "/hideLightbox", _widget.lbm.hideLightbox);
            doSubscribe(subscribe[_i]  + "/showLightbox", _widget.lbm.showLightbox);
            doSubscribe("*" + subscribe[_i]  + "/updateColumnCount", _widget.updateColumnCount);
            doSubscribe("*" + subscribe[_i]  + "/resetColumns", _widget.resetColumns);
            doSubscribe("*" + subscribe[_i]  + "/showPallette", _widget.showPallette);
            doSubscribe("*" + subscribe[_i]  + "/hidePallette", _widget.hidePallette);
            if (_widget.autosave) {              
                doSubscribe("*" + subscribe[_i]  + "/autosave", _widget.saveSettings);
            }           
        }

        _widget.refreshPallette();
        _widget.enableResizableColumns();
        // attach listeners for window resize events
        if (window.addEventListener) {
             window.addEventListener('resize', _widget.resize, true);
        } else if (window.attachEvent) {
             window.attachEvent('onresize', _widget.resize);   
        }
    };
    
    this.cancelAllDrags = function() {
        for (var i in _widget.frames) {
            var _f = _widget.frames[i];
            // watch out for functions or other mods to JS types
            if (typeof _f == 'object' && _f.node) {
                if (_f.dragController) _f.dragController.detach();
            }
            if (_f.node) _f.node.style.zIndex = 9996;
        }
        _widget.targetColumn = -1;
   };
   
   this.disableBlocker = function() {
       if (_widget.blocker)
       _widget.blocker.style.display = "none";
   };
   
   this.enableBlocker = function(opacity) {
       if (_widget.debug) opacity = 50;
       if (!_widget.blocker) {
           _widget.blocker = document.createElement("div");
           _widget.blocker.id = wargs.uuid + "_blocker";
           _widget.blocker.style.background = "#FF0000";
           _widget.blocker.style.opacity = opacity / 100;
           _widget.blocker.style.filter = "alpha(opacity='" + opacity + "')";
           _widget.blocker.style.position = "absolute";
           _widget.container.parentNode.appendChild(_widget.blocker);

       }
       var _dim = jmaki.getDimensions(_widget.container);
       _widget.blocker.style.width = _dim.w + "px";
       _widget.blocker.style.height = _dim.h + "px";        
       _widget.blocker.style.zIndex = 9996;
       var pos = jmaki.getPosition(_widget.container);
       _widget.blocker.style.left = pos.x + "px";
       _widget.blocker.style.top  = pos.y + "px"; 
       _widget.blocker.style.display = "block";
   };
   
   this.getMousePosition = function(e){
            var lx = 0;
            var ly = 0;
            if (!e) e = window.event;
            if (e.pageX || e.pageY) {
                lx = e.pageX;
                ly = e.pageY;
            } else if (e.clientX || e.clientY) {
                lx = e.clientX;
                ly = e.clientY;
            }
            return {x : lx, y : ly};
   };
   
   this.ResizeController = function(sizer, dragCompleteHandler, _webtop) {
        
        var _controller = this;        
        _controller.dragging = false;
        var dragTarget;
        var offset;

        function init() {
           dragTarget = sizer;
           dragTarget.style.cursor = "col-resize";
           dragTarget.onmousedown = _controller.mouseDown;
           dragTarget.onmouseup  = mouseUp;
           dragTarget.mouseup  = mouseUp;
           window.onmouseup  = mouseUp;
           if (window.addEventListener) {
               window.addEventListener("mousemove", mouseMove, false);
               window.addEventListener("mouseup", mouseUp, false);
           } else if (document.attachEvent){
               document.attachEvent("onmousemove", mouseMove);
               dragTarget.attachEvent("onmouseover", mouseOver);
               dragTarget.attachEvent("onmouseout", mouseOut);
           }
        }

        this.detach = function() {
           offset = null;
           _controller.dragging = false;
        };
        
        this.destroy = function() {
             if (window.removeEventListener) {
                 window.removeEventListener("mousemove", mouseMove, false);
                 window.removeEventListener("mouseUp", mouseUp, false);
             } else if (document.dettachEvent){
               document.dettachEvent("onmousemove", mouseMove);
               document.dettachEvent("onmouseup", mouseUp);
            }    
        };

        function mouseOut(e) {
            sizer.className = "jmk-wt-resizer";
        }        

        function mouseOver(e) {
            sizer.className = "jmk-wt-resizer-hover";
        }
        
        function mouseUp(e) {
            _controller.dragComplete();
            return false;            
        }
        
        this.mouseDown = function(e, _offset) {           
            _widget.cancelAllDrags();
            _webtop.showBorder();
            dragTarget.className = "jmk-wt-resizer-hover";
            _widget.enableBlocker(0);             
            var mp = _widget.getMousePosition(e);
            sizer.style.zIndex = 9998;
            sizer.start = jmaki.getPosition(sizer);
            if (typeof _offset =='undefined') {
                sizer.style.left = sizer.start.x + "px";  
                offset = {x: sizer.start.x - mp.x, y :sizer.start.y - mp.y};
            } else offset = _offset;
            sizer.offset = offset;
            _controller.dragging = true;        
            if (e)e.preventDefault();
            return false;
        };
        
         function mouseMove(e) {            
            if (_controller.dragging == true && offset) {             
                var x = 0;
                var y = 0;
                if (e.x) {
                    x = e.x;
                    y = e.y;
                } else {
                    x = e.clientX + window.scrollX;
                    y = e.clientY + window.scrollY;
                }
                if (offset.x + x  > 0){
                    var _min = _webtop.pos.x + (10 + (_webtop.columnPadding * (sizer.cid + 2)));
                    if (sizer.cid > 0) _min = _webtop.sizers[sizer.cid -1].x;
                    // set the bounds
                    var _max = 0;
                    if (sizer.cid < _webtop.sizers.length -1) {
                         _max = sizer.start.x + _webtop.getColumnWidth(sizer.cid + 1) -  (25 + (_webtop.columnPadding * (sizer.cid + 2)));
                    } else {   
                        _max = sizer.start.x + _webtop.getColumnWidth(sizer.cid + 1) -  (25 + (_webtop.columnPadding * (sizer.cid + 2)));                       
                    } 
                    if (x > _min &&  x < _max) {                                       
                        sizer.style.left = (offset.x + x ) + "px";
                        sizer.x = x;
                    }
                }            
            }
            if (e.preventDefault)e.preventDefault();
            return false;
        }
        
        this.dragComplete = function(e) {
            _webtop.hideBorder();
            dragTarget.className = "jmk-wt-resizer";
            if (_controller.dragging == true) {
                _widget.disableBlocker();
                if (dragCompleteHandler) {
                    dragCompleteHandler(sizer);
                }
                _widget.cancelAllDrags();
            }
            _controller.detach();
            if (e)e.preventDefault();
            return false;            
        };
        init();   
    };
    
   this.DragController = function(frame, moveHandler, dragCompleteHandler) {
        
        var _controller = this;        
        _controller.dragging = false;
        var dragTarget;
        var _offset;

        function init() {
           dragTarget = frame.titleNode;
           dragTarget.style.cursor = "move";
           dragTarget.onmousedown = _controller.mouseDown;
           dragTarget.onmouseup  = mouseUp;
           frame.node.mouseup  = mouseUp;
           window.onmouseup  = mouseUp;
           if (window.addEventListener) {
               window.addEventListener("mousemove", mouseMove, false);
               window.addEventListener("mouseup", mouseUp, false);
           } else if (document.attachEvent){
               document.attachEvent("onmousemove", mouseMove);
               document.attachEvent("onmouseup", mouseUp);
           }
        }

        this.detach = function() {
           _offset = null;
           _controller.dragging = false;            
           frame.node.style.position = "static";
           frame.node.style.zIndex = 9998;
           dragTarget.style.cursor = "pointer";
        };
        
        this.destroy = function() {
            if (window.removeEventListener) {
                window.removeEventListener("mousemove", mouseMove, false);
                window.removeEventListener("mouseUp", mouseUp, false);
            } else if (document.dettachEvent){
                document.dettachEvent("onmousemove", mouseMove);
                document.dettachEvent("onmouseup", mouseUp);
            }    
        };

        function mouseOver(e) {
            if (e)e.preventDefault();
            return false;
        }
        
        function mouseUp(e) {
            _controller.dragComplete();          
        }
        
        this.mouseDown = function(e, _loffset) {           
            _widget.cancelAllDrags();
            _widget.showBorder(); 
            var mp = _widget.getMousePosition(e);
            frame.node.style.zIndex = 1;
            var p = jmaki.getPosition(frame.node);
            var _w = frame.node.clientWidth;
            _controller.enableBlocker(15, true);
            _widget.getDropNode(frame);
            frame.node.style.position = "absolute";
            if (frame.contentWrapper)frame.contentWrapper.style.position = "absolute";
            frame.node.style.zIndex = 9998;

            if (typeof _loffset == 'undefined') {
                document.body.appendChild(frame.node);              
                _offset = {x: p.x - mp.x, y :p.y - mp.y};
                frame.node.style.left = _offset.x + mp.x + "px";
                frame.node.style.top = _offset.y + mp.y + "px";                            
            } else {
                _offset = _loffset;
            }
            _controller.dragging = true;
            _widget.enableBlocker(0);         
            if (e)e.preventDefault();
            else return false;
        };
        
        this.enableBlocker = function (opacity, absolute) {
            if (!frame.blocker) {
                frame.blocker = document.createElement("div");
                frame.blocker.style.background = "#000";
                frame.blocker.style.opacity = opacity / 100;
                frame.blocker.style.filter = "alpha(opacity='" + opacity + "')";
                frame.blocker.style.zIndex = 9999;
            }
            if (typeof absolute != 'undefined'){
                frame.node.appendChild(frame.blocker);
                frame.blocker.style.position = "absolute";
                frame.blocker.style.left = 0 + "px";
                frame.blocker.style.top  = 22 + "px"; 
            } else {
                _widget.container.appendChild(frame.blocker);
                var pos = jmaki.getPosition(frame.node);
                frame.blocker.style.left = pos.x + "px";
                frame.blocker.style.top  = pos.y + "px"; 
            }
            frame.blocker.style.display = "block";
            frame.blocker.style.width = frame.contentNode.clientWidth  + "px";
            frame.blocker.style.height = frame.contentNode.style.height;       
        };

         function mouseMove(e) {            
            if (_controller.dragging == true && _offset) {             
                var x = 0;
                var y = 0;
                if (e.x) {
                    x = e.x;
                    y = e.y;
                } else {
                    x = e.clientX + window.scrollX;
                    y = e.clientY + window.scrollY;
                }                
                if (_offset.x + x  > 0)frame.node.style.left = (_offset.x + x ) + "px";

                if (_offset.y  + y > 0)frame.node.style.top  = (_offset.y  + y) + "px";
                if (moveHandler)
                    moveHandler(frame, {x: (_offset.x + x ), y : (_offset.y  + y) });                
            }
            if (e.preventDefault)e.preventDefault();
            else return false;
        }

        this.dragComplete = function(e) {
            _widget.disableBlocker();
            _widget.hideBorder();
            if (frame.contentWrapper) frame.contentWrapper.style.position = "relative";
            frame.node.style.zIndex = 1;
            if (frame.blocker && frame.blocker.parentNode) {
                frame.blocker.style.display = "none";
            }
            if (_controller.dragging == true) {

                if (dragCompleteHandler) {
                    dragCompleteHandler(frame);
                }
                _widget.cancelAllDrags();
            }
            _controller.detach();
            if (e)e.preventDefault();
            return false;            
        };
        init();   
    }
    
};

jmaki.namespace("jmaki.ext");

jmaki.ext.loadImage = function(_src) {

    // used for transparency filter setting  
    var isIE6 = /MSIE 6/i.test(navigator.userAgent);        
       var img;
       if (isIE6 && /.png/i.test(_src)) {
           img = document.createElement("div");
           img.style.height = "15px";
           img.style.width = "15px";
           img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader (src='" + _src + "', sizingMethod='image')";
       } else {
         img = document.createElement("img");
         img.src = _src;
       }
       return img;
};    

jmaki.ext.lightboxManager = function(wargs) {
    _widget = this;
    _widget.lightboxes = {};
    var publish = "/jmaki/webtop";

    this.addLightbox= function(o) {
        var i;
        if (o.message) o = o.message;
        else i = o; 
        if (i.value) i = i.value;
        if (!i.id) i.id = genId();

        var frame = document.createElement("div");  
        if (i.startWidth)frame.style.width = i.startWidth + "px"; 
        frame.className = "jmk-wt-lightbox";
        
        var titleBar = document.createElement("div");
        titleBar.className = "jmk-wt-lightbox-titlebar";
        
        i.titleNode = document.createElement("div");
        titleBar.appendChild(i.titleNode);
        
        i.titleNode.className = "jmk-wt-lightbox-title";
        i.titleNode.innerHTML = i.label;       
        frame.appendChild(titleBar);        
        // create the icons
        var icons = document.createElement("div");
        icons.className = "jmk-wt-lightbox-icons";
        titleBar.appendChild(icons);
        
        var close = jmaki.ext.loadImage(wargs.widgetDir + "/images/close.png");
        close.frameId = i.id;
        close.onclick = function(e) {
            var _t;
            if (!e) _t = window.event.srcElement;
            else _t = e.target;
            if (_t.frameId){
                _widget.hideLightbox(_t.frameId);  
            }
        };
        icons.appendChild(close);               
        if (i.content || i.widget || i.include) {
            cPane = document.createElement("div");
            var _content = "";
            var _overflowX = i.overflowX;
            var _overflowY = i.overflowY;
            var _overflow = i.overflow;
            if (!_overflowX) _overflowX = "hidden";
            if (!_overflowY) _overflowY = "hidden";
            if (!_overflow) _overflow = "hidden";
            i.dcontainer = new jmaki.DContainer(
            {target:  cPane,
             useIframe : i.iframe,
             overflow : _overflow,
             overflowY : _overflowY,
             overflowX : _overflowX,
             content : _content,
             startHeight : i.startHeight -2,
             startWidth : i.startWidth -2,
             autosize : false});
             i.contentNode = cPane;
        } else if (i.contentNode){
            cPane = i.contentNode
        } else {
           jmaki.log("could not create Lightbox. Need a content, widget, or include");
           return null;
        }
        cPane.style.clear = "both";
        frame.appendChild(cPane);
        if (i.widget) {
            var _w = document.createElement("div");
            cPane.appendChild(_w);
            jmaki.ext.widgetFactory.add(jmaki.clone(i.widget), _w);
            _w.style.height = i.startHeight - 2 + "px";            
        }
        if (i.startHeight) {
            frame.style.height = i.startHeight + "px";
            frame.startHeight = i.startHeight;
        }             
        if (i.include && i.dcontainer)  i.dcontainer.loadURL(i.include);
        i.node = frame;
        _widget.lightboxes[i.id] = i;

        var wd = jmaki.ext.getWindowDimensions();   
        frame.style.top = (wd.h/2) - (i.startHeight /2) + wd.scrollY + "px";
        frame.style.left = (wd.w/2) - (i.startWidth /2) + wd.scrollX + "px";           
        document.body.appendChild(frame);
        i.hide = function(){
            frame.style.display = "none";
            jmaki.publish(publish + "/lightboxHidden", { targetId : i.id});
        };
        i.show = function(){
            frame.style.display = "block";
        };
        return i;
    };

    this.removeLightbox = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        else targetId = o;      
        var _f = _widget.lightboxes[targetId];
        if (_f) {
            jmaki.clearWidgets(_f.node);            
            _f.node.parentNode.removeChild(_f.node);
            if (typeof _f.destroy == "function")_f.destroy();
            delete _widget.frames[targetId];
        }
    };     
    
    this.hideLightbox = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        else targetId = o;      
        var _f = _widget.lightboxes[targetId];
        if (_f) {
            _f.hide();
        }
    };
    
    this.showLightbox = function(o) {
        var targetId;
        if (o.message) o = o.message;
        if (o.targetId) targetId = o.targetId;
        else targetId = o;            
        var _f = _widget.lightboxes[targetId];
        if (_f) {        
            _f.show();
        }
    };
};
    /**
     * Return the dimensions and the region of the page scrolled to.
     */
jmaki.ext.getWindowDimensions = function() {
    var _w = 0;
    var _h = 0;
    var _sx = 0;
    var _sy = 0;    
    if (window.innerWidth) {
        _w = window.innerWidth;
        _h = window.innerHeight; 
   } else if (document.documentElement &&
              document.documentElement.clientHeight) {
       _w = document.documentElement.clientWidth;
       _h = document.documentElement.clientHeight;
   } else if (document.body) {    
        _w = document.body.clientWidth;
        _h = document.body.clientHeight;
   }
   if (window.pageYOffset) {          
        _sx = window.pageXOffset;
        _sy = window.pageYOffset;
   } else if (document.documentElement &&
             document.documentElement.scrollTop) {
       _sx = document.documentElement.scrollLeft;
       _sy = document.documentElement.scrollTop;            
   } else if (document.body) {           
       _sx = document.body.scrollLeft;
       _sy = document.body.scrollTop;
   }
   return {w : _w, h: _h, scrollX : _sx, scrollY : _sy};
};
    
jmaki.widgets.jmaki.webtop.CardLayout = function(wargs) {
    
    var _layout = this;  
    var container = wargs.container;
            
    _layout.views = {};
    var selectedView;
   
   this.getSelectedView = function() {
       return selectedView;
   };
    
   this.selectView = function(viewId) {   
        if (_layout.views[viewId]) {
            // hide the previous view
            if (viewId != selectedView && _layout.views[selectedView]) {           
              _layout.views[selectedView].container.style.display = "none";  
            }
            var view = _layout.views[viewId];
            view.container.style.display = "inline";
            selectedView = viewId;    
        }
    };
    
    /**
     * Add a view
     * @param view object following the tabbed view /accordion object model
     */
    this.addView = function(view) {
        if (!view.id) view.id = genId();
    
        if (!view.container)view.container = document.createElement("div");
        view.container.id = wargs.uuid + "_" + view.id;
        // select the current view if specified or not done yet.
        if (view.selected == true ||  !selectedView) selectedView = view.id;        
        view.container.style.display = "none";
        container.appendChild(view.container);

        _layout.views[view.id] = view;
    };
    
    /** 
     * Remove a view
     * @param viewId id that is to be removed
     */
    this.removeView = function(viewId) {
        if (_layout.views[viewId]) {
            var view = _layout.views[viewId];
            // clean up jmaki widgets
            jmaki.clearWidgets(view.container);
            delete _layout.views[viewId];
        }
    };   
};

jmaki.widgets.jmaki.webtop.TabMenu = function(wargs) {

    var _widget = this;
    _widget.container = wargs.container;
    var selectedTab;
    var mis = [];
    var tabs = {};
    var counter=0;

    this.addItem = function(item) {            
        var _id;
        if (item.id) _id = item.id;
        else _id = "item_"+ counter++;
        var mi = document.createElement("li");
        var mil = document.createElement("div");
        mil.className = "jmk-wt-tm-left";
        mil.id = _id + "_left";
        var mic =  document.createElement("div");
        mic.className = "jmk-wt-tm-center";
        mic.id = _id + "_center";
        var mir =  document.createElement("div");
        mir.className = "jmk-wt-tm-right";
        mir.id = _id + "_right";
        var link = document.createElement("a");
        var target = item.id;
        link.id = target;
        link.className = "jmk-wt-tm-link";
        link.item =  item;
        link.item.uuid = _id;
        link.onclick = function(e) {
            if (!e) e = window.event;
            var t;
            if (e.target) t= e.target;
            else if (e.srcElement) t = e.srcElement;
            _widget.select(t.item.uuid);            
        };

        link.appendChild(document.createTextNode(item.label));
        mic.appendChild(link);
        mi.appendChild(mil);
        mi.appendChild(mic);
        mi.appendChild(mir);
        _widget.menu.appendChild(mi);

        if (item.clickHandler) link.clickHandler = item.clickHandler;
        mis.push(link);
        tabs[_id] = link;
        var _w = mi.parentNode.clientWidth;
        // FIXME : why are IE's sith off so much?
        if (jmaki.MSIE) _w += 65;
        _widget.centered.style.width =   _w + "px";
        if (item.selected) _widget.select(_id);
    };
    
    this.select = function(viewId) {     
        if (tabs[viewId]) {
            var t = tabs[viewId];
            selectedTab = t.item.uuid;        
            for (var i=0; i < mis.length; i++) {
                var tar = mis[i].item.uuid;
                if (selectedTab != tar) {           
                    document.getElementById( tar + "_left").className = "jmk-wt-tm-left";
                    document.getElementById( tar + "_center").className = "jmk-wt-tm-center";
                    document.getElementById( tar + "_right").className = "jmk-wt-tm-right";
                } else {
                    if (t.clickHandler) {
                        t.clickHandler();
                    }
                    document.getElementById( tar + "_left").className = "jmk-wt-tm-left-selected";
                    document.getElementById( tar + "_center").className = "jmk-wt-tm-center-selected";
                    document.getElementById( tar + "_right").className = "jmk-wt-tm-right-selected";               
              }     
            }
        }  
    };
    _widget.container.className = "jmk-wt-tm-container";
    _widget.centered = document.createElement("div");
    _widget.centered.className = "jmk-wt-tm-centered";
    _widget.container.appendChild(_widget.centered);
    _widget.menu = document.createElement("ul");
    _widget.centered.appendChild(_widget.menu);     
};

jmaki.namespace("jmaki.extensions.google.gears");

jmaki.extensions.google.gears.Extension = function(args) {

  var self = this;
  var topic = "/google/gears";
  var db = null;
  var factory = null;
  
  this.postLoad = function() {
     self.init();
     jmaki.subscribe(topic + "/execute", self.execute);
  };

  this.init = function() {
      jmaki.log("Google Gears jMaki 1.0 Extension intialized");

      // Firefox
      if (typeof GearsFactory != 'undefined') {
          factory = new GearsFactory();
      } else {
          // IE
          try {
              factory = new ActiveXObject('Gears.Factory');
          } catch (e) {
              // Safari
              if (navigator.mimeTypes["application/x-googlegears"]) {
                  factory = document.createElement("object");
                  factory.style.display = "none";
                  factory.width = 0;
                  factory.height = 0;
                  factory.type = "application/x-googlegears";
                  document.documentElement.appendChild(factory);
              }
          }
      }
      // Now set up the objects, being careful not to overwrite anything.
      if (!window.google) {
          window.google = {};
      }
      
      if (!google.gears) {
          google.gears = {factory: factory};
      }      
  };
  
  // Open this page's local database.
  function initDB() {
      if (!window.google || !google.gears) {
          jmaki.log("Google Gears not found.");
          return;
      }
      
      try {
          db = google.gears.factory.create('beta.database', '1.0');
      } catch (ex) {
          jmaki.log('Could not create database: ' + ex.message);
      }
      
      if (db) {
          db.open('beta-database');
          db.execute('create table if not exists webtop' +
          ' (obj varchar(19048), Timestamp int)');  
      }
  }
  
  this.execute = function(args) {
    this.query = args.query;
    var _callback = args.callback;
    this.qargs = args.args;
    if (!db) initDB();
    if (!db) {
      jmaki.log("Google Gears Extension: Unable to find database");
      return;
    }
   var rs =  db.execute(query, qargs);
    // execture callback if it's there
    if (typeof _callback != 'undefined') _callback.call(this,rs);
  };
};


    jmaki.namespace("jmaki.ext.widgetFactory");
   
     function createElementMap(target, prop) {
         var _map = {};
         var elms = document.getElementsByTagName(target);          
         for (var i = 0; i < elms.length; i++) {
            if (elms[i][prop]) _map[elms[i][prop]] = true;                    
         }
         return _map;
    }
    
 jmaki.ext.widgetFactory.gscripts = createElementMap("script", "src");
 jmaki.ext.widgetFactory.gstyles = createElementMap("link", "href");    
    /**
     * Programtically load any jMaki widget and it's resources from the browser
     *
     */    
    jmaki.ext.widgetFactory.add = function(_wargs, container, _wjson, _callback) { 
        // include the scripts      
        var widgetDir = _wargs.widgetDir;
          
        if (!_wargs.uuid)_wargs.uuid = jmaki.genId();     
        if (_wargs.value) {
           _wargs.value = jmaki.clone(_wargs.value);        
        }

        var loc;        
        function normalizeURL(url) {
            if (/../.test(url)) {
                var toks = url.split("/");
                if (toks.length >0){
                    var _count=0;
                    var _index = toks.length -1;
                    while (_index >= 0) {
                        if (toks[_index] == '..'){                            
                            _count++;
                        } else {
                            // we have the end of a set
                            if (_count > 0) {
                                var _start = _index - (_count -1);
                                var _slen = _count * 2;
                                // don't go beyond size mimial size
                                if (_index - _count<  0){
                                    _start = 0;
                                }
                                toks.splice(_start,_slen);                                
                                _count = 0;
                            }
                        }
                        _index--;                        
                    }  
                }
                return toks.join("/");
            } else {
                return url;
            }
        }

        function loadTemplate() {           
           // load the template       
           jmaki.doAjax({ url : widgetDir + "component.htm",
               asynchronous : false,
               callback : function(req) {                  
                   // global regex replace not working so using arrays
                   var temps = req.responseText.split('${uuid}');
                   var template = temps.join(_wargs.uuid);               
                   container.innerHTML = template + "<div id='_" + _wargs.uuid + "_'></div>";
               }
           });
           
          // wait for the content to be loaded
          var _t = setInterval(function() {
              if (document.getElementById("_" + _wargs.uuid + "_") != null) {
                  clearInterval(_t);                                         
                  loadWidget();              
              }
          }, 10);
       }  
       function loadWidget() {            
           // load the css and add only if the fille exists
           if (!jmaki.ext.widgetFactory.gstyles[widgetDir + "component.css"]) {
               jmaki.doAjax({ url : widgetDir + "component.css",
               callback : function(req) {         
                   jmaki.loadStyle(widgetDir + "component.css");
                   jmaki.ext.widgetFactory.gstyles[widgetDir + "component.css"] = true;
               }});               
           }         
           // check for the constructor and if we don't find it load and wait for the component.js to load
           if ( jmaki.findObject("jmaki.widgets." + _wargs.name + ".Widget") == null) {              
                 jmaki.addLibraries({
                     libs :
                   [widgetDir + "component.js"],
                   callback : 
                   function() {     
                       jmaki.ext.widgetFactory.gscripts[widgetDir + "component.js"] = true;          
                       // create an instance and feed it the wargs using jmaki                   
                       var _wimpl = jmaki.loadWidget(_wargs);                  
                       if (_wimpl && typeof _callback == "function") {
                           _callback(_wimpl, _wargs, container);  
                       }
                       container.style.visibility = "visible"; 
                   },
                   inprocess : undefined,
                   cleanup : false});
           } else {	        
                   var _wimpl = jmaki.loadWidget(_wargs);
                   if (_wimpl && typeof _callback == "function") {
                       _callback(_wimpl, _wargs, container);  
                   }
                   container.style.visibility = "visible";            
           }    
       }
        // load any dependencies
        if (typeof _wjson == 'object' && 
            _wjson.config) {
           var _cfg = _wjson.config.type;
            
           if (_cfg.themes) {
               var theme;
               // check each theme if they are the default. Last one wins      
               for (var i=0; i < _cfg.themes.length; i++) {
                  if (_cfg.themes[i]['default'] == true) {
                      theme = _cfg.themes[i].style;
                  }
                  // exit if there is a match to global theme
                  if (_cfg.themes[i].id == jmaki.config.globalTheme) {
                      theme = _cfg.themes[i].style;
                      break;
                  }
               }
               var _url = normalizeURL(widgetDir +  theme);
               if (!jmaki.ext.widgetFactory.gstyles[_url]){
                    jmaki.loadStyle(_url);
                    jmaki.ext.widgetFactory.gstyles[_url] = true;   
               }
           } 
           // load styles
           if (_cfg.styles) {                
               for (var j=0; j < _cfg.styles.length; j++) {               
                   var _url2 = normalizeURL(widgetDir + _cfg.styles[j]);                
                    if (!jmaki.ext.widgetFactory.gstyles[_url2]){                      
                        jmaki.loadStyle(_url2);
                        jmaki.ext.widgetFactory.gstyles[_url2] = true; 
                    }
               }
           }
           // do preload
           if (_cfg.preload) {
               _globalScope.eval(_cfg.preload);
           }

           // load all javascripts
           if (_cfg.libs) {
               var _libs = [];
               for (var ii = _cfg.libs.length -1; ii >= 0; ii--) {
                    var _url3 = normalizeURL(widgetDir + _cfg.libs[ii]);                    
                    if (!jmaki.ext.widgetFactory.gscripts[_url3]) {
                       jmaki.ext.widgetFactory.gscripts[_url3] = true;
                       _libs.push(_url3);                    
                    }
               }           
               if (_libs.length >0){
                   jmaki.addLibraries( { libs : _libs, callback : loadTemplate, cleanup :  false});
               } else {
                  loadTemplate(); 
               }
           } else {
               loadTemplate();
           }
        } else {
            loadTemplate();
        }
    };
    /**
     * Find declarative markup an element using jmakiName, jmakiArgs, jmakiValue,
     * jmakiId, jmakiPublish, jmakiSubscribe all of which map to the properties a
     * normal jMaki widget would need  to load.
    */
    jmaki.ext.widgetFactory.findAndAdd = function(targetId) {
        var targets = jmaki.getAllChildren(document.getElementById(targetId), []);
        for (var i=0; targets && i < targets.length; i++) {
            if (targets[i].getAttribute('jmakiName')) {
                var widget = {};
                widget.name = targets[i].getAttribute('jmakiName');
                if (targets[i].getAttribute('jmakiArgs'))widget.args = targets[i].getAttribute('jmakiArgs');
                var val = targets[i].getAttribute('jmakiValue').replace("\"", "\'", "g");
                if (targets[i].getAttribute('jmakiValue'))widget.value = eval("(" + val + ")" );
                if (targets[i].getAttribute('jmakiPublish'))widget.publish = targets[i].getAttribute('jmakiPublish');
                if (targets[i].getAttribute('jmakiSubscribe'))widget.subscribe = targets[i].getAttribute('jmakiSubscribe');
                if (targets[i].getAttribute('jmakiId'))widget.uuid = targets[i].getAttribute('jmakiId');
                var loc = targets[i];           
                jmaki.ext.widgetFactory.add(widget,loc);
            }
        }
    };



jmaki.widgets.jmaki.webtop.Pallette = function(wargs) {

    var _widget = this;

    var items = [];
    var index = -1;
    var count = 4;
    var timeout = 35;
    var topic = "/jmaki/webtop/pallette";
    var subscribe = ["/jmaki/webtop/pallette"];
    var counter = 0;
    
    var next;
    var prev;
    var showNav = true;

    var increment = 45;
    // this is relative to height
    var itemHeight = 100;
    var itemWidth = 110;
    var data;
    var _webtop;
    var template;
    var scrollCount = 4;
    _widget.category = "all";
    
    var horizontalScroll = true;
    _widget.wnode = document.getElementById(wargs.uuid);
    _widget.wnode.style.visibility = "hidden";

    _webtop = jmaki.getWidget(wargs.args.webtopId);             
    
    var scroll;
    // include some padding
    if (horizontalScroll) scroll = itemWidth;
    else scroll = itemHeight + 4;

    this.addItem = function(item) {
        if (!item.id) item.id = items.length;        
        var id = item.id;
        item.sid = wargs.uuid+ "_img_" + items.length;
        var text = _widget.applyTemplate(item, template);

        if (typeof item.id == 'undefined') item.id =  counter++; 
        var div = document.createElement("div");
        _widget.container.appendChild(div); 
        div.innerHTML = text;     
        div.style.zIndex = 1;
        div.style.width = itemWidth + "px";
        div.style.height = itemHeight + "px";                   
        div.style.display = 'inline';
        if (horizontalScroll) {
            // get the content node
            var content = document.getElementById(wargs.uuid+ "_item_" + id);
            content.style.height = 130 + "px"; 
           if (jmaki.MSIE)div.style.styleFloat = "left";
           div.style.cssFloat = "left";
        }

        div.id = wargs.uuid + "_item_" + item.id;
        item.div = div;

        items.push(item);
        return id;
    };
    
    this.select = function(itemId){
        for (var _i=0; _i < items.length; _i++) {
           var item = items[_i];
           if (item.id == itemId) {            
               _widget.showIndex(_i);       
               item.div.firstChild.className += " jmk-wt-carousel-item-selected";
           } else {
               item.div.firstChild.className = " jmk-wt-carousel-item";
           }
        }
    };
    
    this.refresh = function() {
        _widget.clear();
        _webtop.refreshPallette();
    };
    
    this.populateMenu = function() {
        if (!_widget.menu) {
            _widget.menu = document.createElement("div");
            _widget.menu.className = "jmk-wt-carousel-menu";
            document.body.appendChild(_widget.menu);
        } else {
            _widget.menu.innerHTML = "";
        }
        var l = document.createElement("ul");
        _widget.menu.appendChild(l);
        var _a = document.createElement("li");
        var _href = document.createElement("a");
        _href.appendChild(document.createTextNode("All"));
        _href.onclick = function(e) {
        	_widget.category = "all";
            _widget.clear();
            _widget.menu.style.display = "none";
            _widget.setItems(data);
            _widget.render();
            _widget.titlebar.innerHTML = "Palette - All Widgets";     	
        };
        _a.appendChild(_href);
         l.appendChild(_a);
         _widget.types = {};
         for (var ii=0; ii < data.length; ii++) {
             var _t = data[ii].id.split(".");
             var _ts = _t.splice(0, _t.length - 1);
             var _targetId = jmaki.clone(_ts);             
             for (var j=0; j < _ts.length; j++) {
                 _ts[j] = _ts[j].substring(0,1).toUpperCase() +  _ts[j].substring(1,_ts[j].length);
             }
             var _name = _ts.join(" ");            
             if (!_widget.types[_name]) {
                 var _a2 = document.createElement("li");
                 var _href2 = document.createElement("a");
                 _href2.appendChild(document.createTextNode(_name));
                 _href2.targetId = _targetId;
                 _href2.categoryName = _name;
                 _href2.onclick = function(e) {
                     _widget.category = this.targetId.join(".");
                     _widget.clear();
                     _widget.menu.style.display = "none";
                     renderItems();
                     _widget.render();
                     _widget.titlebar.innerHTML = "Pallette - " + this.categoryName + " Widgets"; 
                 };
                 _a2.appendChild(_href2);
                 l.appendChild(_a2);
                 _widget.types[_name] = true;
             }
         }            
    };
    
    this.showMenu = function() {
    	if (_widget.menu &&
    	    _widget.menu.style.display == "block") {
    	    _widget.menu.style.display = "none";
    	    return;
    	}
        if (!_widget.menu)_widget.populateMenu();
        var p = jmaki.getPosition(_widget.menuIcon);
        _widget.menu.style.top = p.y + 14 + "px";
        _widget.menu.style.left = p.x + "px";
        _widget.menu.style.display = "block"; 
    };
    
    this.render = function() {
        if (_widget.wnode.style.visibility == 'hidden') {
        	_widget.navRight.style.visibility = "hidden";
        	_widget.navLeft.style.visibility = "hidden";
        	return;
        }
        if ((index + count) >= items.length) {
            if (_widget.navRight) {
               _widget.navRight.style.visibility = "hidden";
            }    
            next.style.visibility = "hidden";
        } else {
            if (_widget.navRight) {
               _widget.navRight.style.visibility = "visible";
            } 
       
            next.style.visibility= "visible";
        }
        if (index <= 0) {
            prev.style.visibility = "hidden";
            if (_widget.navLeft) {
               _widget.navLeft.style.visibility = "hidden";
            }
        } else {
            prev.style.visibility= "visible";
              if (_widget.navLeft) {
               _widget.navLeft.style.visibility = "visible";
            }           
        }
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
    
    this.showIndex = function(targetIndex) {
          
        if (targetIndex < index ||
            targetIndex >= index + count){       
            if (targetIndex < index) {
               var _cb = function() {
                 index = targetIndex;                
                 _widget.render();
               };
               var targetPos = (targetIndex * itemHeight) * -1;
               doScroll(targetPos, _cb, false);
            } else if (targetIndex >= index + count) {                          
                var callback = function() {               
                   index = targetIndex - index;
                   _widget.render();
                };
                var tp = (targetIndex * itemHeight) * -1;
                doScroll(tp, callback, true);
            }    
        } else {
           _widget.render();
        }
        
    };
    
    function doScroll(target, callback, forward) {
       
          var start;
          if (horizontalScroll) start = new Number(_widget.container.style.left.split('px')[0]); 
          else start = new Number(_widget.container.style.top.split('px')[0]);

          var _inc = increment;
 
          if (forward == false){
             if (start >= target){        
                if (horizontalScroll)_widget.container.style.left = target + "px";
                else _widget.container.style.top = target + "px";
                callback(); 
             } else {
                  // slow down near target
                  
                  if (target - start < scroll / 2) _inc = _inc / 1.25;
                  else if (target - start < scroll * 3) _inc = _inc / 1.5;
                  
                  if (horizontalScroll) _widget.container.style.left = (start  + _inc) + "px";
                  else _widget.container.style.top = (start  + _inc) + "px";
                  setTimeout(function(){ doScroll(target, callback,forward);}, timeout);
             }
          } else if (forward == true){
      
             if (start <= target){
                 if (horizontalScroll)_widget.container.style.left = target + "px";
                 else _widget.container.style.top = target + "px";
                callback(); 
             } else {
                  // slow down near target
                  if (start - target < scroll / 2) _inc = _inc / 1.25;
                  else if (start - target < scroll * 3) _inc = _inc / 1.5;           
                  if (horizontalScroll)_widget.container.style.left = (start  - _inc) + "px";
                  else _widget.container.style.top = (start  - _inc) + "px";
                  setTimeout(function(){ doScroll(target, callback,forward);}, timeout);
             }          
          }
    }
    
    this.getNext = function() {

       var callback = function() {           
           _widget.render();
       };
       index += scrollCount;
       if (index > items.length) index = items.length -1;
       var targetPos = (index * scroll) * -1;
       doScroll(targetPos, callback, true);
    };
    
    this.getPrevious = function() {
        
       var callback = function() {
           _widget.render();

       };
       index -= scrollCount;
       if (index < 0) index = 0;
       var targetPos = (index * scroll) * -1;
       doScroll(targetPos, callback, false);

    };
       
    this.clear = function() {
        _widget.container.innerHTML = "";
        _widget.container.style.top = "5px";
        _widget.container.style.left ="0px";
        index = -1;
        items = [];
        _widget.render();
    };
    
    function renderItems() {
       if (horizontalScroll && data) {
            _widget.container.style.width = ((itemWidth + 10) * data.length) + "px";
       }       
       for (var h=0; h < data.length; h++) {       
         if (data[h].id.indexOf(_widget.category) != -1 ||
             _widget.category == "all")  
            _widget.addItem(data[h]);
       }        
       _widget.render();  
       for (var _i=0; _i < items.length ; _i++) {   
            var img = document.getElementById(items[_i].sid = wargs.uuid + "_img_" + _i);
            img.style.cursor = "pointer";
            img.onmousedown = function(e) {
                for (var i=0; i < _webtop.model.items.length; i++) {
                    if (this.getAttribute('widget') == _webtop.model.items[i].id) {
                        img.frame = _webtop.createFrame(_webtop.model.items[i]);
                    }
                }
                if (img.frame) {      
                    var mp = _webtop.getMousePosition(e);       
                    img.frame.node.style.left = mp.x + "px";
                    img.frame.node.style.top = mp.y + "px";
                    document.body.appendChild(img.frame.node);
                    img.frame.dragController = new _webtop.DragController(img.frame, _webtop.findDropPoint,
                    _webtop.dragComplete);
                    img.frame.column = -1;                                                    
                    img.frame.dragController.mouseDown(e, { x : 0, y : 0}); 
                }
            };
        }
    }

    this.setItems = function(_in) {
       data = jmaki.clone(_in);
       renderItems();  
       
    };
    
    function setArrowNav() {
        if (!_widget.navLeft) {
            _widget.navLeft = document.createElement("img");       
            _widget.navLeft.src = wargs.widgetDir + "/images/left.gif";
            _widget.navLeft.style.left = "5px";
            _widget.navLeft.style.position = "absolute";
            _widget.navLeft.style.cursor = "pointer";
            _widget.navLeft.style.zIndex = 9999;
            _widget.navLeft.style.top = 45 + "px";
            _widget.navLeft.style.left = 2 + "px";
            _widget.node.appendChild(_widget.navLeft);
            _widget.navRight = document.createElement("img");
            _widget.navRight.style.zIndex = 9999;
            _widget.navRight.src = wargs.widgetDir + "/images/right.gif";
            _widget.navRight.style.position = "absolute";
            _widget.navRight.style.cursor = "pointer";
            _widget.navRight.style.top = _widget.navLeft.style.top;
            _widget.navRight.style.right =  "5px";
            _widget.node.appendChild(_widget.navRight);        
            _widget.navLeft.onclick = _widget.getPrevious;
            _widget.navRight.onclick = _widget.getNext; 
        }
    }

   this.MakeDraggable = function(dragTarget, draggable) {
        
        var _controller = this;        
        _controller.dragging = false;
        var _offset;
        function init() {

           dragTarget.style.cursor = "move";
           dragTarget.onmousedown = _controller.mouseDown;
           dragTarget.onmouseup  = mouseUp;
           dragTarget.mouseup  = mouseUp;
           window.onmouseup  = mouseUp;
           if (window.addEventListener) {
               window.addEventListener("mousemove", mouseMove, false);
               window.addEventListener("mouseup", mouseUp, false);
           } else if (document.attachEvent){
               document.attachEvent("onmousemove", mouseMove);
               document.attachEvent("onmouseup", mouseUp);
           }
        }

        this.detach = function() {
           _offset = null;
           _controller.dragging = false;            
           dragTarget.style.position = "static";
           dragTarget.style.cursor = "pointer";
        };
        
        this.destroy = function() {
            if (window.removeEventListener) {
                window.removeEventListener("mousemove", mouseMove, false);
                window.removeEventListener("mouseUp", mouseUp, false);
            } else if (document.dettachEvent){
                document.dettachEvent("onmousemove", mouseMove);
                document.dettachEvent("onmouseup", mouseUp);
            }    
        };

        function mouseOver(e) {
            if (e)e.preventDefault();
            return false;
        }
        
        function mouseUp(e) {
            _controller.dragComplete();          
        }
        
        this.mouseDown = function(e, _loffset) {
        	if (_widget.menu)_widget.menu.style.display = "none";          
             _webtop.enableBlocker(0);
            var mp = _webtop.getMousePosition(e);
            var p = jmaki.getPosition(draggable);
                draggable.style.left = p.x + "px";
                draggable.style.top = p.y + "px";   
                _offset = {x: p.x - mp.x, y :p.y - mp.y};               
            _controller.dragging = true;
            if (e)e.preventDefault();
            else return false;
        };
 
         function mouseMove(e) {            
            if (_controller.dragging == true && _offset) {             
                var x = 0;
                var y = 0;
                if (e.x) {
                    x = e.x;
                    y = e.y;
                } else {
                    x = e.clientX + window.scrollX;
                    y = e.clientY + window.scrollY;
                }                
                if (_offset.x + x  > 0)draggable.style.left = (_offset.x + x ) + "px";

                if (_offset.y  + y > 0)draggable.style.top  = (_offset.y  + y) + "px";
              
            }
            if (e.preventDefault)e.preventDefault();
            else return false;
        }

        this.dragComplete = function(e) {
            _controller.detach();
            _webtop.disableBlocker();
            if (e)e.preventDefault();
            return false;            
        };
        init();   
    };


    this.init = function() {
        _widget.resize(); 
        var dim = jmaki.getDimensions(_widget.container);
        document.body.appendChild(_widget.wnode);

        var _wtdim = jmaki.getDimensions(_webtop.container);
        var wtPos = jmaki.getPosition(_webtop.container);
        _widget.wnode.style.top = wtPos.y + 5 +  "px";
        _widget.wnode.style.left = wtPos.x + (_wtdim.w / 2) - (dim.w / 2) +  "px";
        list = document.getElementById(wargs.uuid + "_list");
        next = document.getElementById(wargs.uuid + "_next");
        prev = document.getElementById(wargs.uuid + "_previous");
        var closeDiv = document.getElementById(wargs.uuid + "_close");
        var close = jmaki.ext.loadImage(wargs.widgetDir + "/images/close.png");
        close.onclick = _webtop.hidePallette;
        close.className = "jmk-wt-carousel-icon";     
        closeDiv.title = "Close";
        closeDiv.style.paddingRight = "2px";
   
        var refresh = jmaki.ext.loadImage(wargs.widgetDir + "/images/refresh-s.png");
        refresh.className = "jmk-wt-carousel-icon";
        refresh.onclick = _widget.refresh;
        refresh.title = "Refresh";
        _widget.menuIcon = jmaki.ext.loadImage(wargs.widgetDir + "/images/menu-s.png");   
        _widget.menuIcon.style.zIndex = 9999;       
        _widget.menuIcon.onclick = _widget.showMenu;
        
        _widget.menuIcon.className = "jmk-wt-carousel-icon";
        _widget.menuIcon.title = "Widgets";
        closeDiv.appendChild(_widget.menuIcon);
        closeDiv.appendChild(refresh); 
        closeDiv.appendChild(close);  
        
        next.onclick = _widget.getNext;
        prev.onclick = _widget.getPrevious;
        _widget.subs = [];
        for (var _i=0; _i < subscribe.length; _i++) {
            doSubscribe(subscribe[_i]  + "/clear", _widget.clear);
            doSubscribe(subscribe[_i]  + "/setItems", _widget.setItems);
        }        
       // this is the template for all li
       template = unescape(document.getElementById(wargs.uuid + "_template").innerHTML + "");
       _widget.titlebar = document.getElementById(wargs.uuid + "_label");
       _widget.MakeDraggable( _widget.titlebar, _widget.wnode);
      _widget.container.style.left = "0px"; 
      _widget.render(); 
    };

    this.resize = function() {
        _widget.scrollpane = document.getElementById(wargs.uuid + "_scrollpane");
        _widget.nav  = document.getElementById(wargs.uuid + "_nav");
        _widget.container = document.getElementById(wargs.uuid + "_content");
        
        _widget.node = document.getElementById(wargs.uuid);
        var _dim = jmaki.getDimensions(_widget.node, 52);                     
        if (horizontalScroll) {    
            _widget.nav .style.display = "none";   
            itemHeight =100;
            _widget.scrollpane.style.height = 100  + "px";
            setArrowNav();
        } else {
            _widget.nav .style.display = "block"; 
           _widget.scrollpane.style.height = _dim.h - 32 + "px";  
        } 
    };

    this.hide = function() {
        _widget.wnode.style.visibility = "hidden";
        _widget.render(); 
    };

    this.show = function() {
        _widget.wnode.style.visibility = "visible";
        _widget.render();
    };    
    
    this.destroy = function() {
        for (var i=0; _widget.subs && i < _widget.subs.length; i++) {
            jmaki.unsubscribe(_widget.subs[i]);
        }
        delete list;
        delete next;
        delete prev;
        delete container;        
    };       
    
    function doSubscribe(topic, handler) {
        var i = jmaki.subscribe(topic, handler);
        _widget.subs.push(i);     
    }
    _widget.init();
    if (wargs.value)_widget.setItems(wargs.value);
 
};