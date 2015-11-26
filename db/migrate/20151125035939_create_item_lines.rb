class CreateItemLines < ActiveRecord::Migration
  def change
    create_table :item_lines do |t|
      t.integer :cart_id
      t.integer :item_id
      t.integer :quantity, default: 0

      t.timestamps null: false
    end
  end
end
