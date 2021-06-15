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

end