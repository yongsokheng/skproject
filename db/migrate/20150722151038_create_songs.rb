class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :kh_title
      t.string :en_title
      t.text :lyric
      t.integer :play_number, default: 0
      t.integer :download_number, default: 0
      t.string :url
      t.string :image
      t.string :bg_image
      t.string :keyword, index: true
      t.references :album, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.references :promotion_image, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
