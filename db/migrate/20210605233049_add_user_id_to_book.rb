class AddUserIdToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :user_id, :Integer, :default => 0, :null => false
  end
end
