var _select = function(e, ui) {
  $(".search-bar").val(ui.item.kh_title);
  return false;
}

var ui = function(ul, item) {
  var markup = [
    '<a href="/songs/'+ item.id +'"><span class="img">',
      '<img src="' + item.image + '" />',
    '</span>',
    '<span class="title">' + item.kh_title + '</span>',
    '<span class="album">' + item.album.kh_name + '</span></a>',
    '<span class="artist">' + item.get_artist_list + '</span>'
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}

$(document).ready(function(){
  $(".search-bar").autocomplete({
    source: "/search",
    appendTo: ".autocomplete-search-results",
    select: _select,
    focus: _select
  })
  .keydown(function (e) {
  if (e.which == 13) {
    $(".form-search").submit();
      return false;
    }
  })
  .autocomplete('instance')._renderItem = ui;


  $(".search-bar").keypress(function (e) {
  if (e.which == 13) {
    $(".form-search").submit();
    return false;
  }
});

});
