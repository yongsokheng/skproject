$(document).on("ready", function(){
  if($(".songs").length > 0){
    var playlist = $('.table-songs tr');
    var songs = JSON.parse($(".songs").text());
    var total = songs.length;
    var current = 0;
    var repeat_album = false;
    var repeat_song = false;
    var timer;

    $(function(){
      $('#audio-player').mediaelementplayer({
        alwaysShowControls: true,
        features: ['playpause','progress','volume', 'duration', 'current'],
        audioVolume: 'horizontal',
        audioWidth: 450,
        audioHeight: 70,
        iPadUseNativeControls: true,
        iPhoneUseNativeControls: true,
        AndroidUseNativeControls: true,
      });
    });

    // $(".table-songs").find("tr:first").addClass("current-song");
    // $(".table-songs").find("tr:first").find(".playing").css({"visibility": "visible"});;


    var audio = document.getElementById('audio-player');
    audio.addEventListener('ended', function(){
      if(repeat_song){
        loadSong(current);
      }
      else if(current < total - 1 || repeat_album)
        $(".btn-next").trigger("click");
    });
    
    playlist.click(function(){
      current = parseInt($(this).index());
      loadSong(current);
    });

    $(".btn-next").on("click", function(){
      if(current < total - 1)
        current++;
      else
        current = 0;
      loadSong(current);
    });

    $(".btn-prev").on("click", function(){
      if(current > 0)
        current--;
      else
        current = total - 1;
      loadSong(current);
    });

    $(".btn-repeat-song").on("click", function(){
      if(repeat_song){
        repeat_song = false;
        $(this).css({"color": "#848484"});
      }
      else{
        repeat_song = true;
        $(this).css({"color": "WHITE"});
        repeat_album = false;
        $(".btn-repeat-album").css({"color": "#848484"});
      }
    });

    $(".btn-repeat-album").on("click", function(){
      if(repeat_album){
        repeat_album = false;
        $(this).css({"color": "#848484"});
      }
      else{
        repeat_album = true;
        $(this).css({"color": "WHITE"});
        repeat_song = false;
        $(".btn-repeat-song").css({"color": "#848484"});
      }
    });

    function loadSong(id){
      var url = songs[id].url
      playlist.removeClass("current-song");
      playlist.find(".playing").css({"visibility": "hidden"});
      $(".table-songs").find(".song-"+id).addClass("current-song");
      $(".table-songs").find(".song-"+id).find(".playing").css({"visibility": "visible"});
      $(".audio-title").html(songs[id].title);
      $(".audio-artist").html(songs[id].artist);
      $(".bg-img").css({"display": "none", "background": "linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('assets/"+songs[id].image+"')"});
      $(".bg-img").fadeIn(600);
      $(".promotion-img").html("<image class='img-responsive' src='assets/back3.jpg'/><span class='label label-primary timer'>10s</span>");
      $(".promotion-img").show();
      $(".btn-close").show();
      var sec = 10;
      clearInterval(timer);
      timer = setInterval(function(){ 
        $(".timer").html(--sec+"s");
        if (sec == 0) {
          $(".promotion-img").fadeOut(300);
          $(".btn-close").hide();
        } 
      }, 1000); 
      audio.src = url;
      audio.play();
    }

    loadSong(0);

    $(".btn-close").on("click", function(){
      $(".promotion-img").fadeOut(300);
      $(this).hide();
      $(".btn-show-promotion").show();
      clearInterval(timer);
    });

    $(".btn-show-promotion").on("click", function(){
      $(".promotion-img").fadeIn(300);
      $(".btn-close").show();
      clearInterval(timer);
      $(".timer").html("");
    });

  }
});

