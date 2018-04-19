class DietsController < ApplicationController

  # GET: /diets
  # get "/diets" do
  #   erb :"/diets/index.html"
  # end

  # GET: /diets/new
  get "/diets/new" do
    redirect_if_not_logged_in
    
    @diet = Diet.create
    @diet.user = current_user
    @diet.save
    current_user.save 
    redirect to "diets/#{@diet.id}"
  end

  # POST: /diets
  # post "/diets" do
  #   redirect "/diets"
  # end

  # GET: /diets/5
  get "/diets/:id" do
    redirect_if_not_logged_in
    
    @foods = Food.all 
    @diet = Diet.find(params[:id])
    erb :"/diets/show.html"
  end

  # GET: /diets/5/edit
  # get "/diets/:id/edit" do
  #   erb :"/diets/edit.html"
  # end

  # # PATCH: /diets/5
  # patch "/diets/:id" do
  #   redirect "/diets/:id"
  # end

  # DELETE: /diets/5/delete
  delete "/diets/:id/delete" do
    redirect_if_not_logged_in
    @diet = Diet.find(params[:id])
    @user = current_user

    if current_user == @diet.user
      @diet.delete 
      @user.save 
      redirect "/users/#{@user.id}" 
    else 
      redirect_if_current_user_is_not_object_user
    end 
  end
end
