class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  has_many :orders

  def add_item(item_id)
    item = Item.find(item_id)
    line_item = LineItem.find_or_initialize_by({item_id: item.id, cart_id: self.id})
    line_item.quantity += 1
    line_item.tap(&:save)
  end

  def total
    self.line_items.inject(0) do |sum, line_item|
      sum = sum + (line_item.quantity * line_item.item.price)
    end
  end

end
