module RailsAdminSong
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 6
      list do
        field :kh_title
        field :en_title
        field :album
        field :artists
        field :play_number do
          label "Play"
        end
        field :download_number do
          label "Download"
        end
        field :user do
          hide
        end
      end
      show do
        field :kh_title
        field :en_title
        field :url
        field :album
        field :country
        field :artists
        field :types
        field :play_number
        field :download_number
        field :lyric
        field :image
        field :bg_image
        field :promotion_image
        field :user
        field :keyword
      end
      edit do
        field :kh_title
        field :en_title
        field :url
        field :album
        field :country
        field :artists
        field :types
        field :lyric, :ck_editor
        field :image
        field :bg_image
        field :promotion_image
        field :user_id, :hidden do
          default_value do
            bindings[:view]._current_user.id
          end
        end
      end
    end
  end
end
