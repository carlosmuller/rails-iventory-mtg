class AddCodeSet < ActiveRecord::Migration[5.0]
  def change
    add_column :sets, :code, :string
    add_index :sets, :code
  end
end
