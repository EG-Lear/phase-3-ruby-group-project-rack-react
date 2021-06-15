class CreateSongsPlaylistsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :playlists, :songs
  end
end