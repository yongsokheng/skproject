class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :kh_name
      t.string :en_name
      t.string :image

      t.timestamps null: false
    end
  end
end
