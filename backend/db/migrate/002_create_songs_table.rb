class CreateSongsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
      t.string :genre
      t.string :user_id
    end
  end
end