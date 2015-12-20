module RailsAdminType
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 1
      list do
        field :id
        field :kh_type
        field :en_type
      end
      show do
        field :kh_type
        field :en_type
        field :created_at
        field :updated_at
      end
      edit do
        field :kh_type
        field :en_type
      end
    end
  end
end
