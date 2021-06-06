class RenameNoteColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :note, :introduction
    change_column :users, :introduction, :string
  end
end
