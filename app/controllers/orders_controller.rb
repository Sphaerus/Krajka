class OrdersController < ApplicationController
  before_action :build_order, only: [:create]
  before_action :set_order, only: [:show, :update]
  before_action :assign_order_items, only: [:create]
  
  def index
    @orders = current_user.orders
  end
  
  def show
  end
  
  def create
    @order.assign_attributes(orders_params)
    
    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: "Dodano nowe zamówienie"}
      else
        format.html { redirect_to carts_path, alert: "#{display_errors(@order)}"}
      end
    end    
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
  
  def set_order
    @order = Order.find(params[:id])
  end
  
  def assign_order_items
    @order.order_items << current_user.cart.order_items
  end

  def orders_params
    params.require(:order).permit(:address_id, order_items_attributes: [:to_order, :id])
  end  
end