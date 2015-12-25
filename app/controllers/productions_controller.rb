class ProductionsController < ApplicationController
  def index
    @productions = Production.order("kh_name ASC").page(params[:page])
  end

  def show
    @production = Production.find params[:id]
    @albums = @production.albums.order("kh_name DESC").page(params[:page])
  end
end
