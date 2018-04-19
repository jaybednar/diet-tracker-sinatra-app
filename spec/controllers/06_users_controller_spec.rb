require_relative "../spec_helper"

describe UsersController do 

	describe 'signup' do 
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
	 	
	 	it "redirects to '/users/:id' after creating user"	do 
	 		fill_in 'username', with: 'jb'
	 		fill_in 'password', with: 'jjj'
	 		click_button 'create_account'
	 		@user = User.find_by(username: "jb")
	 		expect(page.current_path).to eq("/users/#{@user.id}")
	 	end 
	end 

	describe 'login' do 
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
	 	
	 	it "redirects to '/users/:id' after logging in"	do 
	 		@user = User.create(username: "jb", password: "jjj")
	 		fill_in 'username', with: 'jb'
	 		fill_in 'password', with: 'jjj'
	 		click_button 'login'
	 		expect(page.current_path).to eq("/users/#{@user.id}")
	 	end 
	end 

	describe 'user homepage' do 
		
		# session[:user_id] = @user.id
		before(:each) do 
			@user = User.create(username: "jb", password: "jjj")
			@diet = Diet.create(date: "4/18/18")
	  	@diet.user = @user
	  	@diet.save
	  	@user.save
			visit "users/#{@user.id}" 
		end

		it "responds with a 200 status code" do
	    expect(page.status_code).to eq(200)
	  end

	  it 'displays the username of the current user' do 
	  	expect(page.body).to include("#{@user.username}")
	  end 

	  it 'lists all of the current users diets' do 
	  	expect(page.body).to include("#{@user.diets.first.date}")
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

	describe 'logout' do 
		 before(:each) do 
		 	@user = User.create(username: "jb", password: "jjj")
		   visit "/users/#{@user.id}"
		 	 click_button 'logout'
		 end 

		 # it 'clears session' do 
		 # 		expect(session).to eq("{}")
		 # end 

		 it 'redirects to homepage' do 
		 		expect(page.current_path).to eq('/')
		 end 
	end 


end 