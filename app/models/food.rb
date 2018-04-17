class Food < ActiveRecord::Base

	has_many :food_meals
	has_many :meals, through: :food_meals

	def create(params = nil)
		self.protein ||= 0.0
		self.carbs ||= 0.0
		self.fat ||= 0.0
		self.kcal ||= 0.0
	end 
	
	def calculate_food_kcal
		# binding.pry
		kcal = ((self.protein * 4) + (self.carbs * 4) + (self.fat * 9))
		self.update(kcal: kcal)
	end 

	def slug 
		self.name.downcase.gsub(" ", "-")
	end 

	def self.find_by_slug(slug) 
		food_name = slug.gsub("-", " ")
		self.all.detect{|food| food.name.downcase == food_name}
	end 

end
