class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
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
