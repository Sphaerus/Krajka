class OrderItemsController < ApplicationController
  before_action :set_magazine, only: [:create]
  before_action :set_order_item, only: [:destroy]
  
  def create
    @order_item = current_user.cart.order_items.build(order_item_params)
    
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to magazines_path, notice: "Nowy produkt dodany do koszyka"}
      else
        format.html { redirect_to magazine_path(@magazine), notice: "Nie udało się dodać produktu do koszyka:("}
      end
    end
  end
  
  def destroy
    @order_item.destroy
    redirect_to carts_path, alert: "Przedmiot usunięty z koszyka"
  end
  
  private
  
  def set_order_item
    @order_item = OrderItem.find(params[:id])
  end
  
  def set_magazine
    @magazine = Magazine.find(params[:order_item][:magazine_id])
  end
  
  def order_item_params
    params.require(:order_item).permit(:magazine_id, :amount)
  end
end