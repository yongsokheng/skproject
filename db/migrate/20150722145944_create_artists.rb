class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :kh_name
      t.string :en_name
      t.text :description
      t.integer :view, default: 0
      t.string :image

      t.timestamps null: false
    end
  end
end
