module RailsAdminProduction
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 3
      list do
        field :id
        field :kh_name
        field :en_name
        field :order_id
        field :image
      end
      show do
        field :kh_name
        field :en_name
        field :order_id
        field :image
        field :created_at
        field :updated_at
      end
      edit do
        field :kh_name
        field :en_name
        field :order_id
        field :description
        field :image
      end
    end
  end
end
