class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.get? #handles get requests
      if req.path.match(/test/) 
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
      elsif req.path.match(/songs/)
        song_reqs = HandleSongReqs.new
        object = song_reqs.all_songs
        resp.write object.to_json
      elsif req.path.match(/artists/)
        song_reqs = HandleSongReqs.new
        object = song_reqs.artists_reqs
        resp.write object.to_json
      elsif req.path.match(/playlists/)
        song_reqs = HandleSongReqs.new
        object = song_reqs.playlists_reqs
        resp.write object.to_json
      else
        resp.write "Path Not Found"
        resp.status 404
      end
    elsif req.post? # handles post requests
      if req.path.match(/login/)
        input = JSON.parse(req.body.read)
        check = Login.new
        object = check.check_user_and_pass(input)
        resp.write object.to_json
      elsif req.path.match(/register/)
        input = JSON.parse(req.body.read)
        check = Login.new
        object = check.register_new(input)
        resp.write object.to_json
      elsif req.path.match(/songs/)
        input = JSON.parse(req.body.read)
        new_stuff = HandleCreateDelete.new
        response = new_stuff.create_song_artist(input)
        resp.write response.to_json
      elsif req.path.match(/playlists/)
        input = JSON.parse(req.body.read)
        new_stuff = HandleCreateDelete.new
        response = new_stuff.create_playlist(input)
        resp.write response.to_json
      else
        resp.write "Path Not Found"
        resp.status 404
      end
    elsif req.delete?
      if req.path.match(/songs/)
        input = JSON.parse(req.body.read)
        goodbye = HandleCreateDelete.new
        response = goodbye.deletion(input)
        resp.write response.to_json
      elsif req.path.match(/playlists/)
        input = JSON.parse(req.body.read)
        goodbye = HandleCreateDelete.new
        response = goodbye.delete_playlist(input)
        resp.write response.to_json
      else
        resp.write "Path Not Found"
        resp.status 404
      end
    else
      resp.write "Path Not Found"
      resp.status 404
    end

    resp.finish
  end

end
