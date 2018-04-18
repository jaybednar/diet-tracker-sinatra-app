require_relative "../spec_helper"

describe UsersController do 

	describe 'GET /users/new' do 
		before(:each) do 
			visit '/users/new'
		end 

		it "responds with a 200 status code" do
	    expect(page.status_code).to eq(200)
	  end

	  it 'has the title of Create New Account' do 
	  	expect(page.body).to include("<h1>Create New Account</h1>")
	  end 

	  it 'has a form to create new account' do 
	  	expect(page.body).to include("<form")
	  	expect(page.body).to include("</form>")
	 	end 
	 	
	 	it "sends a post request to '/users'"	do 
	 		fill_in 'username', with: 'jb'
	 		fill_in 'password', with: 'jjj'
	 		click_button 'create_account'
	 		expect(page.current_path).to eq('/users')
	 	end 
	end 

	describe 'GET /session/new' do 
		before(:each) do 
			visit '/session/new' 
		end 

		it "responds with a 200 status code" do
	    expect(page.status_code).to eq(200)
	  end

	  it 'has the title of Login' do 
	  	expect(page.body).to include("<h1>Login</h1>")
	  end

	  it 'has a form to login' do 
	  	expect(page.body).to include("<form")
	  	expect(page.body).to include("</form>")
	 	end 
	 	
	 	it "sends a post request to '/login'"	do 
	 		fill_in 'username', with: 'jb'
	 		fill_in 'password', with: 'jjj'
	 		click_button 'login'
	 		expect(page.current_path).to eq('/login')
	 	end 
	end 

	describe 'GET users/show' do 

		it "responds with a 200 status code" do
	    expect(page.status_code).to eq(200)
	  end

	  it 'displays the username of the current user' do 
	  	expect(page.body).to include("#{current_user.username}")
	  end 

	  it 'lists all of the current users diets' do 
	  	expect(page.body).to include("#{current_user.diets.first.date}")
	  end 

	  it 'has a button to create a new diet' do 
	  	expect(page).to have_css('input#new_diet')
	  end 

	  it 'has a button to add a new food' do 
	 		 expect(page).to have_css('input#new_food')
	 	end 

	  it 'has a button to logout' do 
	  	expect(page).to have_css('input#logout')
	  end 

	end 


end 