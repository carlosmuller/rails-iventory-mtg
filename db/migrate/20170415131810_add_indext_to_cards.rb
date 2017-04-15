class AddIndextToCards < ActiveRecord::Migration[5.0]
  def change
    add_index :cards, :sets, using: 'gin'
    add_index :cards, :type, using: 'gin'
    add_index :cards, :subtype, using: 'gin'
    add_index :cards, :colors, using: 'gin'
    add_index :cards, :name
  end
end
