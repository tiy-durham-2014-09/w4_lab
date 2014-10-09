class LoginsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "You are logged in!"
    else
      flash.now[:error] = "Sorry, try again!"
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_login_path, notice: "You have been logged out."
  end
end
