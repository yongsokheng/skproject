class Artist < ActiveRecord::Base
  include RailsAdminArtist
  paginates_per Settings.pagination.per_page

  mount_uploader :image, CoverImageUploader

  has_many :song_artists
  has_many :songs, through: :song_artists

  validates :en_name, presence: true
  validates :kh_name, presence: true
  validates :image, presence: true

  scope :find_all_except, ->id, limit{where.not(id: id).order("kh_name ASC").limit(limit)}

  def name
    kh_name
  end

  def update_view_number
    update_attribute :view, self.view + 1
  end

end
