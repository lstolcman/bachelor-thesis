/*******************************************************************************

	CSS on Sails Framework
	Title: LINEAR technology
	Author: XHTMLized (http://www.xhtmlized.com/)
	Date: March 2011
	Modified By: Scott June 2011 
	(moved window load script to evenUp function so it could be used elsewhere & added reset to height:auto)

*******************************************************************************/

function bodyResize(){
	var windowHeight = $(window).height();
	var bodyHeight = $('body').outerHeight();
	//console.log(windowHeight, bodyHeight);
	if ( windowHeight > bodyHeight ) {
		$('body').css({'height': windowHeight-37+'px'});
	}
	if ( windowHeight < bodyHeight ) {
		$('body').css({'height': 'auto'});
	}
};

function evenUp(){
	$('.sub #sidebar .box:last-child').css({'height': 'auto'});
    $('.sub #content').css({'height': 'auto'});
	var contentHeight = $('.sub #content').outerHeight();
	var sidebarHeight = $('.sub #sidebar').outerHeight();
	var sidebarBoxHeight = $('.sub #sidebar .box:last-child').outerHeight();
	var sidebarDifference = sidebarHeight - sidebarBoxHeight;
	if ( contentHeight > sidebarHeight ) {
		$('.sub #sidebar .box:last-child').css({'height': contentHeight - sidebarDifference + 7 + 'px'});
	}
	if ( contentHeight < sidebarHeight ) {
		$('.sub #content').css({'height': sidebarHeight - 40 + 'px'});
	}
	
	/*if($('.home').length){
		$('.content-wrapper #sidebar .box:last-child').css({'height': 'auto'});
		$('.content-wrapper #content').css({'height': 'auto'});
		var contentHeight = $('.content-wrapper #content').outerHeight();
		var sidebarHeight = $('.content-wrapper #sidebar').outerHeight();
		var sidebarBoxHeight = $('.content-wrapper #sidebar .box:last-child').outerHeight();
		var sidebarDifference = sidebarHeight - sidebarBoxHeight;
		if ( contentHeight > sidebarHeight ) {
			//$('.content-wrapper #sidebar .box:last-child').css({'height': contentHeight - sidebarDifference + 7 + 'px'});
		}
		if ( contentHeight < sidebarHeight ) {
			$('.content-wrapper #content .follow-us').css({'height': sidebarHeight - contentHeight + 25 + 'px'});
			$('.content-wrapper #content .column-left .box').css({'height': sidebarHeight - contentHeight + 335 + 'px'});
		}		
	}*/
	
};

function myAction(a,b,c,d){
	b = b || '';
	c = c || '';
	d = d || '';	
	$.post('/mylinear/action.php',{ t: a, l: b, q: c},function(data){
		if(d){window.location.href = d;}
	});
};

function gapv(p){
	ga('send', 'pageview', p);
}

$(document).ready(function() {
	
	$('a.doclink').click(function(){
		ga('send', 'pageview', $(this).attr('href').replace(/.+?m/, ''));
		//urchinTracker(this.href.replace(/.+?m/, ''));
		});
		
	$('a.opennext').click(function(){
		$(this).next().toggle();
		return false;
	});

	$('#header form fieldset input[type="text"]').each(function() {
		var defaultValue = this.value;
		$(this).focus(function() {
			if(this.value == defaultValue) {
				this.value = '';
			}
		});
		$(this).blur(function() {
			if(this.value == '') {
				this.value = defaultValue;
			}
		});
	});
	
	$( ".tabbed" ).tabs().css({
		'min-height': '400px'
	});

	//$('#header form fieldset input[type="text"]:first').focus();
	
	//
	if($('.scroll-pane').length > 0){
		$('.scroll-pane').jScrollPane({showArrows: true});
	}
	//
    if($('.home select').length > 0){
		$('.home select').selectmenu();
	}
	
	//Document Help Pop Up
	$(".doc_help").css("cursor", "help").click(
		function(event){
			if($("#doc_shelp").length){			
				$("#doc_help").dialog("destroy");
			}
			$('<div id="doc_help" class="bulls" title="'+$(this).attr('title')+'">' + $(this).next().html() + '</div>').dialog({
				position: {
					my: "center center",
					at: "right",
					of: event,
					collision: "fit"
				},
				width:450
			});
			return false;  
		}
	);

	//Software Instructions Pop Up
	$(".doc_software_help").css("cursor", "help").click(
		function(event){
			if($("#doc_software_dialog").length){
				$("#doc_software_dialog").dialog("destroy");
			}
			$('<div id="doc_software_dialog" class="bulls" title="'+$("#software_"+ $(this).attr('data-linkid') +"_info").attr('title')+'">' + $("#software_"+ $(this).attr('data-linkid')+"_info").html() + '</div>').dialog({
				position: {
					my: "center center",
					at: "right",
					of: event,
					collision: "fit"
				},
				width:450
			});
			return false;  
		}
	);
	
	
	//Japanese Document Message Pop Up
	$(".japanese_documents").css("cursor", "help").hover(
		function(event){
			$("#doc_help").dialog("destroy");
			$("#doc_help").html($("#ajd").html()).attr("title",$("#ajd").attr("title"));
			var position = $(this).position();
			$("#doc_help").dialog({
				position: {
					my: "top",
					at: "bottom",
					of: "#notice_icon",
					collision: "fit"
				},
				width:450
			});
			return false;  
		},
		function(event){$("#doc_help").dialog("destroy");}
	);

	//Switch to Different Language or Mobile
	var loc = window.location.href
	if($('.Chinese_link').length > 0){	
		$('.Chinese_link').attr('href',loc.replace(/linear.com/i, "linear.com.cn").replace(/linear-tech.co.jp/i, "linear.com.cn").replace(/https/i, "http"));
	}
	if($('.English_link').length > 0){	
		$('.English_link').attr('href',loc.replace(/linear.com.cn/i, "linear.com").replace(/linear-tech.co.jp/i, "linear.com").replace(/https/i, "http"));
	}
	if($('.Japanese_link').length > 0){	
		$('.Japanese_link').attr('href',loc.replace(/linear.com.cn/i, "linear-tech.co.jp").replace(/linear.com/i, "linear-tech.co.jp").replace(/https/i, "http"));
	}
	if($('.mobile_link').length > 0){	
		$('.mobile_link').attr('href',loc.replace(/www./i, "m.").replace(/https/i, "http"));
	}
	
	if (($.browser.msie) && ($.browser.version == "8.0")){

		// CSS3PIE
		var CSS3PIE_selectors = [
			'.users-menu',
			'.home #content .nav li ul',
			'.box h2',
			'.box',
			'#navigation',
			'#navigation li a',
			'#content',
			'#header'
		];
		$( CSS3PIE_selectors.join(',') ).each(function() {
			PIE.attach(this);
		});
	}

	//
	if (($.browser.msie) && ($.browser.version == "8.0")){
	}

	//
	if (($.browser.msie) && ($.browser.version == "7.0")){
	}

});

if (($.browser.mozilla) && (parseInt($.browser.version) <= 3)){
	var link = $("<link>");
	link.attr({type: 'text/css',rel: 'stylesheet',href: '/_ui/css/ie_eng.css'});
	$("head").append(link); 
}

$(window).load(function() {

	//
	evenUp();
	bodyResize();

});

$(window).resize(function() {

	bodyResize();

});
