class ShowsController < ApplicationController
  
  get '/shows' do 
    if logged_in?
      @show = Show.all
      erb :'/shows/index'
    else 
      redirect to '/login'
    end 
  end 
  
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
      
  get "/shows/:id/edit" do
    @show = Show.find_by_id(params[:id])
    if logged_in? && current_user == @show.user
      erb :'/shows/edit_show'
    else
      redirect to '/login'
    end 
  end

  patch "/shows/:id" do
    if logged_in?
      if params[:title] == "" || params[:rating] == "" || params[:streaming_service] == "" || params[:review] == ""
        redirect to "/shows/#{params[:id]}/edit"
      else
        @show = Show.find_by_id(params[:id])
          if @show && @show.user == current_user
            if @show.update(title: params[:title], rating: params[:rating], streaming_service: params[:streaming_service], review: params[:review])
              redirect to "/shows/#{@show.id}"
            else
              redirect to "/shows/#{@shows.id}/edit"
            end
          else
            redirect to '/shows'
          end
        end
      else
        redirect to '/login'
      end
    end

  delete "/shows/:id/delete" do
    redirect "/shows"
  end
end
