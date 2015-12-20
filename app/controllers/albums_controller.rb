class AlbumsController < ApplicationController
  def show
    @album = Album.find params[:id]
    @albums = @album.production.albums
    @similar_albums = @albums.find_all_except @album.id, 10
    @songs = @album.songs
    @album.update_view_number
  end
end
