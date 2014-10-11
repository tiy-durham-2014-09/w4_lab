class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    current_user
  end

  def authenticate
    current_user_id = session[:current_user_id]
    unless current_user_id
      redirect_to new_session_path, notice: "You must be logged in to see that."
    end
  end

  # include SessionsHelper
  #
  # helper_method :current_user, :logged_in?
  #
  # private
  #
  # def sign_in(user)
  #   remember_token = User.new_remember_token
  #   cookies.permanent[:remember_token] = remember_token
  #   user.update_attribute(:remember_token, User.digest(remember_token))
  #   self.current_user = user
  # end
  #
  # def current_user=(user)
  #   @current_user = user
  # end
  #
  # def current_user
  #   remember_token = User.digest(cookies[:remember_token])
  #   @current_user ||= User.find_by(remember_token: remember_token)
  # end
  #
  # def signed_in?
  #   !current_user.nil?
  # end
  #
  # def sign_out
  #   # session[:remember_token] = nil
  #   # current_user_id = nil
  #   # current_user = nil
  #   # redirect_to root_url, :notice => "You have logged out!"
  #   # current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))
  #   # cookies.delete(:remember_token)
  #   session[:remember_token] = nil
  #   self.current_user_id = nil
  # end
  #
  # # def current_user
  # #   @current_user ||= User.find_by(id: session[:current_user_id])
  # # end
  # #
  # # def logged_in?
  # #   current_user
  # # end
  #
  # def authenticate
  #   # current_user_id = @user_id
  #   current_user_id = session[:remember_token]
  #   unless current_user_id
  #     redirect_to new_session_path, notice: "You must be logged in to see this."
  #   end
  # end
end
