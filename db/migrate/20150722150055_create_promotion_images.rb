class CreatePromotionImages < ActiveRecord::Migration
  def change
    create_table :promotion_images do |t|
      t.string :name
      t.string :image
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
