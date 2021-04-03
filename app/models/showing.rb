class Showing < ActiveRecord::Base
    belongs_to :user
    belongs_to :listing
    validates :appointment, presence: true     
end 