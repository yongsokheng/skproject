class Song < ActiveRecord::Base
  include RailsAdminSong
  paginates_per Settings.pagination.per_page

  mount_uploader :image, CoverImageUploader
  mount_uploader :bg_image, BannerImageUploader

  belongs_to :album
  belongs_to :country
  belongs_to :promotion_image
  belongs_to :user

  has_many :song_artists, dependent: :destroy
  has_many :artists, through: :song_artists

  has_many :song_types, dependent: :destroy
  has_many :types, through: :song_types

  validates :artists, presence: true
  validates :album, presence: true
  validates :country, presence: true
  validates :en_title, presence: true
  validates :kh_title, presence: true
  validates :types, presence: true
  validates :url, presence: true
  validates :image, presence: true

  scope :find_song, ->term{where("keyword LIKE ?", "%#{term}%").limit 5}
  scope :find_all_except, ->id, limit{where.not(id: id).limit(limit)}
  scope :top_song, ->limit{order(play_number: :DESC).limit(limit)}

  before_save :set_keyword

  def name
    kh_title
  end

  def get_artist_list
    artists.map{|artist| "#{artist.kh_name}"}.join(", ")
  end

  def update_play_number
    update_attribute :play_number, self.play_number + 1
  end

  def update_download_number
    update_attribute :download_number, self.download_number + 1
  end

  private
  def get_artists
    artists.map{|artist| "#{artist.en_name} #{artist.kh_name}"}.join(" ")
  end

  def get_types
    types.map{|type| "#{type.en_type} #{type.kh_type}"}.join(" ")
  end

  def set_keyword
    self.keyword = "#{album.production.kh_name} #{album.production.en_name}
      #{kh_title} #{en_title} #{album.kh_name} #{album.en_name} #{country.kh_name}
      #{country.en_name} #{get_artists} #{get_types}"
  end
end
