get '/tags/:id/posts' do
  @posts = Tag.find_by_id(params[:id]).posts
  erb :'posts/posts'
end
