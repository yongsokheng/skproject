class Type < ActiveRecord::Base
  include RailsAdminType

  has_many :song_types
  has_many :songs, through: :song_types

  validates :en_type, presence: true
  validates :kh_type, presence: true

  def name
    kh_type
  end
end
