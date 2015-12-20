class Country < ActiveRecord::Base
  include RailsAdminCountry
  mount_uploader :image, CoverImageUploader
  has_many :songs

  validates :en_name, presence: true
  validates :kh_name, presence: true
  validates :image, presence: true

  def name
    kh_name
  end
end
