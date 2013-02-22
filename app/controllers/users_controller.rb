get '/' do
  @posts = Post.all
  erb :index
end

post '/login' do
  @user = User.authenticate(params[:email], params[:password])
  if @user
    login(@user.id)
    redirect to :'users/show'
  else
    redirect to '/'
  end
end

post '/users' do
  @user = User.new(params)
  if @user.save
    login(@user.id)
    redirect to '/'
  else
    erb :index
  end
end

post '/logout' do
  session.delete(:user_id)
  redirect to '/'
end