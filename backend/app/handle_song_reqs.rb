class HandleSongReqs
  
  def all_songs
    songs = []
    Song.all.order(:name).each do |song|
      songg = nil
      genree = nil
      artistt = nil
      if song.name
        songg = song.name
      end
      if song.genre
        genree = song.genre
      end
      if song.artist.name
        artistt = song.artist.name
      end
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
        songg = nil
        artistt = nil
        genree = nil
        if song.name
          songg = song.name
        end
        if song.genre
          genree = song.genre
        end
        if song.artist.name
          artistt = song.artist.name
        end
        artist_songs << {name: songg, genre: genree, artist_name: artistt}
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
      playlistt = nil
      if list.name
        playlistt = list.name
      end
      list.songs.order(:name).each do |song|
        songg = nil
        artistt = nil
        genree = nil
        if song.name
          songg = song.name
        end
        if song.genre
          genree = song.genre
        end
        if song.artist.name
          artistt = song.artist.name
        end
        playlist_songs << {name: song.name, genre: song.genre, artist: song.artist.name}
        puts "in second each"
      end
      songs << {playlist: playlistt, songs: playlist_songs}
    end
    songs
  end
end