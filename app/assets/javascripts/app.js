$(function(){ 
  $("a.submit").click(function(e){ e.stopPropagation(); $(e.target).closest("form").submit(); return false; }); 
  $(".menu_mobile a.icon-list").click(function(e){ 
    $(".menu_mobile .links").toggle(); 
    $(e.target).toggleClass("selected");
  });

  $('a[rel*=facebox]').facebox()
  $(document.location.hash + "_btn").click();
  $(document).bind('reveal.facebox', function() {
    FB.XFBML.parse();
    $.getScript('http://platform.twitter.com/widgets.js');
    $("form.new_update").enableClientSideValidations();
  });
});
