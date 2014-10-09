class LoginsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path
      # insert notice
    else
      # insert alert
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    # insert notice
    redirect_to new_login_path
  end
end
