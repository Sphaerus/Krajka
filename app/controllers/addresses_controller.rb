class AddressesController < ApplicationController
  def index
    @addresses = Address.all
  end
  
  def new
    @address = current_user.addresses.build
  end
end