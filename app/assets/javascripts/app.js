$(function(){ $("a.submit").click(function(e){ e.stopPropagation(); $(e.target).closest("form").submit(); return false; }); });
