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
    self.item_lines.each do |item_line|
      item_line.item.inventory -= item_line.quantity
      item_line.item.save
    end
  end
end
