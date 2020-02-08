class UsersController < ApplicationController

  # GET: /users
  #get "/users" do
   # erb :"/users/index"
  #end

  # GET: /users/new
  get "/users/new" do
    if !logged_in?
      erb :'/users/new'
   else
      redirect to '/users/show'
   end
    #erb :"/users/new"
  end

  # POST: /users
  post "/users/new" do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/users/new'
    else
      @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/users/show'
    end
    #redirect "/users/show"
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
