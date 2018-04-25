require_relative "../spec_helper"

def app
  ApplicationController
end

describe ApplicationController do
  before(:each) do 
    visit '/'
  end 

  it 'loads correctly' do 
    get '/'
    expect(last_response.status).to eq(200)
  end 

  it "responds with a welcome message" do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to include("Welcome to the Diet Tracker App!")
  end


end
