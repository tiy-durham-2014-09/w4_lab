class ListsController < ApplicationController
  before_action :authenticate
  before_action :set_list, only: [:show, :show_done, :edit, :update, :destroy]
  before_action :ensure_user_owns_list, only: [:show, :edit, :update, :destroy]


  # GET /lists
  def index
    @lists = current_user.lists
  end

  # GET /lists/1
  def show
    @list = List.find_by_id(params[:id])
  end

  # GET /lists/1/show_done   !!! except it's doing GET /list/show_done.1
  def show_done
    # @list = List.find_by_id(params[:id])
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /lists/1
  def update
    if @list.update(list_params)
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: 'List was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    def ensure_user_owns_list
      if current_user != @list.user
        redirect_to root_path, notice: "That's not your List."
        # !!! insert notice
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :user_id)
    end
end
