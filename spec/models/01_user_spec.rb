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

end 