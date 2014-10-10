class LoginsController < ApplicationController
  def new
  end
  def create
    # @user = User.find_by(email: params[:email])
    # user = User.authenticate(params[:email], params[:password])
    # if @user && @user.authenticate(params[:password])
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = @user_id
      redirect_to root_path, notice: "You have successfully logged in."

    else
      flash.now[:error] = "Incorrect email or password."
      render :new
    end

    # if @user && @user.authenticate(params[:password])
    # else
    #   render :new
    # end
  end
  def destroy
    session[:current_user_id] = nil
    redirect_to root_url, :notice => "You have logged out!"
  end
end
