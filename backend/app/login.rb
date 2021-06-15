class Login 
  
  def check_user_and_pass(data)
    response = []
    checking = User.find_by(login: data["login"])
    if checking.password == data["password"]
      response << {passed: true, name: checking.name}
    else
      response << {passed: false} 
    end
    response
  end

  def register_new(data)
    response = []
    checking = User.find_by(login: data["login"])
    if checking
      response << {passed: false}
    else
      User.create(login: data["login"], password: data["password"], name: data["name"])
      response << {passed: true}
    end
    response
  end

end