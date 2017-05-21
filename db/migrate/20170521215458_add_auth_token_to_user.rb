class AddAuthTokenToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :public_api_key, :string
    add_index :users, :public_api_key, unique: true
  end
end
