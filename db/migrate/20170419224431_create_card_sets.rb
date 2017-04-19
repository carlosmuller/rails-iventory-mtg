class CreateCardSets < ActiveRecord::Migration[5.0]
  def change
    create_table :card_sets do |t|
      t.integer :mid
      t.belongs_to :card, index: true
      t.belongs_to :sets, index: true
      t.timestamps
    end
  end
end
