var ready = function(){
  $(".autocomplete-result").hide();

  $("#keyword").on("input", function(){
    var keyword = $(this).val();
    var domain = "http://localhost:3000/songs?keyword="+keyword+"&autocomplete=true"
    if(keyword != ""){
      $.getScript(domain);
      $(".autocomplete-result").show();
    }
    else
      $(".autocomplete-result").hide();
  });

  $(document).on("click", function(){
    $(".autocomplete-result").hide();
  })
};

$(document).on("ready", ready);
$(document).on('page:load', ready);