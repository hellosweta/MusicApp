class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :album_id

      t.timestamps
    end
    add_index :tracks, :album_id
  end
end
