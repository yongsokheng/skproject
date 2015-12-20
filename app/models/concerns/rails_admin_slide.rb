module RailsAdminSlide
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 7
      list do
        field :id
        field :name
        field :image
        field :created_at
        field :updated_at
      end
      show do
        field :id
        field :name
        field :image
        field :description
        field :link
        field :created_at
        field :updated_at
      end
      edit do
        field :name
        field :image
        field :description
        field :link
      end
    end
  end
end
