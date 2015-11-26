class Order < ActiveRecord::Base
  belongs_to :cart
  has_many :item_lines, through: :cart
  has_many :items, through: :cart

  def self.create_from_cart(cart)
    Order.create(cart_id: cart.id)
  end

  def change_order_status
    self.status = "submitted"
    self.save
  end

  def change_inventory
    self.item_lines.each do |line_item|
      item_lines.item.inventory -= item_lines.quantity
      item_lines.item.save
    end
  end
end
