class CreateShowings < ActiveRecord::Migration[6.1]
  def change
    create_table :showings do |t|
      t.references :listing
      t.references :user
      t.string :appointment, null: false

      t.timestamps
    end
  end
end


