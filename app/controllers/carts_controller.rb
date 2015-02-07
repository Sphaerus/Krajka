class CartsController < ApplicationController
  before_action :set_cart, only:[:index]
  before_action :set_order, only:[:index] 
  before_action :build_order_items_for_order, only:[:index]
  
  def index
  end
  
  private
  
  def set_cart
    @cart = current_user.cart
  end
  
  def set_order
    @order = @cart.orders.build
  end
  
  def build_order_items_for_order
    @cart.order_items_without_order.each do |order_item| 
      @order.order_items << order_item
    end  
  end
end