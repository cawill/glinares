jmaki.namespace("jmaki.widgets.jmaki.calendar");

jmaki.widgets.jmaki.calendar.Widget = function(wargs) {

    var _widget = this;
    var _today = new Date();
    var _startYear = _today.getFullYear();
    var _startMonth = _today.getMonth();
    
    _widget.events = new jmaki.Map();
    
    _widget.publish = "/jmaki/calendar";

    _widget.container = document.getElementById(wargs.uuid);
    _widget.days = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"
    ];
    
    _widget.daysInMonth = [
        31,
        28,
        31,
        30,
        31,
        30,
        31,
        31,
        30,
        31,
        30,
        31   
    ];
    
    _widget.months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ];
    
    function getFirstDay(month, year){
        var _d = new Date();
        _d.setYear(year);        
        _d.setMonth(month, 1);
        return _d.getDay();
    }
    
    function getNumberOfDays(month, year) {
       // handle leap year
       if (month == 1 &&
          (new Date(year,1,29).getDate() == 29)) {
           return 29;
        } else {
           return _widget.daysInMonth[month];
        }
    }
    
    this.getNext = function() {
        if (_startMonth < 11) _startMonth++;
        else {
            _startMonth = 0;
            _startYear++;
        }
        _widget.render();
    };
    
    this.getPrevious = function() {
        if (_startMonth > 0) _startMonth--;
        else {
            _startMonth = 11;
            _startYear--;
        }
        _widget.render();
    };
    
    function addRow(_table) {
        var _row;
        if (jmaki.MSIE) {
            _row = _table.insertRow(-1);
        } else {
            _row = document.createElement("tr");
            _table.appendChild(_row);
        }
        return _row;
    }
    
    function addCell(_row) {
        var _cell;
        if (jmaki.MSIE) {
            _cell = _row.insertCell(-1);
        } else {
            _cell = document.createElement("td");
            _row.appendChild(_cell);
        }
        return _cell;
    }
    
    function completeEdit(e) {
        if (!_widget.editing) return;
        _widget.editing = false;
        var _esrc;
        if (e && e.target) _esrc = e.target;
        else if (window.event) _esrc = window.event.srcElement;

        var _eid = _esrc.eid;
         _esrc.parentNode.eid = _eid;
        var events = _widget.events.get(_esrc.dateid);
        var event = events[_eid];
        event.label = _esrc.value;        
        var _name = document.createElement("div");
        _name.dateid = _esrc.dateid;
        _name.eid = _eid;        
        _name.innerHTML = event.label;
        _name.className = "jmk-calendar-entry";
        _name.onclick = showDetails;
        _esrc.parentNode.replaceChild(_name, _esrc);

        jmaki.publish(_widget.publish + "/save", {});
    }
    
    function completeDetailsNameEdit() {
        var _esrc = document.getElementById(wargs.uuid + "_details_name_edit");
        if (!_esrc) return;
        var _eid =  _widget.currentEvent.eid;
        var events = _widget.events.get(_widget.currentEvent.dateid);
        var event = events[_eid];    


         if (_widget.currentEvent) {
             _widget.currentEvent.innerHTML = _esrc.value;
         }
         event.label = _esrc.value;
         var _name = document.createElement("div");
         _name.className = "jmk-calendar-details-body-name";           
         _name.innerHTML = _esrc.value;
         _name.ondblclick = editEventDetailsName;
         _esrc.parentNode.replaceChild(_name,_esrc);
         jmaki.publish(_widget.publish + "/save", {});
    }    
    
    function completeDetailsEdit() {
        var _src = document.getElementById(wargs.uuid + "_details_edit");
        if (!_src) return;
        var _eid =  _widget.currentEvent.eid;
        var events = _widget.events.get(_widget.currentEvent.dateid);
        var event = events[_eid];
        event.details = _src.value;
        var _details = document.createElement("div");
        _details.className = "jmk-calendar-details-body-details";
        _details.innerHTML = _src.value;
        _details.ondblclick = editEventDetails;
        _src.parentNode.replaceChild(_details,_src);
        jmaki.publish(_widget.publish + "/save", {});
    }
    
    function editEventDetailsName(e) {
        var _src;
        if (e && e.target) _src = e.target;
        else if (window.event) _src = window.event.srcElement;
        var _p = _src.parentNode;
        var _in = document.createElement("input");
        _in.eid = _src.eid;
        _in.dateid = _src.dateid;
        _in.value = _src.innerHTML;
        var _div = document.createElement("div");
        _in.id=wargs.uuid + "_details_name_edit";
        _in.className = "jmk-calendar-edit";

        _in.onblur = completeDetailsNameEdit;
        _in.onkeypress = function(e) {
            var _kc;
            if (e && e.keyCode) _kc = e.keyCode;
            else if (window.event && window.event.keyCode)_kc = window.event.keyCode;
            if(_kc=='13') {
             completeDetailsNameEdit(e);
            }
        };
        _div.appendChild(_in);
        _p.replaceChild(_div,_src);
        _in.select();
        _in.focus();        
    }
        
    
    function editEventDetails(e) {
        var _src;
        if (e && e.target) _src = e.target;
        else if (window.event) _src = window.event.srcElement;
        var _p = _src.parentNode;
        _p.removeChild(_src);
        var _eid =  _widget.currentEvent.eid;
        var events = _widget.events.get(_widget.currentEvent.dateid);
        var event = events[_eid];      
        var _div = document.createElement("div");
        var _in = document.createElement("textarea");
        _in.className = "jmk-calendar-edit";
        _in.id = wargs.uuid + "_details_edit";
        if (event.details)_in.value = event.details;
        else _in.value = "Click to Edit";
        _in.onblur = completeDetailsEdit;
        _in.onkeypress = function(e) {
            var _kc;
            if (e && e.keyCode) _kc = e.keyCode;
            else if (window.event && window.event.keyCode)_kc = window.event.keyCode;
            if(_kc=='13') {
             completeDetailsEdit(e);
            }
        };
        _div.appendChild(_in);
        _p.appendChild(_div);
        _in.select();
        _in.focus();        
    }
    
    
    function addEvent(e) {
      
        var _src;
        if (e && e.target) _src = e.target;
        else if (window.event) _src = window.event.srcElement;
        if (!_src || !_src.date || _widget.editing) return;
        _widget.editing = true;
        var _div = document.createElement("div");
        var _in = document.createElement("input");
        var _eid = _src.date.id;
        _in.dateid = _eid;
        _in.className = "jmk-calendar-edit";
        _in.value = "New Event";
        _in.onblur = completeEdit;
        _in.onkeypress = function(e) {
            var _kc;
            if (e && e.keyCode) _kc = e.keyCode;
            else if (window.event && window.event.keyCode)_kc = window.event.keyCode;
            if(_kc=='13') {
                completeEdit(e);
            }
        };
        var events = _widget.events.get(_eid);
        if (events == null) {
          events = [];
          _widget.events.put(_eid, events);          
        }
        var event = jmaki.clone(_src.date);
        event.label = "New Event";
        _in.eid = events.length;
        events.push(event);
        _div.appendChild(_in);
        _src.appendChild(_div);
        jmaki.publish(_widget.publish + "/save", {});
        _in.select();
        _in.focus();   
    }
    
    function addEventNode(_event, _parent, _id){
        var _eNode = document.createElement("div");
        _eNode.className = "jmk-calendar-entry";           
        _eNode.innerHTML = _event.label;
        _eNode.onclick = showDetails;
        _eNode.eid = _id;
        _eNode.dateid = _event.id;        
        _parent.appendChild(_eNode);     
    }
    
    function hideDetails() {
       if (_widget.details != null) {
           _widget.details.style.display = "none";
           if (_widget.currentEvent)_widget.currentEvent.className ="jmk-calendar-entry";
           completeDetailsNameEdit();
           completeDetailsEdit();           
           _widget.currentEvent = null;
       }
    }
    
    function removeCurrentEvent() {
       if (_widget.details != null && _widget.currentEvent != null) {
           var _parent = _widget.currentEvent.parentNode;
           var _eid =  _widget.currentEvent.eid;
           var events = _widget.events.get(_widget.currentEvent.dateid);
           var event = events[_eid];
           events.splice(event.id,1);
           //rebuild event nodes           
           var cnodes = jmaki.getElementsByStyle("jmk-calendar-entry", _parent);       
           for (var i=0; i < cnodes.length; i++) {              
              cnodes[i].parentNode.removeChild(cnodes[i]);
           }
           //remove current           
           _widget.currentEvent.parentNode.removeChild(_widget.currentEvent);
           for (var j=0;j < events.length;j++) {
               addEventNode(events[j],_parent, j);
           }
           jmaki.publish(_widget.publish + "/save", {});
           hideDetails();
       }
    }
    
    function showDetails(e) {
        var _src;
        if (e && e.target) _src = e.target;
        else if (window.event) _src = window.event.srcElement;
        if (!_src || !_src.dateid) {alert("no date");return}
        if (_widget.currentEvent)_widget.currentEvent.className ="jmk-calendar-entry";
        _widget.currentEvent = _src;
        _src.className ="jmk-calendar-entry-selected";
   
        var _eid =  _widget.currentEvent.eid;
        var events = _widget.events.get(_widget.currentEvent.dateid);
        var event = events[_eid];
        
        var loc = jmaki.getPosition(_src);
        var _dim = jmaki.getDimensions(_src);
        if (_widget.details == null) {
            _widget.details = document.getElementById(wargs.uuid + "_details");
            _widget.detailsName = document.getElementById(wargs.uuid + "_details_name");
            _widget.detailsName.ondblclick = editEventDetailsName;
            _widget.detailsContent = document.getElementById(wargs.uuid + "_details_content");
            _widget.detailsContent.ondblclick = editEventDetails;
            _widget.detailsDone = document.getElementById(wargs.uuid + "_details_done");
            _widget.detailsDone.onclick = hideDetails;
            _widget.detailsClose = document.getElementById(wargs.uuid + "_details_close");
            _widget.detailsClose.onclick = hideDetails;
            _widget.detailsRemove = document.getElementById(wargs.uuid + "_details_remove");
            _widget.detailsRemove.onclick = removeCurrentEvent;
            document.body.appendChild(_widget.details);
        }
        _widget.detailsName.innerHTML = event.label;
        if (!event.details || event.details == '') {
            _widget.detailsContent.innerHTML = "Click to Edit";
        } else {
            _widget.detailsContent.innerHTML = event.details;
        }
        _widget.details.style.top = (loc.y - 50) + "px";
        _widget.details.style.left = (loc.x + _dim.w - 15)  + "px";
        _widget.details.style.display = "block";
    }
    
    function selectCell(e) {
        var _src;
        if (e && e.target) _src = e.target; 
        else if (window.event) _src = window.event.srcElement;        
        if (_widget.selected) {
            _widget.selected.className = "jmk-calendar-cell";
        }
        if (_src.className == "jmk-calendar-cell") {
            _widget.selected = _src;
            _widget.selected.className = "jmk-calendar-cell-selected";
        }
    }    

    this.render = function() {
        _widget.selected = null;
        _widget.container.innerHTML = "";
        var _fd = getFirstDay(_startMonth, _startYear);
        var _days = getNumberOfDays(_startMonth, _startYear);
        var _index = 1;
        _widget.table = document.createElement("table");
        var _mheader = addRow(_widget.table);
        var _prev = addCell(_mheader);
        var _prevLink = document.createElement("a");
        _prev.className = "jmk-calendar-nav";
        _prevLink.appendChild(document.createTextNode("<<"));
        _prevLink.onclick = _widget.getPrevious;
        _prev.appendChild(_prevLink);
        var _title = addCell(_mheader);
        _title.colSpan = "5";
        _title.className = "jmk-calendar-header-month";
        _title.innerHTML = _widget.months[_startMonth] +
                           " " + _startYear;
        var _next = addCell(_mheader);
        var _nextLink = document.createElement("a");
        _nextLink.appendChild(document.createTextNode(">>"));
        _next.className = "jmk-calendar-nav";
        _nextLink.onclick = _widget.getNext;
        _next.appendChild(_nextLink);
        _mheader.appendChild(_next);        
        
        var _header = addRow(_widget.table);
        
        for (var j=0; j < 7; j++) {
            var _c = addCell(_header);
            _c.className = "jmk-calendar-header-cell";
            _header.appendChild(_c);
            _c.innerHTML = _widget.days[j];
        }
        for (var i=0; i < 6; i++) {
            var _row = addRow(_widget.table);
            for (var ii=0; ii < 7; ii++) {
                var _cell = addCell(_row);
                if (i==0 && ii < _fd ||
                    _index > _days) {
                    _cell.className = "jmk-calendar-cell-disabled";
                } else {
                    _cell.className = "jmk-calendar-cell";
                    var _eid = _startYear + "_" +
                               _startMonth + "_" +
                               _index;                      
                    _cell.date = { id : _eid, month : _startMonth, day : _index, year : _startYear};                    
                    var _date = document.createElement("div");
                    _date.innerHTML = _index++;
                    _date.className = "jmk-calendar-cell-date";
                    _cell.appendChild(_date);
                    _cell.ondblclick = addEvent;
                    _cell.onclick = selectCell;
                    var events = _widget.events.get(_eid);
                    if (events) {
                        for (var k=0; k < events.length; k++) {
                            addEventNode(events[k],_cell,k);
                        }
                    }
                }   
            }
        }
        _widget.container.appendChild(_widget.table);
    };
    
    this.getValue = function() {
        var _data = [];
        var keys = _widget.events.keys();
        for (var i=0;i < keys.length;i++) {
            _data.push( { id : keys[i], value : _widget.events.get(keys[i]) } );
        }
        return _data; 
    };

    this.postLoad = function() {
        if (wargs.value) {          
            for (var i=0; i < wargs.value.length;i++) {
                _widget.events.put(wargs.value[i].id,wargs.value[i].value);
            }
        }
       _widget.render();
    };
};
