class ShowsController < ApplicationController
  
  get '/shows/:id/new' do 
    erb :'shows/create_show'
  end
  
  post '/shows/:id/new' do 
    @show = 
      

  # GET: /shows/5/edit
  get "/shows/:id/edit" do
    erb :"/shows/edit"
  end

  # PATCH: /shows/5
  patch "/shows/:id" do
    redirect "/shows/:id"
  end

  # DELETE: /shows/5/delete
  delete "/shows/:id/delete" do
    redirect "/shows"
  end
end
