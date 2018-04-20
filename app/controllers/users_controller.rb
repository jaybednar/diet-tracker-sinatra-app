class UsersController < ApplicationController

##### CREATE USER #####

  get "/users/new" do
    redirect_if_logged_in
    determine_error_message
    erb :'users/new.html'
  end


  post "/users" do
    if !params[:user][:username].empty? && !params[:user][:password].empty?
      @user = User.create(params[:user])
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else 
      redirect '/users/new?error=You must fill out all fields'
    end 
  end

##### LOGIN USER #####

  get "/session/new" do
    redirect_if_logged_in
    determine_error_message
    erb :"/users/login.html"
  end

  post '/session' do 
    if !params[:user][:username].empty? && !params[:user][:password].empty?
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect "/users/#{@user.id}"
      else 
        redirect to '/session/new?error=Username and Password do not match'
      end 
    else 
      redirect '/session/new?error=You must fill out all fields'
    end 
  end 


##### USER SHOW PAGE #####

  get "/users/:id" do
    redirect_if_not_logged_in 
    determine_error_message
    @user = User.find(params[:id])
    erb :"/users/show.html"
  end


##### EDIT USER (USERNAME/PASSWORD)

  # GET: /users/5/edit
  # get "/users/:id/edit" do
  #   erb :"/users/edit.html"
  # end

  # PATCH: /users/5
  # patch "/users/:id" do
  #   redirect "/users/:id"
  # end


##### LOGOUT USER #####

  delete '/session' do 
    redirect_if_not_logged_in
    session.clear
    redirect to '/'
  end 


##### DELETE USER #####

  # DELETE: /users/5/delete
  # delete "/users/:id/delete" do
  #   redirect "/users"
  # end

end
