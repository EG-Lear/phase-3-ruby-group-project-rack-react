class HandleCreateDelete

  def create_song_artist(data)
    response = []
    last_artist = Artist.last
    last_song = Song.last
    new_song = Song.find_or_create_by(name: data["song"], genre: data["genre"])
    new_artist = Artist.find_or_create_by(name: data["artist"])
    new_artist.songs << new_song
    if Song.last != last_song
      response << {created: true, response: "New song and/or artist has been created"}
    elsif Artist.last != last_artist
      response << {created: true, response: "New song and/or artist has been created"}
    else
      response << {created: false, response: "The song and/or artist already exists"}
    end
    response
  end

  def deletion(data)
    response = []
    if Song.find_by(name: data["song"]) == nil
      response << {response: "Could not find song to smash"}
    else
      Song.find_by(name: data["song"]).destroy
      response << {response: "SMASH"}
    end
    response
  end

  def create_playlist(data)
    response = []
    if Song.find_by(name: data["song"]) == nil
      response << {response: "Please choose an existing song"}
    else
      new_playlist = Playlist.find_or_create_by(name: data["playlist"])
      new_playlist.songs << Song.find_by(name: data["song"])
      response << {response: "Your playlist modifications have been made"}
    end
    response
  end

  def delete_playlist(data)
    response = []
    if Playlist.find_by(name: data["playlist"]) == nil
      response << {response: "No playlist raised its hand, is it spelled right?"}
    else
      Playlist.find_by(name: data["playlist"]).destroy
      response << {response: "Wave Goodbye"}
    end
    response
  end

end