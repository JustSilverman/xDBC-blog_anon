get '/tags/:id/posts' do
  @tag   = Tag.find_by_id(params[:id])
  redirect to '/' unless @tag

  erb :'tags/show'
end
