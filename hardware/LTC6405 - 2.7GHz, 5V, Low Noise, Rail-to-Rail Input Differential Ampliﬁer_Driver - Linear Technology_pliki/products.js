$(function(){
   //Show Multiple Breadcrumbs 
	if($('.extra').length){
  		 $('.show-extra').bind('click', function(e){
    		 $('.extra').toggle();
 		});
 	  $(".tools").hover(function(){$('.show-extra').show();},function(){$('.show-extra').hide();});
	}
  
   $('.nav a').bind('click', function(e){
     if($(this).attr('href').indexOf('#') === 0){
     window.location.hash = $(this).attr('href');    
     e.preventDefault();
     }
  });  
  
  //Watch for hash change
  $(window).bind('hashchange', function(e){
    showTab();
    e.preventDefault();
  });
  showTab();
});
  
function showTab(){
     //Hide all tab sections by defualt
     $('.tab-section').hide();
     //We will show the overview section if no valid hash exists
     h=window.location.hash
     h=(h.length > 1)?h.substr(1):'overview';
     if($('.tab-'+h).length > 0){//Is there a matching tab section?
      $('.tab-'+h).show(); 
      $('.nav li').removeClass('active');
      $('#menu-'+h).addClass('active');
     }else{
       window.location.hash = 'overview';    
     }    
     evenUp();
     bodyResize();  
}

function showAllFeatured(){
     //Show/Hide more featured div
     $('#more_featured').toggle();	
     evenUp();
     bodyResize();  	
}
