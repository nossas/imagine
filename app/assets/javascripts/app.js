$(function(){ 
  $("a.submit").click(function(e){ e.stopPropagation(); $(e.target).closest("form").submit(); return false; }); 
  $(".menu_mobile a.icon-list").click(function(e){ 
    $(".menu_mobile .links").toggle(); 
    $(e.target).toggleClass("selected");
  });
});
