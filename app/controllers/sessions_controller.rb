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
        if user && user.authenticate(params[:password])  #authenticate is a bcrypt meth.  ## checks if user email/password exists

            session[:user_id] = user.id           ## sets the cookie
            if session[:url]                      ## if the cookie has a url in it
                url = session[:url]                 ## saves the url in variable
                session[:url] = nil                 ## clearing the cookie, so that the user goes back to the page they wanted originally, before the signin/signup
                redirect url                        ## redirecting to the url in the variable
            else 
                redirect "/users/#{user.id}"
            end
        else 
            flash[:info] = "incorrect email or password"
            redirect "/signin" 
        end
    end 
end