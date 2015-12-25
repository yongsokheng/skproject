class PagesController < ApplicationController
  def index
    @productions = Production.order("kh_name ASC")
  end

  def right_ads
    render layout: "application_v2"
  end
end
