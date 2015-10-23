// SpiceFuse AJAX ShoutBox for MyBB
// (c) Asad Niazi, www.spicefuse.com!
//
// Code is copyrighted and does not belong to public domain.
// Copying or reusing in different forms/softwares isn't allowed.
//

var ShoutBox = {
	refreshInterval: 60,
	lastID: 0,
	totalEntries: 0,
	firstRun: 1,
	MaxEntries: 5,
	DataStore: new Array(),
	lang: ['Posting!', 'Shout now...', 'Loading...', 'Flood check! Please try again in <interval> seconds.'],


	showShouts: function() {
		setTimeout("ShoutBox.showShouts();", ShoutBox.refreshInterval * 1000);
		if (typeof Ajax == 'object') {
			new Ajax.Request('xmlhttp.php?action=show_shouts&last_id='+ShoutBox.lastID, {method: 'get', onComplete: function(request) { ShoutBox.shoutsLoaded(request); } });
		}
	},

	
	shoutsLoaded: function(request) {
		
		var theHTML = "";
		var curData = "";
		var data = request.responseText.split('^--^');
		var theID = parseInt(data[0]);
		var theEntries = parseInt(data[1]);

		if (theID <= ShoutBox.lastID) {
			return;
		}

		// add to data store now...
		curData = data[2].split("\r\n");

		// only 1 message?
		if (curData.length == 1) 
		{
			length = ShoutBox.DataStore.length;
			ShoutBox.DataStore[ length ] = curData[0];
		} 
		else 
		{
			// hush, lots of em
			var collectData = "";
			var length = 0;
			for (var i = curData.length; i >= 0; i--) 
			{
				if (curData[i] != "" && curData[i] != undefined) {
					length = ShoutBox.DataStore.length;
					ShoutBox.DataStore[ length ] = curData[i];
				}	
			}
		}

		ShoutBox.lastID = theID;
		ShoutBox.totalEntries += theEntries;

		if (ShoutBox.firstRun == 1) {
			theHTML = data[2];
			ShoutBox.firstRun = 0;
		} else {

			// the data is more than the limit? hard luck here then... just get it from datastore
			if ((theEntries + ShoutBox.totalEntries) > ShoutBox.MaxEntries) {
				for (var j=0, i = ShoutBox.DataStore.length-1; j < ShoutBox.MaxEntries; i--, j++) {
					theHTML += ShoutBox.DataStore[i];
				}

				ShoutBox.totalEntries = ShoutBox.MaxEntries;

			} else {
				theHTML = data[2] + $("shoutbox_data").innerHTML;
			}

		}

		$("shoutbox_data").innerHTML = theHTML;

		// clean up DataStore
		ShoutBox.cleanDataStore();
	},

	postShout: function() {
		message = $("shout_data").value;
		if (message == "") {
			return false;
		}

		$("shouting-status").value = ShoutBox.lang[0];

		// delete older than
		var found = message.match(/^\/delete\s{1,}(all|older than|newer than)($|\s{1,}([0-9]+\-[0-9]+\-[0-9]+)|\s{1,}[0-9]+)/i);
		if (found) {
			var msgConfirm = (found[1] == 'all' ? 'Do you want to delete all shouts?' : 'Do you really want to delete shouts ' + found[1] + ' ' + found[2] + '?');
			if (!confirm(msgConfirm)) {
				$("shouting-status").value = ShoutBox.lang[1];
				return;
			}
		}

		postData = "shout_data="+encodeURIComponent(message).replace(/\+/g, "%2B");
		new Ajax.Request('xmlhttp.php?action=add_shout', {method: 'post', postBody: postData, onComplete: function(request) { ShoutBox.postedShout(request); }});
	},

	postedShout: function(request) {
		
		if (request.responseText == 'deleted') {
			ShoutBox.firstRun = 1;
			ShoutBox.lastID = 0;
			alert("Shouts deleted as requested.");
		}
		else if (request.responseText.indexOf('flood') != -1) {
			var split = new Array();
			split = request.responseText.split('|');			
			var interval = split[1]; 
			
			alert(ShoutBox.lang[3].replace('<interval>', interval));
		}
		else if (request.responseText.indexOf("success") == -1) {
			alert(ShoutBox.lang[4]);
		}

		$("shouting-status").value = ShoutBox.lang[1];
		ShoutBox.showShouts();
	},

	deleteShout: function(id, type) {
		if (type == 1) {
			$("shoutbox_data").innerHTML = ShoutBox.lang[2];
		}

		new Ajax.Request('xmlhttp.php?action=delete_shout&id='+id, {method: 'get', onComplete: function(request) { ShoutBox.deletedShout(request, id, type); } });
	},

	deletedShout: function(request, id, type) {
		if (request.responseText.indexOf("success") == -1) {
			alert("Couldn't delete shout... Try again!");
		} else if (type == 2) {
			alert("Shout deleted..");
		}

		if (type == 1) {
			ShoutBox.DataStore = new Array();
			ShoutBox.lastID = 0;
			ShoutBox.showShouts();
		} else {
			try {
				$("shout-"+id).style.display = "none";
			} catch (e) { 
				$("shout-"+id).style.display = "hidden";
			}
		}

	},

	cleanDataStore: function() {
		if (ShoutBox.DataStore.length > ShoutBox.MaxEntries) {
			for (var i = (ShoutBox.DataStore.length - ShoutBox.MaxEntries); i > 0; i--) {
				ShoutBox.DataStore[i] = "";
			}
		}
	},

	disableShout: function() {
		try { 
			$("shouting-status").disabled = true;
		} catch (e) {
			$("shouting-status").readonly = true;
		}
	}
 };