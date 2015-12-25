class PagesController < ApplicationController
  def index
    @productions = Production.all
  end

  def right_ads
    render layout: "application_v2"
  end
end
