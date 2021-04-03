class User < ActiveRecord::Base
    has_many :showings, dependent: :destroy        
    has_many :listings, dependent: :destroy
    has_secure_password 
    validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/, message: "bad format, must be: XXX-XXX-XXXX" } # https://stackoverflow.com/questions/18879474/new-to-ruby-on-rails-looking-for-a-phone-number-validation    ##added a format for the phone and a message 
    validates :name, :email, :phone_number, presence: true       ### added validation for User object
end 