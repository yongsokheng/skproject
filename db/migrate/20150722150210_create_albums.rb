class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :kh_name
      t.string :en_name
      t.text :description
      t.integer :year
      t.string :image
      t.integer :view, default: 0
      t.references :production, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
