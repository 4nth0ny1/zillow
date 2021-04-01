class AddStatusToShowings < ActiveRecord::Migration[6.1]
  def change
    add_column :showings, :status, :string, default: "requested"
  end
end
