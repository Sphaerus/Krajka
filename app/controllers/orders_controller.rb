class OrdersController < ApplicationController
  before_action :build_order, only: [:create]
  before_action :find_order_items, only: [:create]
  before_action :set_order, only: [:show, :update]
  
  def index
    @orders = current_user.orders
  end
  
  def show
  end
  
  def create
    @order.save
    assign_order_items_to_order
    redirect_to orders_path, notice: "Dodano nowe zamówienie"
  end
  
  def update
    @order.order!
    
    redirect_to do |format|
      format.html {redirect_to order_path(@order)}
    end
  end
  
  private
  
  def build_order
    @order = current_user.orders.build
  end
  
  def find_order_items
    @order_items = []
    params[:order][:order_items_attributes].each do |number, hash|
      @order_items << OrderItem.find(hash[:id]) if hash[:to_order] == "1"
    end
  end
  
  def assign_order_items_to_order
    @order_items.map{|order_item| order_item.order = @order }
    @order_items.map(&:save)
  end
  
  def set_order
    @order = Order.find(params[:id])
  end
end