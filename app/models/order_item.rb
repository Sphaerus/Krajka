class OrderItem < ActiveRecord::Base
  attr_accessor :to_order
  
  belongs_to :cart
  belongs_to :order
  belongs_to :magazine
  
  def display_price
    full_price = amount * magazine.price
    "#{full_price} PLN"
  end
end
