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
    loadShareButtons();
  });
  
  loadShareButtons();

  function loadShareButtons(){
    $("a.share").click(function(event, target){
      event.preventDefault();
      var obj = $(event.target);
      var url = null;

      url = obj.attr('href');
      if (url == undefined) {
        url = obj.parent('a').attr('href');
      }

      window.open(url, '', 'width=600,height=300');
    });
  }
});
