class Production < ActiveRecord::Base
  include RailsAdminProduction
  paginates_per Settings.pagination.per_page

  mount_uploader :image, CoverImageUploader

  has_many :albums

  validates :en_name, presence: true
  validates :kh_name, presence: true
  validates :image, presence: true
  validates :order_id, presence: true

  def name
    kh_name
  end
end
