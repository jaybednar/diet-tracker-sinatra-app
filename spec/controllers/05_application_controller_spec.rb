require_relative "../spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  before(:each) do 
    visit '/'
  end 

  it "responds with a welcome message" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Welcome to the Diet Tracker App!")
  end

  it 'has a button to create a new account' do 
  	expect(page).to have_css('input#new_account')
   
  end 

  it 'redirects you to the New User form page' do 
    click_button 'new_account'
  	expect(page.current_path).to eq("/users/new")
  end 

  it 'has a button to login for existing users' do
  	expect(page).to have_css('input#login')
  end 

  it 'redirects you to the login form page' do 
    click_button 'login'
  	expect(page.current_path).to eq("/session/new")
  end 

end
