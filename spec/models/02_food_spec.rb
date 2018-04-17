require_relative "../spec_helper"

describe Food do 
	before(:each) do 
		@food = Food.create(name: "Chicken Breast", serving_size: "4 oz", protein: 26, carbs: 0, fat: 2)
	end 

	describe 'attributes' do 

		it 'has a name' do 
			expect(@food.name).to eq("Chicken Breast") 
		end 

		it 'has a serving_size' do 
			expect(@food.serving_size).to eq("4 oz")
		end 

		it 'has a protein value' do 
			expect(@food.protein).to eq(26)
		end 

		it 'has a protein value' do 
			expect(@food.carbs).to eq(0)
		end 

		it 'has a protein value' do 
			expect(@food.fat).to eq(2)
		end 

	end

	describe 'methods' do 

		it 'can calculate its calories per serving' do
			@food.calculate_food_kcal
			expect(@food.kcal).to eq(122)
		end 

		it 'can slug its name' do 
			expect(@food.slug).to eq("chicken-breast")
		end 

		it 'can find a food by its slug' do 
			expect(Food.find_by_slug("chicken-breast")).to eq(@food) 
		end 
	end 

end  