class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "You have successfully logged in."
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_session_path, notice: "You have logged out"
  end
end
