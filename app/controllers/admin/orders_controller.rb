class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:update]
  before_action :set_all_orders, only: [:all_orders]
  before_action :set_user, only: [:index]
  
  def index
    @orders = @user.orders
  end
  
  def all_orders
  end
  
  def update
    @order.confirmed = params[:confirmed]
    @order.save
    
    respond_to do |format|
      format.html { redirect_to admin_orders_path }
    end  
  end
  
  private
  
  def set_order
    @order = Order.find(params[:id])
  end
  
  def set_user
    @user = User.find(params[:user_id])
  end
  
  def set_all_orders
    @orders = Order.all
  end
end