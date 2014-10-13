class LoginsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:error] = "Your email or password was incorrect."
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to new_logins_path, notice: "Logged out!"
  end
end
