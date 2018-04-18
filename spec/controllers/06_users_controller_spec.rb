require_relative "../spec_helper"

describe UsersController do 

	describe '/signup' do 
		before(:each) do 
			visit '/signup'
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

	describe '/login' do 
		before(:each) do 
			visit '/login' 
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
end 