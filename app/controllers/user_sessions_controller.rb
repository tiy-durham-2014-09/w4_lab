class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to lists_path
    else
      flash[:error] = "We were unable to log you in. Please double-check your email address and password and try again."
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
