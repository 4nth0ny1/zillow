require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash     ## allows flash messages for errors and omissions with forms.


  configure do
    set :public_folder, 'public'      
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV['SESSION_SECRET']
    set :method_override, true
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] #finding current user if user exists
    end

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        session[:url] = request.path  ## storing url that they were trying to go to for use later on. 
        redirect '/signin'
      end  
    end

  end


end
