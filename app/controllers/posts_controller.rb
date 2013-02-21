before do
  @posts = Post.all
end

get '/posts' do
  erb :'posts/posts'
end

get '/posts/:id' do
  @post = Post.find_by_id(params[:id])
  
  redirect to '/' unless @post
  erb :'posts/show'
end

get '/posts/:id/edit' do
  @post = Post.find_by_id(params[:id])

  redirect to '/' unless @post
  erb :'posts/edit'
end

post '/posts/' do
  @post = Post.new(params)
  if @post.save
    erb :'posts/show'
  else
    @errors = @post.errors
    erb :'posts/posts'
  end
end

put '/posts/' do
  @post = Post.find_by_id(params[:id])
  redirect to '/' unless @post

  if @post.update_attributes(params)
    erb :'posts/show'
  else
    @errors = @post.errors
    erb :'posts/:id/edit'
  end
end

delete '/posts/' do
  @post = Post.find_by_id(params[:id])
  @post.destroy if @post
  erb :'posts/'
end
