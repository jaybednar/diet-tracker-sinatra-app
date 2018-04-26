class User < ActiveRecord::Base
	has_secure_password 
	
	# has_many :meals 
	# has_many :foods
	has_many :diets

	validates :username, presence: true
	validates :password, presence: true 
	

	def slug 
		self.username.downcase.gsub(" ", "-")
	end 

	def self.find_by_slug(slug) 
		username = slug.gsub("-", " ")
		self.all.detect{|user| user.username.downcase == username}
	end 
	
end
