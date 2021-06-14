class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.get? #handles get requests
      if req.path.match(/test/) 
        return [200, { 'Content-Type' => 'application/json' }, [ {:message => "test response!"}.to_json ]]
      else
        resp.write "Path Not Found"
        resp.status 404
      end
    elsif req.post?
      if req.path.match(/login/)
        puts "log path"
        input = JSON.parse(req.body.read)
        check = Login.new
        check.check_user_and_pass(input)
        # resp.write check.to_json
        # resp.status 200
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
