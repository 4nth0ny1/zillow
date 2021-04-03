class StaticPagesController < ApplicationController
    get "/terms" do 
        erb :'static_pages/terms'
    end 
end 