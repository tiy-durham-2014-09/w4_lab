class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def authenticate
    current_user_id = session[:current_user_id]
    unless current_user_id
      redirect_to new_login_path
    end
  end
end
