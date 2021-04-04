class AddDeleteCommentToShowings < ActiveRecord::Migration[6.1]
  def change
    add_column :showings, :delete_comment, :string
  end
end
