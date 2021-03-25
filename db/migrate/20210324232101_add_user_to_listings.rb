class AddUserToListings < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :user, index: true
  end
end
