class Showing < ActiveRecord::Base
    belongs_to :user
    # has_many :showings, through :listings
end 