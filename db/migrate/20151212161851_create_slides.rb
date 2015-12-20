class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :name
      t.string :image
      t.string :description
      t.string :link

      t.timestamps null: false
    end
  end
end
