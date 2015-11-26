class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string "title"
      t.integer "price"
      t.integer "inventory"

      t.timestamps null: false
    end
  end
end
