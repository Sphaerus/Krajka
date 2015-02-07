class OrderItem < ActiveRecord::Base
  attr_accessor :to_order
  
  belongs_to :cart
  belongs_to :order
  belongs_to :magazine
  
  before_save :nullify_cart_id
  before_save :nullify_order_id
  
  def display_price
    full_price = amount * magazine.price
    "#{full_price} PLN"
  end
  
  private
  
  def nullify_cart_id
    if order_id && self.to_order == "1"
      self.cart_id = nil
    end
  end
  
  def nullify_order_id
    if self.order_id && self.to_order == "0"
      self.order_id = nil
    end
  end
end
