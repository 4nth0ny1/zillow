class SessionsController < ApplicationController
    get '/signout' do 
        session[:user_id] = nil
        redirect '/users/new'
    end 

    get '/signin' do 
        erb :'sessions/signin'
    end

    post '/signin' do 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])  #authenticate is a bcrypt meth
            session[:user_id] = user.id
            if session[:url]
                url = session[:url]
                session[:url] = nil
                redirect url
            else 
                redirect "/users/#{user.id}"
            end
        end
    end 
end