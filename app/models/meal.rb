class Meal < ActiveRecord::Base

	has_many :diet_meals 
	has_many :diets, through: :diet_meals

	has_many :meal_foods 
	has_many :foods, through: :meal_foods
	
end
