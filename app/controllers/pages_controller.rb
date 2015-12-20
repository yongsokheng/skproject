class PagesController < ApplicationController
  def index
    @productions = Production.all
  end
end
