require_relative "../spec_helper"

describe Diet do 
	before do 
		@meal1 = Meal.create(name: "Meal 1")
		@meal2 = Meal.create(name: "Meal 2")
		@meal3 = Meal.create(name: "Meal 3")

		@food1 = Food.create(name: "Chicken Breast", serving_size: "4 oz", protein: 26, carbs: 0, fat: 2)
		@food1.calculate_food_kcal
		@food2 = Food.create(name: "Jasmine Rice", serving_size: "1/2 cup", protein: 2, carbs: 22, fat: 0)
		@food2.calculate_food_kcal
		@food3 = Food.create(name: "Avocado Oil", serving_size: "1 tbsp", protein: 0, carbs: 0, fat: 14)
		@food3.calculate_food_kcal

		@meal1.add_food(@food1, 2)
		@meal1.add_food(@food2, 2)
		@meal1.add_food(@food3, 1)
		@meal1.calculate_macros
		@meal1.save

		@meal2.add_food(@food1, 1)
		@meal2.add_food(@food2, 3)
		@meal2.add_food(@food3, 1)
		@meal2.calculate_macros
		@meal2.save

		@meal3.add_food(@food1, 2)
		@meal3.add_food(@food2, 1)
		@meal3.add_food(@food3, 2)
		@meal3.calculate_macros
		@meal3.save

		@user = User.create(username: "jb", password: "jjj")
		@diet = Diet.create(date: "4/17/18", user_id: @user.id)
	end 

	describe 'attributes' do 

		it 'has a date' do 
			expect(@diet.date).to eq("4/17/18")
		end 

		it 'belongs to a user' do 
			expect(@user.diets).to include(@diet)
		end 

	end

	describe 'methods' do 

		it 'can add a meal' do 
			@diet.add_meal(@meal1)
			expect(@diet.meals).to include(@meal1)
		end 

		it 'can calculate its macronutrient amounts' do 
			@diet.add_meal(@meal1)
			@diet.add_meal(@meal2)
			@diet.add_meal(@meal3)
			@diet.calculate_macros
			expect(@diet.protein).to eq(142)
			expect(@diet.carbs).to eq(132)
			expect(@diet.fat).to eq(66)
			expect(@diet.kcal).to eq(1690)
		end 

	end 

end 