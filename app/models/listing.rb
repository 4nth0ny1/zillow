class Listing < ActiveRecord::Base
    belongs_to :user
    has_many :showings
    validates :listing_description, :address, :price, :features, presence: true
end 