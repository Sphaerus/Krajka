class MagazinesController < ApplicationController
  
  def index
    @magazines = Magazine.all
  end
  
  def show
    @magazine = Magazine.find(params[:id])
    @order_item = OrderItem.new
  end
  
  def new
    @magazine = Magazine.new
  end
  
  def edit
    @magazine = Magazine.find(params[:id])
  end
  
  def create
    @magazine = Magazine.new(magazine_params)
    
    respond_to do |format|
      if @magazine.save
        format.html {redirect_to magazines_path}
      else
        format.html {render "new", notice: "Podałeś nieprawdziwe dane"}
      end
    end
  end
  
  def update
    @magazine = Magazine.find(params[:id])
    
    respond_to do |format|
      if @magazine.update_attributes(magazine_params)
        format.html {redirect_to magazines_path}
      else
        format.html {render "edit", notice: "Podałeś nieprawdziwe dane"}
      end
    end
  end
  
  def destroy
    @magazine = Magazine.find(params[:id])
    
    @magazine.destroy
    redirect_to magazines_path
  end
  
  
  
  private
  
  def magazine_params
    params.require(:magazine).permit(:date, :title, :description, :price, :cover, :cover_cache)
  end
end