class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :kh_type
      t.string :en_type
      t.timestamps null: false
    end
  end
end
