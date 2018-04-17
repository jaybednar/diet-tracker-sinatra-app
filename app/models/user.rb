class User < ActiveRecord::Base
	has_secure_password 
	
	has_many :meals 
	has_many :foods
	has_many :diets
	
end
