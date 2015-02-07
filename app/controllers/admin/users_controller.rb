class Admin::UsersController < ApplicationController
  before_filter :set_all_users, only: [:index]
  before_filter :set_user, only: [:edit, :update]
  
  def index    
  end
  
  def edit
  end
  
  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to admin_users_path, notice: "Konto uzytkownika zostało zmodyfikowane"}
      else
        format.html { render action: :edit, notice: "Edytowanie uzytkownika nie powiodło się"}
      end
    end
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def set_all_users
    @users = User.all
  end
  
  def user_params
    params.require(:user).permit(:coordinator, :admin)
  end
end