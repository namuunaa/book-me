 helpers do

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def login_user
    session[:id] = @user.id
    redirect '/books'
  end

  def logout_user
    session[:id] = nil
    redirect '/'
  end

end

