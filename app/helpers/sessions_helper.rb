module SessionsHelper
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
end
