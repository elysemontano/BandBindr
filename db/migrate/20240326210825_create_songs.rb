class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :song_name

      t.timestamps
    end
  end
end
