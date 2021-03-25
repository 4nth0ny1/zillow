class UsersController < ApplicationController
    get "/users/new" do 
        erb :'users/new'
    end 

    post '/users' do
        user = User.create(email: params[:email], name: params[:name], phone_number: params[:phone_number], password: params[:password], password_confirmation: params[:password_confirmation])
        
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
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