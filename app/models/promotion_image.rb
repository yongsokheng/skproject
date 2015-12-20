class PromotionImage < ActiveRecord::Base
  include RailsAdminPromotionImage

  mount_uploader :image, BannerImageUploader

  has_many :songs

  validates :image, presence: true
  validates :name, presence: true

  def title
    name
  end
end
