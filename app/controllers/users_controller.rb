class UsersController < ApplicationController
    get "/users/new" do 
        # validates :attribute, phone: true
        erb :'users/new'
    end 

    post '/users' do
        user = User.new(email: params[:email], name: params[:name], phone_number: params[:phone_number], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.save 
            session[:user_id] = user.id  ## this keeps track of who is logged in
            redirect "/users/#{user.id}"
        else
            flash[:info] = "Please fill in every box."
            redirect "/users/new"
        end    
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end


        #update 
        get '/users/:id/edit' do 
            @user = User.find(params[:id])
            erb :'users/edit'
        end 
    
        patch '/users/:id' do 
            user = User.find(params[:id])
            user.update(email: params[:email], name: params[:name], phone_number: params[:phone_number], email: params[:email])
            redirect "/users/#{user.id}"
        end 
    
    
        #delete    
    
        delete '/users/:id' do 
            user = User.find(params[:id])
            user.delete
            session[:user_id] = nil
            redirect to "/users/new"
        end 

        
end