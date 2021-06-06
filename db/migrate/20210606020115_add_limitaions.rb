class AddLimitaions < ActiveRecord::Migration[5.2]
  def change
    change_column :books, :body, :string, :limit => 200
    change_column :users, :name, :string, :limit => 20
    add_index :users, :name, unique: true
    change_column :users, :introduction, :string, :limit => 50
  end
end
