class ShowsController < ApplicationController
  
  get '/shows/new' do 
    if logged_in?
      erb :'/shows/create_show'
    else
      redirect to '/login'
   end
  end
  
  post '/shows' do 
    if logged_in?
      if params[:title] == "" || params[:rating] == "" || params[:streaming_service] == "" || params[:review] == ""
        erb :'shows/create_show'
      else
        @show = current_user.shows.build(title: params[:title], rating: params[:rating], streaming_service: params[:streaming_service], review: params[:review])
        if @show.save
          redirect to "/shows/#{@show.id}"
        else
          redirect to "/shows/new"
        end
      end
    else
      redirect to '/login'
    end
  end 
  
  get '/shows/:id' do
    if logged_in?
      @show = Show.find_by_id(params[:id])
      erb :'shows/show_detail'
    else
      redirect to '/login'
    end
  end 
      

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
