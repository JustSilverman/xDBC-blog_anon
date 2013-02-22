before do
  @posts = Post.all
end

get '/posts' do
  erb :'posts/posts'
end

get '/posts/new' do
  @post = Post.new
  erb :'posts/new'
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

post '/posts' do
  @post = Post.new(:title => params[:title],
                   :body  => params[:body])
  @post.handle_tags(params[:tags])

  if @post.save
    erb :'posts/show'
  else
    erb :'posts/new'
  end
end

put '/posts' do
  @post = Post.find_by_id(params[:id])
  redirect to '/' unless @post

  @post.handle_tags(params[:tags])
  if @post.update_attributes(:title => params[:title],
                             :body  => params[:body])
    redirect  to "posts/#{@post.id}"
  else
    erb :'posts/edit'
  end
end

delete '/posts' do
  @post = Post.find_by_id(params[:id])
  @post.destroy if @post
  redirect to '/'
end
