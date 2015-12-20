module RailsAdminArtist
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 0
      list do
        field :id
        field :kh_name
        field :en_name
        field :view
        field :image
      end
      show do
        field :kh_name
        field :en_name
        field :description
        field :view
        field :image
        field :created_at
        field :updated_at
      end
      edit do
        field :kh_name
        field :en_name
        field :description
        field :image
      end
    end
  end
end
