class User < ActiveRecord::Base
    has_many :showings
    has_many :listings
    has_secure_password 
    validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format, must be: XXX-XXX-XXXX" } # https://stackoverflow.com/questions/18879474/new-to-ruby-on-rails-looking-for-a-phone-number-validation
    validates :name, :email, :phone_number, presence: true
end 