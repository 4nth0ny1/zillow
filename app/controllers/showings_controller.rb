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

    #status 
    post "/showings/:id/accepted" do 
        showing = Showing.find(params[:id])
        if showing.listing.user == current_user
            showing.update(status: "accepted")
            redirect "/users/#{current_user.id}"
        else 
            showing.update(status: "accepted")
            redirect "/users/#{showing.user.id}"
        end
    end 

    post "/showings/:id/cancelled" do 
        showing = Showing.find(params[:id])
        if showing.listing.user == current_user
            showing.update(status: "cancelled")
            redirect "/users/#{current_user.id}"
        else 
            showing.update(status: "cancelled")
            redirect "/users/#{showing.user.id}"
        end
        
    end 


    #update
    
    get '/showings/:id/edit' do 
        redirect_if_not_logged_in
        @showing = Showing.find(params[:id])
        erb :'showings/edit'
    end 

    patch "/showings/:id" do 
        showing = Showing.find(params[:id])
        if showing.user == current_user
            showing.update(appointment: params[:appointment])
            showing.update(status: "requested")
            redirect "/users/#{showing.user.id}"
        else
            showing.update(appointment:params[:appointment])
            showing.update(status: "requested")
            redirect "/users/#{current_user.id}"
        end 
        # redirect "/users/#{showing.user.id}"
    end 



    ## is there a way to delete the showing from the user's page without removing it from the other's page? the method created below was made to remove the showing, but it does too much. if a user decides to delete it the other user will wonder where it went. It could cause comminication issues. 
    ## if we just choose to not show it, and give them both the option to not show it, we will still have the issue of the showing existing in the database, but being irrelevant. Someone needs to delete it. Maybe we could set a status in the database to delete it if it is past due for a certain amount of days. 

    ##it's also not logging me out if i close the window. is there a way to logout automatically after a certain amount of time? 

    delete '/showings/:id' do 
        @showing = Showing.find(params[:id])
        @showing.destroy
        redirect "/users/#{current_user.id}"
    end 


end


