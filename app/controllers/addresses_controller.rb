class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update, :destroy]
  
  def index
    @addresses = Address.all
  end
  
  def new
    @address = current_user.addresses.build
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = current_user.addresses.build(address_params)
    
    respond_to do |format|
      if @address.save
        format.html { redirect_to addresses_path}
      else
        format.html {render action: "new"}
      end
    end
  end
  
  def update
    respond_to do |format|
      if @address.update_attributes(address_params)
        format.html { redirect_to addresses_path, notice: "Adres pomyślnie zatkualizowano"}
      else
        format.html { render action: "edit"}
      end
    end
  end
  
  def destroy
    @address.destroy
    redirect_to addresses_path, notice: "Adres usunięty"
  end
  
  private
  
  def set_address
    @address = Address.find(params[:id])
  end
  
  def address_params
    params.require(:address).permit(:designation, :name, :street, :other, :town, :country, :province, :postal_code)
  end
end