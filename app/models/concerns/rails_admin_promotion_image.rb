module RailsAdminPromotionImage
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 5
      list do
        field :id
        field :name
        field :image
        field :created_at
        field :updated_at
      end
      show do
        field :name
        field :image
        field :link
        field :description
        field :created_at
        field :updated_at
      end
      edit do
        field :name
        field :image
        field :link
        field :description
      end
    end
  end
end
