# require_relative "../spec_helper"

# describe DietsController do 

# 	describe '/diets/:id' do 
# 		before(:each) do 
# 			@diet = Diet.create
# 			visit '/diets/new' 
# 		end 

# 		it "responds with a 200 status code" do
# 	    expect(page.status_code).to eq(200)
# 	  end

# 	  it 'lists all meals currently in diet' do 
# 	  	expect(page.body).to include(@diet.meal.first.name)
# 	  end 

# 	  it 'lists total macros and calories for the day'

# 	  it 'has a form to create and add new meal'

# 	  it 'has a button to edit current diet' do 
# 	  	expect(page).to have_css('input#edit_diet')
# 	  end 

# 	  it 'has a button to delete current diet' do 
# 	  	expect(page).to have_css('input#delete_diet')
# 	  end 

# 	  it 'has a button to return to user homepage' do 
# 	  	expect(page).to have_css('input#user_homepage')
# 	  end 
# 	end 
# end 