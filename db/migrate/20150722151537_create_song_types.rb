class CreateSongTypes < ActiveRecord::Migration
  def change
    create_table :song_types do |t|
      t.references :song, index: true, foreign_key: true
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
