class ProductionsController < ApplicationController
  def index
    @productions = Production.order "en_name DESC"
  end

  def show
    @production = Production.find params[:id]
    @albums = @production.albums.order "en_name DESC"
  end
end
