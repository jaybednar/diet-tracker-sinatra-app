class Meal < ActiveRecord::Base

	belongs_to :diet

	has_many :food_meals 
	has_many :foods, through: :food_meals

	after_initialize :default_values

	def unique_foods_list
		self.foods.uniq 
	end 


	def add_food(food, servings = 1)
		servings.times do 
			self.foods << food 
		end 
		self.save 
	end 

	def clear_meal
		self.foods = []
		self.protein = 0.0
		self.carbs = 0.0
		self.fat = 0.0
		self.kcal = 0.0
		self.save
	end 

	def calculate_macros
		self.meal_protein
		self.meal_carbs
		self.meal_fat
		self.meal_kcal
		self.save
	end 

	def meal_protein
		self.foods.each do |food|
			self.protein += food.protein
		end 
	end 

	def meal_carbs
		self.foods.each do |food|
			self.carbs += food.carbs
		end 
	end 

	def meal_fat
		self.foods.each do |food|
			self.fat += food.fat
		end 
	end 

	def meal_kcal
		self.foods.each do |food|
			self.kcal += food.kcal
		end 
	end 

	def slug 
		self.name.downcase.gsub(" ", "-")
	end 

	def self.find_by_slug(slug) 
		meal_name = slug.gsub("-", " ")
		self.all.detect{|meal| meal.name.downcase == meal_name}
	end 

	private

    def default_values
	    self.protein ||= 0.0
			self.carbs ||= 0.0
			self.fat ||= 0.0
			self.kcal ||= 0.0
    end


end
