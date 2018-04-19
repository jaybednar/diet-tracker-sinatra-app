class MealsController < ApplicationController

  # GET: /meals
  # get "/meals" do
  #   erb :"/meals/index.html"
  # end

  # GET: /meals/new
  # get "/meals/new" do
  #   erb
  # end

  # # POST: /meals
  post "/meals" do
    @meal = Meal.create(name: params[:meal][:name])

    params[:foods].each do |food_num, food_hash|
      if food_hash[:food_id] != "--"
        food = Food.find(food_hash[:food_id])
        @meal.add_food(food, food_hash[:food_servings].to_i)
      end 
    end 

    @meal.calculate_macros
    @diet = Diet.find(params[:diet_id])  #will need to add a hidden input to with name="diet_id" and value="<%=@diet.id%>"
    @diet.add_meal(@meal)
    @meal.save

    redirect to "/diets/#{@diet.id}"
  end

  # # GET: /meals/5
  # get "/meals/:id" do
  #   erb :"/meals/show.html"
  # end

  # # GET: /meals/5/edit
  get "/meals/:id/edit" do
    @foods = Food.all 
    @meal = Meal.find(params[:id])
    erb :"/meals/edit.html"
  end

  # # PATCH: /meals/5
  patch "/meals/:id" do
    @meal = Meal.find(params[:id])
    @meal.clear_meal
    # binding.pry
    params[:foods].each do |food_num, food_hash|
      if food_hash[:food_id] != "--"
        food = Food.find(food_hash[:food_id])
        @meal.add_food(food, food_hash[:food_servings].to_i)
      end 
    end 
    @meal.calculate_macros
    @meal.save
    redirect "/diets/#{@meal.diet.id}"
  end

  # # DELETE: /meals/5/delete
  delete "/meals/:id/delete" do
    @meal =  Meal.find(params[:id])
    @meal.delete
    @diet = Diet.find(params[:diet_id])
    @diet.save 
    redirect "/diets/#{@diet.id}"
  end
end
