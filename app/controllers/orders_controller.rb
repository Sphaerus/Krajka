class OrdersController < ApplicationController
  before_action :build_order, only: [:create]
  before_action :set_order, only: [:show, :update, :confirm_order_by_user]
  before_action :assign_order_items, only: [:create]
  
  def index
    @orders = current_user.orders
    authorize @orders
  end
  
  def show
    authorize @order
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
    authorize @order
    respond_to do |format|
      if @order.update_attributes(orders_params)
        format.html { redirect_to @order, notice: "Zamówienie zostało zaktualizowane"}
      else
        format.html { render action: "show", alert: "#{display_errors(@order)}"}
      end  
    end
  end
  
  def confirm_order_by_user
    authorize @order
    @order.order!
    
    respond_to do |format|
      format.html {redirect_to order_path(@order), notice: "Potwierdziłeś zamówienie"}
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
    params.require(:order).permit(:address_id, :payment_date, order_items_attributes: [:to_order, :id])
  end  
end