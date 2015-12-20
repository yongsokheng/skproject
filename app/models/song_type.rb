class SongType < ActiveRecord::Base
  belongs_to :song
  belongs_to :type
end
