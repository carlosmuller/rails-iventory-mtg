class AddUniqeToUser < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
  end
end
