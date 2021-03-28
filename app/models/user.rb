class User < ActiveRecord::Base
    has_many :showings
    has_many :listings
    has_secure_password 
end 