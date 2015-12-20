class Production < ActiveRecord::Base
  include RailsAdminProduction
  mount_uploader :image, CoverImageUploader

  has_many :albums

  validates :en_name, presence: true
  validates :kh_name, presence: true
  validates :image, presence: true

  def name
    kh_name
  end
end
