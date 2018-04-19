require_relative "../spec_helper"

describe FoodsController do 

	describe '/foods/new' do 
		before(:each) do 
			visit '/foods/new' 
		end 

		it "responds with a 200 status code" do
	    expect(page.status_code).to eq(200)
	  end

	  it 'has a title of Add New Food' do 
	  	expect(page.body).to include("<h1>Add New Food</h1>")
	  end 

	  it 'has a form to create new account' do 
	  	expect(page.body).to include("<form")
	  	expect(page.body).to include("</form>")
	 	end 

	 	it 'has and input for food name' do 
	 		expect(page).to have_css('input#name')
	 	end 

	 	it 'has and input for food serving size' do 
	 		expect(page).to have_css('input#serving_size')
	 	end 

	 	it 'has and input for food protein' do 
	 		expect(page).to have_css('input#protein')
	 	end 

	 	it 'has and input for food carbs' do 
	 		expect(page).to have_css('input#carbs')
	 	end 

	 	it 'has and input for food fat' do 
	 		expect(page).to have_css('input#fat')
	 	end 

	 	it 'has and input to submit' do 
	 		expect(page).to have_css('input#add_food')
	 	end 
	end 

	describe '/foods' do 
		before(:each) do 
			@food1 = Food.create(name: "Chicken Breast", serving_size: "4 oz", protein: 26, carbs: 0, fat: 2)
			@food1.calculate_food_kcal
			@food2 = Food.create(name: "Jasmine Rice", serving_size: "1/2 cup", protein: 2, carbs: 22, fat: 0)
			@food2.calculate_food_kcal
			@food3 = Food.create(name: "Avocado Oil", serving_size: "1 tbsp", protein: 0, carbs: 0, fat: 14)
			@food3.calculate_food_kcal
			visit '/foods'
		end 

		it "responds with a 200 status code" do

	    expect(page.status_code).to eq(200)
	  end

	  it 'lists out all foods in database' do 
	  	expect(page.body).to include("#{Food.first.name}")
	  	expect(page.body).to include("#{Food.first.serving_size}")
	  	expect(page.body).to include("#{Food.first.protein}")
	  	expect(page.body).to include("#{Food.first.carbs}")
	  	expect(page.body).to include("#{Food.first.fat}")
	  end 

	end 

end 