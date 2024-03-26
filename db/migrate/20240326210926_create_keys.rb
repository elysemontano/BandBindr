class CreateKeys < ActiveRecord::Migration[7.0]
  def change
    create_table :keys do |t|
      t.references :person, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.string :song_key

      t.timestamps
    end
  end
end
