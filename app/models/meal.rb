class Meal < ActiveRecord::Base

	has_many :meal_diets 
	has_many :diets, through: :meal_diets

	has_many :food_meals 
	has_many :foods, through: :food_meals


	

end
