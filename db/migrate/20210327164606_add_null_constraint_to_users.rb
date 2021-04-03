class AddNullConstraintToUsers < ActiveRecord::Migration[6.1]
  def change
    ## didn't add db constraint when creating table.
    change_column_null :users, :name, false              
    change_column_null :users, :email, false
    change_column_null :users, :phone_number, false
    change_column_null :users, :password_digest, false

  end
end
