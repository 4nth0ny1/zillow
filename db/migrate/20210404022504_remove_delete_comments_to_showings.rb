class RemoveDeleteCommentsToShowings < ActiveRecord::Migration[6.1]
  def change
    remove_column :showings, :delete_comments, :string
  end
end
