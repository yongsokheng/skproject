class AlbumsController < ApplicationController
  def index
    @songs = Song.all
    @first = Song.first
  end
end
