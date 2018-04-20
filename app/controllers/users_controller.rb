class UsersController < ApplicationController

##### CREATE USER #####

  get "/users/new" do
    redirect_if_logged_in
    determine_error_message
    erb :'users/new.html'
  end


  post "/users" do
    if @user = User.find_by(username: params[:user][:username])
      redirect to "/users/new?error=This username is not available"
    end 
    if !params[:user][:username].empty? && !params[:user][:password].empty?
      @user = User.create(params[:user])
      session[:user_id] = @user.id 
      redirect "/users/#{@user.id}"
    else 
      redirect '/users/new?error=You must fill out all fields'
    end 
  end

##### LOGIN USER #####

  get "/login" do
    redirect_if_logged_in
    determine_error_message
    erb :"/users/login.html"
  end

  post '/login' do 
    if !params[:user][:username].empty? && !params[:user][:password].empty?
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id 
        redirect "/users/#{@user.id}"
      else 
        redirect to '/login?error=Username and Password do not match'
      end 
    else 
      redirect '/login?error=You must fill out all fields'
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


  get "/users/:id/edit" do
    redirect_if_not_logged_in
    @user = User.find(params[:id])
    redirect_if_current_user_is_not_object_user(current_user, @user)
    erb :"/users/edit.html"
  end


  patch "/users/:id" do
    @user = User.find(params[:id])
    @user.update(params[:user])
    redirect "/users/#{@user.id}"
  end


##### LOGOUT USER #####

  get '/logout' do 
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
