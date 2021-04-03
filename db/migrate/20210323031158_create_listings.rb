class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :listing_description
      t.string :address
      t.string :price 
      t.string :features 

      t.timestamps
    end  
  end
end
