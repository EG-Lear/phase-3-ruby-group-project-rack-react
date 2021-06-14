class HandleSongReqs
  
  def all_songs
    songs = []
    Song.all.order(:name).each do |song|
      songs << {name: song.name, genre: song.genre, artist:song.artist.name}
    end
    songs
  end
end