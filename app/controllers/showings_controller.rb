class ShowingsController < ApplicationController
    get "/listings/:listing_id/showings/new" do 
        
        redirect_if_not_logged_in
        @listing = Listing.find(params[:listing_id])
        erb :'showings/new'
    end 

    post "/showings" do 
        showing = Showing.new(listing_id: params[:listing_id], user: current_user, appointment: params[:appointment])
        if showing.save 
            flash[:info] = "You have requested a showing at #{showing.listing.address}"
            redirect "/users/#{current_user.id}"
        else
            flash[:info] = showing.errors.full_messages.to_sentence
            redirect "/listings/#{showing.listing.id}/showings/new"
        end 
    end 
end


