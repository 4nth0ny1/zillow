class AddNullConstraintToListings < ActiveRecord::Migration[6.1]
  def change
    change_column_null :listings, :listing_description, false
    change_column_null :listings, :address, false
    change_column_null :listings, :price, false
    change_column_null :listings, :features, false

  end
end
