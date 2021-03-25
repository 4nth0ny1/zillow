class ListingsController < ApplicationController

    get "/listings/new" do 
        erb :'listings/new'
    end 

    get "/listings" do #index is implied 
        @listings = Listing.all
        erb :'listings/index'
    end 

    #create
    post '/listings' do
        listing = Listing.create(listing_description: params[:listing_description], address: params[:address], price: params[:price], features: params[:features], user: current_user)
        
        # session[:listing_id] = listing.id
        redirect "/listings/#{listing.id}"
    end

    #read 

    get '/listings/:id' do
        @listing = Listing.find(params[:id])
        erb :'listings/show'
    end


    #update
    
    get '/listings/:id/edit' do 
        @listing = Listing.find(params[:id])
        erb :'listings/edit'
    end 

    patch "/listings/:id" do 
        listing = Listing.find(params[:id])
        listing.update(listing_description: params[:listing_description], address: params[:address], price: params[:price], features: params[:features])
        redirect "/listings/#{listing.id}"
    end 


    #delete

    delete '/listings/:id' do 
        @listing = Listing.find(params[:id])
        @user.delete
        # session[:user_id] = nil
        redirect "/create_listing"
    end 


    
  


end