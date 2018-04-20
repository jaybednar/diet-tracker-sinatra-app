class FoodsController < ApplicationController

##### VIEW FOODS #####

  get "/foods" do
    @user = current_user
    @foods = Food.all
    erb :"/foods/index.html"
  end


##### CREATE FOODS #####

  get "/foods/new" do
    erb :"/foods/new.html"
  end

  post "/foods" do
    @food = Food.create(params[:food])
    @food.calculate_food_kcal
    @food.save
    redirect "/foods"
  end

  # # GET: /foods/5
  # get "/foods/:id" do
  #   erb :"/foods/show.html"
  # end

  # # GET: /foods/5/edit
  # get "/foods/:id/edit" do
  #   erb :"/foods/edit.html"
  # end

  # # PATCH: /foods/5
  # patch "/foods/:id" do
  #   redirect "/foods/:id"
  # end

  # # DELETE: /foods/5/delete
  # delete "/foods/:id/delete" do
  #   redirect "/foods"
  # end
end
