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

post '/posts' do
  @post = Post.new(:title => params[:title],
                   :body  => params[:body])

  puts @post.inspect

  if @post.save
    erb :'posts/show'
  else
    @errors = @post.errors
    erb :'posts/posts'
  end
end

put '/posts' do
  @post = Post.find_by_id(params[:id])
  redirect to '/' unless @post

  if @post.update_attributes(params)
    erb :'posts/show'
  else
    @errors = @post.errors
    erb :'posts/:id/edit'
  end
end

delete '/posts' do
  puts params
  @post = Post.find_by_id(params[:id])
  puts @post.inspect
  @post.destroy if @post
  redirect to '/'
end
