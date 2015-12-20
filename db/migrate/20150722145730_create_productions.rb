class CreateProductions < ActiveRecord::Migration
  def change
    create_table :productions do |t|
      t.string :kh_name
      t.string :en_name
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
