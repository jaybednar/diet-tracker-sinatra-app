class DietsController < ApplicationController

##### CREATE DIETS #####

  get "/diets/new" do
    redirect_if_not_logged_in
    determine_error_message
    @diet = current_user.diets.create
    # @diet = Diet.create
    # @diet.user = current_user
    # @diet.save
    # current_user.save 
    redirect to "diets/#{@diet.id}"
  end


##### VIEW DIETS #####

  get "/diets/:id" do
    redirect_if_not_logged_in
    determine_error_message
    @foods = Food.all 
    @diet = Diet.find(params[:id])
    erb :"/diets/show.html"
  end

##### DELETE DIETS #####

  delete "/diets/:id/delete" do
    redirect_if_not_logged_in
    determine_error_message

    @diet = Diet.find(params[:id])
    @user = @diet.user
    redirect_if_current_user_is_not_object_user(current_user, @user)
    
    @diet.delete 
    @user.save 
    redirect "/users/#{@user.id}"  
  end
end
