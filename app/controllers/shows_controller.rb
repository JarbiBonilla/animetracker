class ShowsController < ApplicationController

  # GET: /shows
  get "/shows" do
    erb :"/shows/index.html"
  end

  # GET: /shows/new
  get "/shows/new" do
    erb :"/shows/new.html"
  end

  # POST: /shows
  post "/shows" do
    redirect "/shows"
  end

  # GET: /shows/5
  get "/shows/:id" do
    erb :"/shows/show.html"
  end

  # GET: /shows/5/edit
  get "/shows/:id/edit" do
    erb :"/shows/edit.html"
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
