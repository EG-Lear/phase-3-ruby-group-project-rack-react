class HandleSongReqs
  
  def all_songs
    songs = []
    Song.all.order(:name).each do |song|
      songs << {name: song.name, genre: song.genre, artist:song.artist.name}
    end
    songs
  end

  def artists_reqs
    puts "in art reqs"
    songs = []
    Artist.all.order(:artist).each do |singer|
      artist_songs = []
      singer.songs.order(:name).each do |song|
        artist_songs << {name: song.name, genre: song.genre, artist_name: song.artist.name}
        puts "in second each"
      end
      songs << {artists: artist_songs}
    end
    songs
  end

  def playlists_reqs
    songs = []
    Playlist.all.order(:name).each do |list|
      playlist_songs = []
      list.songs.order(:name).each do |song|
        playlist_songs << {name: song.name, genre: song.genre, artist: song.artist.name}
        puts "in second each"
      end
      songs << {playlist: list.name, songs: playlist_songs}
    end
    songs
  end
end