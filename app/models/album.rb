class Album < ActiveRecord::Base
  include RailsAdminAlbum
  paginates_per Settings.pagination.per_page

  mount_uploader :image, CoverImageUploader

  belongs_to :production
  has_many :songs

  validates :en_name, presence: true
  validates :image, presence: true
  validates :kh_name, presence: true
  validates :production_id, presence: true

  scope :find_all_except, ->id, limit{where.not(id: id).order("kh_name DESC").limit(limit)}
  scope :latest, ->limit{order(kh_name: :DESC).limit(limit)}

  def name
    kh_name
  end

  def update_view_number
    update_attribute :view, self.view + 1
  end

end
