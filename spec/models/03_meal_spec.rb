require_relative "../spec_helper"

describe Meal do 
	before(:each) do 
		@meal = Meal.create(name: "Meal 1")
		@food1 = Food.create(name: "Chicken Breast", serving_size: "4 oz", protein: 26, carbs: 0, fat: 2)
		@food2 = Food.create(name: "Jasmine Rice", serving_size: "1/2 cup", protein: 2, carbs: 22, fat: 0)
		@food3 = Food.create(name: "Avocado Oil", serving_size: "1 tbsp", protein: 0, carbs: 0, fat: 14)
	end 

	describe 'methods' do 

		it 'can add a food' do 
			@meal.add_food(@food1)
			expect(@meal.foods).to include(@food1)
		end

		it 'can add multiple servings of a food' do 
			@meal.add_food(@food1, 2)
			expect(@meal.foods.count).to eq(2)
		end 

		it 'can calculate the macronutrient amounts for the meal' do 
			@meal.add_food(@food1, 2) 
			@meal.add_food(@food2, 2) 
			@meal.add_food(@food3, 1) 
			@meal.calculate_macros
			expect(@meal.protein).to eq(56)
			expect(@meal.carbs).to eq(44)
			expect(@meal.fat).to eq(16)
			expect(@meal.kcal).to eq(544)
		end 
	end 
end 