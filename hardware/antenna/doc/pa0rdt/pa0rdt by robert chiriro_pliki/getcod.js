<!--
function SSstoCk(cdom,nm){var _st;if (cdom && cdom!="") {return 1;} if (window.opera) {return 1;}if ( typeof(localStorage) == 'undefined' || typeof(sessionStorage) == 'undefined') {return 1;}if (!(_st = localStorage)) {return 1;}try {localStorage.setItem('sstat', '1');localStorage.removeItem('sstat');return 0;} catch (error) {return 1;}return 0;}
function cCk(nm,vl,mn){var ex=cdm="";var okc=0;var _sscdom="";var saf=0;try{if (navigator.vendor != null && navigator.vendor.match(/Apple/) && navigator.userAgent.indexOf('Safari') != -1) {saf=1;}}catch(e_r){}if (SSstoCk(_sscdom,nm)) {if (_sscdom && _sscdom!="") { cdm=" domain="+_sscdom; if (mn) {document.cookie=nm+"=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=/;";}}if (mn) {var d=new Date();d.setTime(d.getTime()+(mn*6*1000)); ex="; expires="+d.toGMTString();} document.cookie=nm+"="+vl+ex+"; path=/;"+cdm+"";}else{try{if (saf) {sessionStorage.setItem(nm,vl);localStorage.setItem(nm,vl);}else{if (mn) { _st = localStorage; }else{ _st = sessionStorage; }if (_st) { _st.setItem(nm,vl);}}}catch(e_r){}}}
function rCk(nm){ var fcoo=null;var nEQ=nm+"=";var ca=document.cookie.split(';'); var ses;var saf=0;try{if (navigator.vendor != null && navigator.vendor.match(/Apple/) && navigator.userAgent.indexOf('Safari') != -1) {saf=1;}}catch(e_r){} if ((nm.indexOf("SV_")>-1) || (nm.indexOf("SSID_")>-1)) {ses=1;}for(var i=0;i<ca.length;i++){var c=ca[i];while(c.charAt(0)==' ') c=c.substring(1,c.length); if(c.indexOf(nEQ) == 0){ fcoo=c.substring(nEQ.length,c.length);}}if (SSstoCk("",nm)) {return(fcoo);}else{ if (saf) {if ((sessionStorage.getItem(nm)==null) && (ses!=1)) {return(localStorage.getItem(nm)); }else{return(sessionStorage.getItem(nm));}}else{if (ses) { if (fcoo) {document.cookie=nm+"=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=/;";return(fcoo);} _sstore = sessionStorage; }else{if (fcoo || fcoo=="") {document.cookie=nm+"=; expires=Thu, 01-Jan-70 00:00:01 GMT; path=/;";return(fcoo);} _sstore = localStorage;}return(_sstore.getItem(nm)); }}}
function ud(){var u=""+o_.getTime();return(u);}
function udtb(){var u=""+otb_.getTime();return(u);}
function sswk_(tnow){var w = Math.floor( ( (tnow / 86400000 ) - 4) / 7);return w}
function _ssvoid(){return;}
function sseC(d) {if (typeof(encodeURIComponent) == 'function') {return encodeURIComponent(d);} else {return escape(d);}}
function sseXr(a,b){var rt="";for(var i=0;i<a.length;i++){rt+=String.fromCharCode(b^a.charCodeAt(i));}return(rt);}
function ss12m(){ var th_=("https:" == document.location.protocol) ? "https://" :"http://";var ca=";7f;";var id="16452155";var bk;var catg=""; var base=16;var s="b1/rihoxru`u/bnl.kry10."; if (ca) { var cad = ca.split(';');for(var i=0;i<cad.length;i++){if (cad[i]) {catg+=""+parseInt(cad[i],base);if (i<cad.length && cad[i+1]) {catg+=",";}}}}bk=sseXr(s,1);var mble_=document.createElement('script'); mble_.type='text/javascript'; mble_.id="_12mblejs"; mble_.async = true;mble_.src=th_+bk+"4/"+id+"/"+catg; document.getElementsByTagName('head')[0].appendChild(mble_);}
function ssxl(xl_){var i_=new Image(1,1);i_.src="http://s1.shinystat.com/cgi-bin/shinystat.cgi?TLR=1&USER="+us_+"&"+xl_+"&RM="+Math.round(Math.random()*2147483647);for(i=0;i<100000;i++);i_.onload=function(){return;}}
function stfCk(ck,v){var ca=_pt_=_iof_=can="";var _f_=uv_=uvw=1;var _tf_=ud();var _t_=_bu_=0;_ort=new Date();_ort.setTime(o_.getTime()+(1000*ssoffset_));if (!v) v=0;if (ck) {ca = ck.split('%G');_f_=parseInt(ca[2],10);_tf_=parseInt(ca[3],10);if (otb_.getTime()-parseInt(v,10)>st_){_ot=new Date();_ot.setTime(parseInt(_tf_,10)+(1000*ssoffset_)); if(_ort.getUTCMonth()==_ot.getUTCMonth()){_f_++;}else{_f_=1;_tf_=ud();}}_t_=ca[0];_pt_=ca[1];_bu_=ca[4];if (ca[5]) can=ca[5];} _ot=new Date();_ot.setTime(parseInt(_bu_,10)+(1000*ssoffset_));if ((_ort.getUTCDay()==_ot.getUTCDay())&&(_ort.getUTCMonth()==_ot.getUTCMonth())&&(_ort.getUTCFullYear()==_ot.getUTCFullYear())) uv_=0;if (sswk_(_ort) == sswk_(_ot)) uvw=0;_iof_=""+_t_+"%G"+_pt_+"%G"+_f_+"%G"+_tf_+"%G"+ud()+"%G";tf_="&FV="+_f_+"&UV="+uv_+"&US="+uvw;return(_iof_);}
function SSsdk(e){return("");} us_="chiriocom";c_="";l_=""+screen.width;y_=""+screen.height;v_=navigator;d_=document.referrer;var o_=new Date();var otb_=new Date();vu_="&VUT=-1";n_="";r_=""+escape(d_);tf_="";var st_=1800000;
if (self != top){try {r_=""+escape(parent.document.referrer)+"&FHR="+escape(d_);}catch(e_r){}}
ssid_="&SSID=";
o_.setTime(1000*1437677807); 
var ssoffset_=7200;
rssid_=Math.round(Math.random()*ud());
k_="&CK="+(v_.cookieEnabled?"Y":"N");
j_="&JV="+(v_.javaEnabled()?"Y":"N");
hr_="&HR="+escape(window.location.href);
if(v_.appName!="Netscape"){c_=screen.colorDepth}
else{c_=screen.pixelDepth}
if (sv_ = rCk("SV_"+us_)){
vu_="&VUT="+(o_.getTime()-parseInt(sv_,10));
if ((o_.getTime()-parseInt(sv_,10))>1800000) {cCk("SSID_"+us_,rssid_);ssid_+=rssid_;}
else{ssid_+=rCk("SSID_"+us_);}}
else{cCk("SSID_"+us_,rssid_);ssid_+=rssid_;}
cCk("SV_"+us_,ud());  
if (sn_=rCk("SN_"+us_)){ if (sn_=="ok") {sn_="";}cCk("SN_"+us_,stfCk(sn_,sv_,""),2592000);}else{n_="&NUT=y";cCk("SN_"+us_,stfCk("",sv_,""),2592000);}
var ssqS_="http://s1.shinystat.com/cgi-bin/shinystat.cgi?USER="+us_+"&REFER="+r_+"&COLOR="+c_+"&SIZE="+l_+"&RES="+l_+"X"+y_+k_+hr_+j_+vu_+ssid_+n_+SSsdk(sv_)+tf_+"&JS=Y&VJS=4014";
if (ssqS_.indexOf("NODW=yes")>-1){var ig_=new Image(1,1);ig_.src=ssqS_+"&RM="+Math.round(Math.random()*2147483647);ig_.onload=function(){_ssvoid();}}
else{document.write("<a href=\"http://s1.shinystat.com/cgi-bin/shinystatv.cgi?USER="+us_+"&NH=1\" Target=\"_new\"><img src=\""+ssqS_+"\" border=\"0\"/></a>"); }
//if (vu_.indexOf("-1")>-1) ss12m();
//-->
