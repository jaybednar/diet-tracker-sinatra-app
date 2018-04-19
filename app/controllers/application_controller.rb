require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ilovefood"
  end

  get "/" do
    if logged_in?
      redirect to "/users/#{session[:user_id]}"
    else  
      erb :index
    end 
  end

  helpers do 

  	def logged_in?
  		!!session[:user_id]
  	end 

  	def current_user 
  		User.find(session[:user_id])
  	end 

    def redirect_if_not_logged_in
      if !logged_in?
        redirect "/session/new?error=You have to be logged in to do that"
      end
    end

    def redirect_if_current_user_is_not_object_user
      redirect "/users/#{current_user.id}?error=You may not edit another user's meals and diets"
    end 

  end 

end
