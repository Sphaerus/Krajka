class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  
  rescue_from Pundit::NotAuthorizedError, with: :denied_access
  
  def denied_access
    respond_to do |format|
      if user_signed_in?
        format.html { redirect_to root_path, alert: "You are not authorized to perform this action" }
      else
        format.html { redirect_to root_path, notice: "Log in"}  
      end  
    end  
  end
  
  def display_errors(object)
    error_string = ""
    if object.errors
      object.errors.messages.each do |field, reasons|
        reasons.each do |reason|
          error_string << "#{field} #{reason} \n"
        end
      end
    end
    return error_string
  end
end
