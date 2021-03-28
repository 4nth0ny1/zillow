class ShowingsController < ApplicationController
    get "/showings/new" do 
        redirect_if_not_logged_in
        erb :'showings/new'
    end 
end