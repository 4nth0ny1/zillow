class UsersController < ApplicationController
    get "/users/new" do 
        erb :'users/new'
    end 

    post '/users' do
        user = User.new(email: params[:email], name: params[:name], phone_number: params[:phone_number], password: params[:password], password_confirmation: params[:password_confirmation])
        if user.save 
            session[:user_id] = user.id  ## this keeps track of who is logged in
            if session[:url]
                url = session[:url]
                session[:url] = nil
                redirect url
            else 
                redirect "/users/#{user.id}"
            end
        else
            flash[:info] = user.errors.full_messages.to_sentence
            redirect "/users/new"
        end    
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        listing_ids = @user.listings.pluck(:id)
        @showings = Showing.where(listing_id: listing_ids)
        erb :'users/show'
    end


    #update 
    get '/users/:id/edit' do 
        @user = User.find(params[:id])
        erb :'users/edit'
    end 

    patch '/users/:id' do 
        user = User.find(params[:id])
        user.update(email: params[:email], name: params[:name], phone_number: params[:phone_number])
        redirect "/users/#{user.id}"
    end 


    
    #delete    
    delete '/users/:id' do 
        user = User.find(params[:id])
        user.destroy
        session[:user_id] = nil
        redirect to "/users/new"
    end 

        
end