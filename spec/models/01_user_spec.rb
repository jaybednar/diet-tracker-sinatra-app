require_relative "../spec_helper"


describe User do 
	before(:each) do 
		@user = User.create(username: "jb", password: "jjj")
	end 

	it 'can be created and saved' do 
		expect(@user.valid?).to eq(true)
	end 

  describe 'attributes' do 

		it 'has a username' do 
			expect(@user.username).to eq("jb")
		end 

		it 'must have a username' do 
			@user = User.create(password: "jjj")
			expect(@user).to_not be_valid 
		end 

		it 'has a password' do 
			expect(@user.password).to eq("jjj")
		end 

		it 'must have a password' do 
			@user = User.create(username: "jb")
			expect(@user).to_not be_valid 
		end 
	end 

	describe "functions" do 
		before(:each) do 
			@user = User.create(username: "j c b", password: "jjj")
		end 

		it 'can slug a username' do 
			expect(@user.slug).to eq("j-c-b")
		end 

		it 'can find a user by its slug' do 
			expect(User.find_by_slug("j-c-b")).to eq(@user)
		end 
	end 

end 