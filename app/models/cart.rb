class Cart < ActiveRecord::Base
  has_many :item_lines
  has_many :items, through: :item_lines
  has_many :orders

  def add_item(item_id)
    item = Item.find(item_id)
    item_line = ItemLine.find_or_initialize_by({item_id: item.id, cart_id: self.id})
    item_line.quantity += 1
    item_line.tap(&:save)
  end

  def total
    self.item_lines.inject(0) do |sum, item_line|
      sum = sum + (item_line.quantity * item_line.item.price)
    end
  end

end
