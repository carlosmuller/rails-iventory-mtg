class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.text :text
      t.string :cost
      t.string :sets, array: true, default: []
      t.string :subtype, array: true, default: []
      t.string :type, array: true, default: []
      t.integer :mid, array: true, default: []
      t.string :colors, array: true, default: []
      t.timestamps
    end
  end
end
