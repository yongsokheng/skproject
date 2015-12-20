module RailsAdminUser
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 8
      list do
        field :id
        field :username
        field :email
        field :admin
      end
      show do
        field :username
        field :email
        field :admin
        field :created_at
        field :updated_at
      end
      edit do
        field :username
        field :email
        field :admin do
          visible do
            bindings[:object].admin?
          end
        end
        field :password
        field :password_confirmation
      end
    end
  end
end
