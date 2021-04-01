class ListingsController < ApplicationController

    get "/listings/new" do 
        redirect_if_not_logged_in
        erb :'listings/new'
    end 

    get "/listings" do #index is implied 
        @listings = Listing.all
        erb :'listings/index'
    end 

    #create
    post '/listings' do
        redirect_if_not_logged_in
        listing = Listing.new(listing_description: params[:listing_description], address: params[:address], price: params[:price], features: params[:features], user: current_user)
        if listing.save
            redirect "/listings/#{listing.id}"
        else 
           
            flash[:info] = listing.errors.full_messages.to_sentence
            redirect "/listings/new"
        end
    end

    #read 

    get '/listings/:id' do
        @listing = Listing.find(params[:id])
        erb :'listings/show'
    end

    #update
    
    get '/listings/:id/edit' do 
        redirect_if_not_logged_in
        @listing = Listing.find(params[:id])
        erb :'listings/edit'
    end 

    patch "/listings/:id" do 
        listing = Listing.find(params[:id])
        if listing.user == current_user
            listing.update(listing_description: params[:listing_description], address: params[:address], price: params[:price], features: params[:features])
        end 
        redirect "/users/#{listing.user.id}"
    end 


    #delete

    delete '/listings/:id' do 
        @listing = Listing.find(params[:id])
        @listing.delete
        # session[:user_id] = nil
        redirect "/listings/new"
    end 




  


end