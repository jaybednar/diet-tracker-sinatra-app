class Diet < ActiveRecord::Base

	belongs_to :user 
	
	has_many :diet_meals 
	has_many :meals, through: :diet_meals 


end
