$(function(){
  $("a.remix").click(function(){ $("#contribution_body").focus(); })

  var preview_timer
  $("#idea_description").keyup(function(){
    $('#idea_preview_title').show();
    $('#idea_preview_title img').show();
    window.clearTimeout(preview_timer);
    preview_timer = setTimeout(load_preview, 2000);
  });

  function load_preview(){
    var params = $("form.new_idea").serialize();
    $.get($("#idea_preview").data("preview-url") + "?" + params, function(data) {
      $('#idea_preview').html(data); 
      $('#idea_preview_title img').hide();
    });
  }
});
