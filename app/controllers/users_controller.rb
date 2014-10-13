class UsersController < ApplicationController
  # before_action :set_users, only: [:show, :edit, :update, :destroy]
  # before_action :ensure_user_cant_visit_users

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
