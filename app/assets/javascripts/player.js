var timer;
var songs;
var total;
var current;
var repeat_album;
var repeat_all;
var repeat_one;
var domain;
var audio;
var volume;

function loadLocalStorage() {
  // Check browser support
  if (typeof(Storage) !== "undefined") {
    if(localStorage.getItem("repeat_album") === null) {
      localStorage.repeat_album = true;
      localStorage.repeat_one = false;
      localStorage.repeat_all = false;
      localStorage.volume = 0.5;
    }
    repeat_album = (localStorage.repeat_album == "true") // convert string to boolean
    repeat_one = (localStorage.repeat_one == "true")
    repeat_all = (localStorage.repeat_all == "true")
    volume = parseFloat(localStorage.volume);
  } else {
    console.log("Sorry, your browser does not support Web Storage...");
  }
}

function loadTrackRepeatStatus() {
  if(repeat_album){
    $(".btn-repeat-song").css({"background-image": "url(/assets/icon/repeat_album.png)"});
    $(".btn-repeat-song").attr("title", "Repeat album");
  }else if(repeat_one) {
    $(".btn-repeat-song").css({"background-image": "url(/assets/icon/repeat_one.png)"});
    $(".btn-repeat-song").attr("title", "Repeat one");
  }else if(repeat_all) {
    $(".btn-repeat-song").css({"background-image": "url(/assets/icon/repeat_all.png)"});
    $(".btn-repeat-song").attr("title", "Repeat album once");
  }
}

function scrollTo(position) {
  $(".playlist").scrollTop(position);
}

function scrollNext(id) {
  var top = $("#song-"+id).offset().top - $(".playlist").offset().top;
  if(top >= 150) {
    if(id == total - 1) {
      scrollTo(0);
    }else {
      scrollTo(200);
    }
  }
}

function scrollPrev(id) {
  var top = $("#song-"+id).offset().top - $(".playlist").offset().top;
  if(top < 38) {
    if(id == 0) {
      scrollTo($(".playlist")[0].scrollHeight);
    }else {
      scrollTo(-200);
    }
  }
}

function checkPlayerType(total) {
  if(total == 1) {
    $(".btn-next").hide();
    $(".btn-prev").hide();
  }
}

function loadSong(id) {
  var playlist = $("#song-"+id);
  var song_id = playlist.data("id");
  var url = playlist.data("url");
  var artist = playlist.data("artist");
  var kh_title = playlist.data("khtitle");
  var play_number = playlist.attr("data-play-number");
  var lyric = playlist.data("lyric");
  var promotion_text = "";
  var bg_image = playlist.data("bg-image");
  var promotion_image = playlist.data("promotion-image");
  var promotion_link = playlist.data("promotion-link")
  clearInterval(timer);

  audio.pause();
  audio.setSrc(url);
  audio.play();

  $(".audio-player").css({"background-image": "url("+ bg_image +")"});

  if(!playlist.hasClass("active-playing")) {
    $(".table-songs .active-playing").removeClass();
    playlist.addClass("active-playing");
  }

  $(".audio-title").html(kh_title);
  $(".audio-artist").html(artist);
  $(".audio-play-number").html("<span class='glyphicon glyphicon-headphones'></span> "
    + Number(play_number).toLocaleString('en'));
  playlist.attr("data-play-number", parseInt(play_number) + 1);

  if(lyric === "")
    $(".lyric").html("No Lyric");
  else
    $(".lyric").html(lyric);

  // $(".bg-img").css({"display": "none", "background": "linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url(""+domain+"/assets/1.jpg")"});
  // $(".bg-img").fadeIn(600);

  if(promotion_image === ""){
    $(".promotion-img").hide();
    $(".btn-close").hide();
    $(".btn-show-promotion").hide();
  }else{
    $(".promotion-img").show();
    $(".promotion-img").css({"background-image": "url("+ promotion_image +")"}).html("<span class='label label-primary timer'>10s</span>");
    $(".promotion-img").show();
    $(".btn-close").show();
    $(".btn-show-promotion").hide();

    var sec = 10;
    timer = setInterval(function(){
      $(".timer").html(--sec+"s");
      if (sec == 0) {
        clearInterval(timer);
        $(".promotion-img").fadeOut(300);
        $(".btn-close").hide();
        $(".btn-show-promotion").show();
      }
    }, 1000);

    $(".promotion-img").on("click", function(){
      if(promotion_link !== "") {
        window.open(promotion_link, '_blank');
      }
    });
  }

  $.get( "/update_number/play/"+song_id);
}

$(document).ready(function(){

  if($(".player").length > 0){
    loadLocalStorage();
    loadTrackRepeatStatus();

    audio = new MediaElementPlayer("#audio-player");
    audio.setVolume(volume);

    loadSong(0);

    total = parseInt($(".audio-player").data("total"));
    current = 0;

    checkPlayerType(total);

    $(".row-song").click(function(){
      current = parseInt($(this).index());
      loadSong(current);
    });

    $("#audio-player").bind("ended", function(e) {
      if(repeat_one){
        loadSong(current);
      }else if(current < total - 1 || repeat_album)
        $(".btn-next").trigger("click");
      else {
        audio.play();
        audio.pause();
      }
    });

    $("#audio-player").bind("volumechange", function(e) {
      localStorage.volume = e.target.volume;
    });

    $(".btn-next").on("click", function(){
      scrollNext(current);
      if(current < total - 1)
        current++;
      else
        current = 0;
      loadSong(current);
    });

    $(".btn-prev").on("click", function(){
      scrollPrev(current);
      if(current > 0)
        current--;
      else
        current = total - 1;
      loadSong(current);
    });

    $(".btn-close").on("click", function(){
      $(".promotion-img").fadeOut(300);
      $(this).hide();
      $(".btn-show-promotion").show();
      clearInterval(timer);
    });

    $(".btn-show-promotion").on("click", function(){
      $(".promotion-img").fadeIn(300);
      $(".btn-close").show();
      $(this).hide();
      clearInterval(timer);
      $(".timer").html("");
    });

    $(".btn-repeat-song").on("click", function(){
      if(repeat_album) {
        $(this).css({"background-image": "url(/assets/icon/repeat_one.png)"});
        $(this).attr("title", "Repeat one");
        repeat_one = true;
        repeat_album = false;
        repeat_all = false;
        localStorage.repeat_album = false;
        localStorage.repeat_one = true;
        localStorage.repeat_all = false;
      }else if(repeat_one) {
        $(this).css({"background-image": "url(/assets/icon/repeat_all.png)"});
        $(this).attr("title", "Repeat album once");
        repeat_one = false;
        repeat_album = false;
        repeat_all = true;
        localStorage.repeat_album = false;
        localStorage.repeat_one = false;
        localStorage.repeat_all = true;
      }else if(repeat_all) {
        $(this).css({"background-image": "url(/assets/icon/repeat_album.png)"});
        $(this).attr("title", "Repeat album");
        repeat_one = false;
        repeat_album = true;
        repeat_all = false;
        localStorage.repeat_album = true;
        localStorage.repeat_one = false;
        localStorage.repeat_all = false;
      }
    });

    $(".btn-download").on("click", function(){
      song_id = $(this).parents("tr").data("id");
      $.get( "/update_number/download/"+song_id);
    });
  }
});
