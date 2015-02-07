class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :order_items
  has_many :orders
  
  def order_items_without_order
    order_items.where(order_id: nil)
  end
end
