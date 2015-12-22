class ArtistsController < ApplicationController
  def index
    @artists = Artist.order("kh_name ASC").page(params[:page])
  end

  def show
    @artist = Artist.find params[:id]
    @artists = Artist.find_all_except @artist.id, 5
    @songs = @artist.songs
    @artist.update_view_number
  end
end
