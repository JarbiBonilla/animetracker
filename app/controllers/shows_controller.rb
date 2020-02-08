class ShowsController < ApplicationController

  # GET: /shows
  get "/shows" do
    erb :"/shows/index"
  end

  # GET: /shows/new
  get "/shows/new" do
    erb :"/shows/new"
  end

  # POST: /shows
  post "/shows" do
    redirect "/shows"
  end

  # GET: /shows/5
  get "/shows/:id" do
    erb :"/shows/show"
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
