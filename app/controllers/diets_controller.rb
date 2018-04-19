class DietsController < ApplicationController

  # GET: /diets
  get "/diets" do
    erb :"/diets/index.html"
  end

  # GET: /diets/new
  get "/diets/new" do
    if logged_in?
      @diet = Diet.create
      redirect to "diets/#{@diet.id}"
    else 
      redirect to '/login'
    end 
  end

  # POST: /diets
  post "/diets" do
    redirect "/diets"
  end

  # GET: /diets/5
  get "/diets/:id" do
    if logged_in?
      @diet = Diet.find(params[:id])
      erb :"/diets/show.html"
    else 
      redirect to '/login'
    end 
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
