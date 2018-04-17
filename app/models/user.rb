class User < ActiveRecord::Base
	has_secure_password 
	
	has_many :meals 
	has_many :foods
	has_many :diets

	validates :username, presence: true
	validates :password, presence: true 
	
end
