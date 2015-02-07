class OrderItemsController < ApplicationController
  before_action :set_magazine, only: [:create]
  
  def create
    @order_item = current_user.cart.order_items.build(order_item_params)
    
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to carts_path, notice: "Nowy produkt dodany do koszyka"}
      else
        format.html { redirect_to magazine_path(@magazine), notice: "Nie udało się dodać produktu do koszyka:("}
      end
    end
  end
  
  private
  
  def set_magazine
    @magazine = Magazine.find(params[:order_item][:magazine_id])
  end
  
  def order_item_params
    params.require(:order_item).permit(:magazine_id, :amount)
  end
end