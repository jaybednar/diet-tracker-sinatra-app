class MealDiet < ActiveRecord::Base
	belongs_to :meal
	belongs_to :diet

end
