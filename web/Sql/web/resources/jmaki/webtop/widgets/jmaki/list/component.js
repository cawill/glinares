/* Copyright 2005 Sun Microsystems, Inc. All rights reserved.
   You may not modify, use, reproduce, or distribute this software
   except in compliance with the terms of the License at:
   http://developer.sun.com/berkeley_license.html
   
   $Id: component.js,v 1.1 2007/01/19 01:16:24 ludo Exp $
*/
// define the namespaces
jmaki.namespace("jmaki.widgets.jmaki.list");

/**
 * @constructor
*/
jmaki.widgets.jmaki.list.Widget = function(wargs) {
	var uuid = wargs.uuid;
	var service = wargs.service;
	var topic= "/jmaki/list";

	if (wargs.args && wargs.args.topic) {
	    topic = wargs.args.topic;
	    jmaki.log("jMaki list: widget uses deprecated topic property. Use publish instead.");
	}
	if (wargs.publish) {
	    topic= wargs.publish;
	}
	
	this.submitData = function() {
            var list = document.getElementById(uuid + "_list");
            var olist = document.getElementById(uuid + "_olist");
	    if (!olist) {
		var olist = document.createElement("ol");
            	list.appendChild(olist);
	    }
            var entryField = document.getElementById(uuid + "_entryField");
            
            var listItem = document.createElement("li");
            listItem.appendChild(document.createTextNode(entryField.value));
            olist.appendChild(listItem);

            listItem.onclick=  function() {listItem.parentNode.removeChild(listItem);};
      
 
        }	
}
