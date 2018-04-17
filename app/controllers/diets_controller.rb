class DietsController < ApplicationController

  # GET: /diets
  get "/diets" do
    erb :"/diets/index.html"
  end

  # GET: /diets/new
  get "/diets/new" do
    erb :"/diets/new.html"
  end

  # POST: /diets
  post "/diets" do
    redirect "/diets"
  end

  # GET: /diets/5
  get "/diets/:id" do
    erb :"/diets/show.html"
  end

  # GET: /diets/5/edit
  get "/diets/:id/edit" do
    erb :"/diets/edit.html"
  end

  # PATCH: /diets/5
  patch "/diets/:id" do
    redirect "/diets/:id"
  end

  # DELETE: /diets/5/delete
  delete "/diets/:id/delete" do
    redirect "/diets"
  end
end
