require_relative "../spec_helper"

describe Foodscontroller do 

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

		it "responds with a 200 status code" do
	    expect(page.status_code).to eq(200)
	  end

	  it 'lists out all foods in database' 
	  	expect(page.body).to include("#{Food.first.name}")
	  	expect(page.body).to include("#{Food.first.serving_size}")
	  	expect(page.body).to include("#{Food.first.protein}")
	  	expect(page.body).to include("#{Food.first.carbs}")
	  	expect(page.body).to include("#{Food.first.fat}")
	  end 

	end 

end 