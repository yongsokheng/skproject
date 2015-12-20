class SongsController < ApplicationController
  def index
    @result = Song.ransack(params[:q]).result
  end

  def show
    @songs = Song.where(id: params[:id])
    @song = Song.find params[:id]
    @album = @song.album
    @similar_songs = @album.songs.find_all_except @song.id, 5
  end

  def search
    respond_to do |format|
      format.html
      format.json {@songs = Song.find_song params[:term]}
    end
  end

  def top_song
    @result = Song.top_song 20
    render :index
  end

  def update_number
    song = Song.find params[:id]
    if("play" == params[:type])
      song.update_play_number
    else
      song.update_download_number
    end
    render nothing: true
  end
end
