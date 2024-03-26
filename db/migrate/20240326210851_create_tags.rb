class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.references :organization, null: false, foreign_key: true
      t.string :tag_word

      t.timestamps
    end
  end
end
