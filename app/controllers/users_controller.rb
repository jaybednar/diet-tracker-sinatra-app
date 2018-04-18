class UsersController < ApplicationController

  # GET: /users/new
  get "/users/new" do
    # binding.pry
    if logged_in?
      @user = User.find(session[:user_id])
      redirect "/users/#{@user.id}"
    else 
      erb :"/users/new.html"
    end 
  end

  # POST: /users
  post "/users" do
    binding.pry
    if logged_in?
      @user = User.find(session[:user_id])
      redirect "/users/#{@user.id}"
    elsif !params[:user][:username].empty? && !params[:user][:password].empty?
      @user = User.create(params[:user])
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else 
      redirect '/users/new'
    end 
  end

   
  get "/session/new" do
    erb :"/users/login.html"
  end

  # GET: /users/5
  get "/users/:id" do
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  delete '/session' do 
    session.clear
  end 

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

  get '/logout' do 
    session.clear 
    redirect to '/'
  end 

end
