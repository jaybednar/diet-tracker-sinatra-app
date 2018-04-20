require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ilovefood"
  end

  get "/" do
    determine_error_message
    if logged_in?
      @user = current_user
      redirect to "/users/#{session[:user_id]}"
    else  
      erb :'index'
    end 
  end

  helpers do 

  	def logged_in?
  		!!session[:user_id]
  	end 

  	def current_user 
  		User.find(session[:user_id])
  	end 

    def set_user
      @user = current_user
    end 

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/login?error=You must be logged in to do that"
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/users/#{current_user.id}"
      end 
    end 

    def redirect_if_current_user_is_not_object_user(current_user, user_trying_to_edit)
      if current_user != user_trying_to_edit
        redirect "/users/#{current_user.id}?error=You may not edit another user's meals and diets"
      end 
    end 

    def determine_error_message
      if params[:error]
        @error_message = params[:error]
      end 
      @error_message
    end 


  end 

end
