class MealsController < ApplicationController

##### VIEW MEALS #####

  get "/meals" do
    redirect_if_not_logged_in
    @meals = Meal.all 
    erb :"/meals/index.html"
  end
  

##### CREATE MEALS #####

  post "/meals" do
    redirect_if_not_logged_in

    @diet = Diet.find(params[:diet_id])
    redirect_if_current_user_is_not_object_user(current_user, @diet.user)

    @meal = Meal.create(name: params[:meal][:name])
    params[:foods].each do |food_num, food_hash|
      if food_hash[:food_id] != "--"
        food = Food.find(food_hash[:food_id])
        @meal.add_food(food, food_hash[:food_servings].to_i)
      end 
    end 
    @meal.calculate_macros

    @diet.add_meal(@meal)
    @meal.save
    redirect to "/diets/#{@diet.id}"
  end


##### EDIT MEALS #####

  get "/meals/:id/edit" do
    redirect_if_not_logged_in

    @meal = Meal.find(params[:id])
    redirect_if_current_user_is_not_object_user(current_user, @meal.diet.user)

    @foods = Food.all 
    erb :"/meals/edit.html"
  end

  patch "/meals/:id" do
    @meal = Meal.find(params[:id])
    @meal.clear_meal
    
    params[:foods].each do |food_num, food_hash|
      if food_hash[:food_id] != "--"
        food = Food.find(food_hash[:food_id])
        @meal.add_food(food, food_hash[:food_servings].to_i)
      end 
    end 
    @meal.calculate_macros
    @meal.save
    @meal.diet.recalculate_macros
    redirect "/diets/#{@meal.diet.id}"
  end


##### DELETE MEALS #####

  delete "/meals/:id/delete" do
    redirect_if_not_logged_in

    @meal =  Meal.find(params[:id])
    redirect_if_current_user_is_not_object_user(current_user, @meal.diet.user)
    
    @meal.delete
    @diet = Diet.find(params[:diet_id])
    @diet.save 
    @diet.recalculate_macros
    redirect "/diets/#{@diet.id}"
  end
end
