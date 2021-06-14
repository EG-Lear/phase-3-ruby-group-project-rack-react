class Login
  
  def check_user_and_pass(data)
    response = []
    checking = User.find_by(login: data["login"])
    if checking.password = data["password"]
      response << {passed: true, name: checking.name}
    else
      response = {passed: false} 
    end
    puts response
    response
  end

end