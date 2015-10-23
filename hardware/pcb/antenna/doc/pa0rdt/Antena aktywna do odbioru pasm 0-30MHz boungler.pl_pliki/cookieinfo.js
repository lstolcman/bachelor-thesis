window.onload = function(){	

	function createCookie(name, value, days) {
		var expires = '',
			date = new Date();
		if (days) {
			date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
			expires = '; expires=' + date.toGMTString();
		}
		document.cookie = name + '=' + value + expires + '; path=/';
	}
 
	function readCookie(name) {
		var cookies = document.cookie.split(';'),
			length = cookies.length,
			i,
			cookie,
			nameEQ = name + '=';
		for (i = 0; i < length; i += 1) {
			cookie = cookies[i];
			while (cookie.charAt(0) === ' ') {
				cookie = cookie.substring(1, cookie.length);
			}
			if (cookie.indexOf(nameEQ) === 0) {
				return cookie.substring(nameEQ.length, cookie.length);
			}
		}
		return null;
	}
 
	function eraseCookie(name) {
		createCookie(name, '', -1);
	}

    function addEvent( obj, type, fn ) {
      if ( obj.attachEvent ) {
        obj['e'+type+fn] = fn;
        obj[type+fn] = function(){obj['e'+type+fn]( window.event );}
        obj.attachEvent( 'on'+type, obj[type+fn] );
      } else
        obj.addEventListener( type, fn, false );
    }
	
    function removeEvent( obj, type, fn ) {
      if ( obj.detachEvent ) {
        obj.detachEvent( 'on'+type, obj[type+fn] );
        obj[type+fn] = null;
      } else
        obj.removeEventListener( type, fn, false );
    }		
		
	if( 1 == readCookie('privacyCookie') ){
		return;		
	}
	
	var html = '<div id="jq_box_policies"><br><strong>Zgodnie z nowelizacją ustawy - Prawo telekomunikacyjne:</strong><br> Informujemy iż korzystanie z niniejszej strony internetowej oznacza zgodę <br>na wykorzystywanie plików cookie, niezbędnych do jej prawidłowego działania.<br><br><a style="color: rgb(40, 90, 114); " id="jq_policies" href="#"> Nie pokazuj więcej tego powiadomienia</a></div>';
	
	var htmlObject = document.createElement('div');
	htmlObject.id = "jq_box_wraper";
	htmlObject.setAttribute("style", "position: fixed; right: 0; padding-bottom: 40px; text-align: center; margin: 0 auto; display: block; width: 450px; bottom: 0; border: 1px solid #000; background-color: #FFF"); 
	htmlObject.innerHTML = html;
	
	document.body.appendChild(htmlObject);
	
	addEvent(document.getElementById('jq_policies'), 'click', function(e){	
		var elem = document.getElementById('jq_box_policies');
		elem.parentNode.parentNode.removeChild(htmlObject);
		createCookie('privacyCookie', 1, 1000);
	});	
	
}