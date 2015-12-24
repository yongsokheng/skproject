class PagesController < ApplicationController
  def index
    @productions = Production.all
  end

  def right_ads
  end
end
