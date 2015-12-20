module RailsAdminAlbum
  extend ActiveSupport::Concern

  included do
    rails_admin do
      weight 4
      list do
        field :id
        field :kh_name
        field :en_name
        field :production do
          pretty_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].production.kh_name}",
              href: "production/#{bindings[:object].production.id}")
          end
        end
        field :view
        field :image
      end
      show do
        field :kh_name
        field :en_name
        field :production do
          pretty_value do
            bindings[:view].content_tag(:a, "#{bindings[:object].production.kh_name}",
              href: "production/#{bindings[:object].production.id}")
          end
        end
        field :view
        field :year
        field :description
        field :image
        field :created_at
        field :updated_at
      end
      edit do
        field :production
        field :kh_name
        field :en_name
        field :year
        field :description
        field :image
      end
    end
  end
end
