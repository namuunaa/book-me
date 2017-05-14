get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:email], params[:password])
    login_user
  else
    @errors = ["The email or password is incorrect."]
    erb :'sessions/new'
  end
end

delete '/sessions' do
  logout_user
end
