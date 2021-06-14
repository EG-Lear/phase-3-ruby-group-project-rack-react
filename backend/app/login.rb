class Login
  
  def check_user_and_pass(data)
    puts data
    checking = User.find_by(login: data["login"])
    if checking.password = data["password"]
      puts "correct"
    else
    end
  end

end