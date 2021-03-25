class RemoveRealtors < ActiveRecord::Migration[6.1]
  def change
    drop_table :realtors
  end
end
