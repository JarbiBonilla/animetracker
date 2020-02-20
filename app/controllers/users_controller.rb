class UsersController < ApplicationController
  
  get '/users/:id' do
    @user = User.find_by_id(params[:id])
    erb :'/users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'/users/create_user'
   else
      redirect to "/users/#{current_user.id}"
   end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect to "/users/#{current_user.id}"
      else 
        redirect to '/signup'
      end 
    end
  end
  
  get '/login' do 
    if !logged_in?
      erb :'/users/login'
    else
      redirect to "/users/#{current_user.id}"
    end
  end 
  
  post '/login' do 
    login(params[:username], params[:password])
    current_user
    redirect to "/users/#{current_user.id}"
  end 
  
  post '/logout' do 
    if logged_in?
      logout!
    redirect to '/login'
    else
      redirect to '/'
    end
  end
  
end 