class Slide < ActiveRecord::Base
  include RailsAdminSlide
  mount_uploader :image, SlideImageUploader

  validates :image, presence: true
  validates :name, presence: true

  def title
    name
  end
end
